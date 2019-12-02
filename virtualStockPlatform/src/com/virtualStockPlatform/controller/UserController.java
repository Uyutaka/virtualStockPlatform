package com.virtualStockPlatform.controller;

import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.virtualStockPlatform.entity.Stock;
import com.virtualStockPlatform.entity.Property;
import com.virtualStockPlatform.entity.User;
import com.virtualStockPlatform.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	// need to inject user service
	@Autowired
	private UserService userService;

	@GetMapping("/list")
	public String listCustomers(Model theModel) {
		// get users from the service
		List<User> theUsers = userService.getUsers();

		// add the users to the model
		theModel.addAttribute("users", theUsers);

		return "list-users";
	}

	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		// create model attribute to bind form data
		User theUser = new User();
		theModel.addAttribute("user", theUser);
		return "user-form";
	}

	@PostMapping("/saveUser")
	public String saveCustomer(@ModelAttribute("user") User theUser) {

		// save the customer using our service
		userService.saveUser(theUser);

		return "redirect:/user/list";
	}

	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("userId") int theId, Model theModel) {
		// get the user from the db
		User theUser = userService.getUser(theId);
		// set user as a model attribute to pre-populate the form
		theModel.addAttribute("user", theUser);
		// send over to form
		return "user-form";
	}

	@GetMapping("/delete")
	public String deleteUser(@RequestParam("userId") int theId) {
		// delete the user
		userService.deleteUser(theId);
		return "redirect:/user/list";
	}

	@GetMapping("/test")
	public String test() {
		String json = getJson();
		showData(json);
		return "test-json";

	}

	@GetMapping("/profile")
	public String showProfile(Model theModel) {
		// get users from the service
		List<User> theUsers = userService.getUsers();
		// TODO temporally use the user of index 0
		//      Please change it to the current user.
		User tmpUser = theUsers.get(0);

		// add the user to the model
		theModel.addAttribute("user", tmpUser);
		return "user-profile";
	}
		
	// Get and return Json(String)
	// TODO 
	// 1) Add parameters (company name (or symbol) and success, error handlers)
	// 2) Remove hard-coded url
	private String getJson() {
		// Reference
		// https://www.leveluplunch.com/java/tutorials/015-consuming-rest-webservice-with-spring-resttemplate/
		// Reference // https://www.baeldung.com/spring-rest-template-list
		String text = "";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.getForEntity(
				"https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=1min&apikey=ACPN4KEH4052XAQ6",
				String.class);

		if (HttpStatus.OK == response.getStatusCode()) {
			text = response.getBody().toString();
		} else {
			System.out.println("Error");
		}
		return text;
	}

	// Show the time and prices
	// TODO
	// 1) Add parameters (Success, error handlers)
	// 2) Return time and price.
	private void showData(String jsonInString) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			// JSON string to Java object
			Stock stock = mapper.readValue(jsonInString, Stock.class);
			String stockName = stock.getMetaData().getName();
			System.out.println("stockName is : " + stockName);
			System.out.println(stock.getTimeSeries().entrySet().iterator().next());

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// Test get list
	@GetMapping("/test1")
	public String listPropertiess(Model theModel) {
		List<Property> res = userService.getProperties(1);
		return "test-json";
	}
	
	// Test get list
	@GetMapping("/test2")
	public String listSumOfStocks(Model theModel) {
		List<Property> res = userService.getProperties(1);
		userService.getSumOfStocks(res);
		return "test-json";
	}
	
	
}
