package com.virtualStockPlatform.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import com.virtualStockPlatform.api.Api;
import com.virtualStockPlatform.entity.Price;
import com.virtualStockPlatform.entity.Property;
import com.virtualStockPlatform.entity.Stock;
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

		// Get all comapany's stock prices
		Api api = new Api();
		HashMap<String, Double> priceMap = api.getAllPrices();

		// store users' sum of stocks
		List<Double> theSumOfStocks = new ArrayList<Double>();
		
		if (!api.isError(priceMap)) {
			for (int i = 0; i < theUsers.size(); i++) {
				double price = 0;
				List<Property> prop = userService.getProperties(theUsers.get(i).getId());
				for (int j = 0; j < prop.size(); j++) {
					if (priceMap.containsKey(prop.get(j).getStockName())) {
						price += priceMap.get(prop.get(j).getStockName()) * prop.get(j).getNumStocks();
					}
				}
				theSumOfStocks.add(price);
			}
		}else {
			System.out.println("Error happens");
		}

		// add the users to the model
		theModel.addAttribute("users", theUsers);
		theModel.addAttribute("sumOfStocks", theSumOfStocks);

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
	
	@GetMapping("/symbolCheck")
	public String symbolCheck(@RequestParam("userId") int theId, Model theModel) {
		// get the user from the db
		User theUser = userService.getUser(theId);
		// set user as a model attribute to pre-populate the form
		theModel.addAttribute("user", theUser);
		return "symbol-check";
	}
	
//	@GetMapping("/sell")
//	public String sellStock(@RequestParam("userId") int theId, 
//			@RequestParam("stockName") String stockName, Model theModel) {
//		// get the user from the db
//		User theUser = userService.getUser(theId);
//		// set user as a model attribute to pre-populate the form
//		System.out.println(theId);
//		System.out.println(stockName);
//		theModel.addAttribute("user", theUser);
//		return "sell-stock";
//	}
	
	@GetMapping("/sellStock")
	public String sellStock(Model theModel) {
		// get the user from the database
		User theUser = userService.getUser(1);
		// Get the property based on the id and stock name.
		Property property = userService.getProperty(1, "GOOG");
		// Get the Stock information and price
		Stock stock = getStockByName("GOOG");
		Price price = stock.getTimeSeries().entrySet().iterator().next().getValue();
		// set user as a model attribute to pre-populate the form
		theModel.addAttribute("user", theUser);
		theModel.addAttribute("property", property);
		theModel.addAttribute("stock", stock);
		theModel.addAttribute("price", price);
		return "sell-stock";
	}
	
	@PostMapping("/sell")
	public String sellStockView(Model theModel, @ModelAttribute("property") Property property) {
		System.out.println("asfasdfjnasd" + property);
		return "sell-stock";
	}
	
	
	
	@GetMapping("/test")
	public String test() {
		Api api = new Api();
		String companySymbol = "MSFT";
		double price = api.getPrice(companySymbol);
		System.out.print("Open Price " + price);
		return "test-json";
	}

	@GetMapping("/profile")
	public String showProfile(Model theModel) {
		// get users from the service
		List<User> theUsers = userService.getUsers();
		// TODO temporally use the user of index 0
		// Please change it to the current user.
		User tmpUser = theUsers.get(0);

		// add the user to the model
		theModel.addAttribute("user", tmpUser);
		return "user-profile";
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
	
	private Stock getStockByName(String name) {
		String text = "";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.getForEntity(
				String.format("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=%s&interval=1min&apikey=ACPN4KEH4052XAQ6", name),
				String.class);

		if (HttpStatus.OK == response.getStatusCode()) {
			text = response.getBody().toString();
		} else {
			System.out.println("Error");
		}
		ObjectMapper mapper = new ObjectMapper();
		Stock stock = new Stock();
		try {
			// JSON string to Java object
			stock = mapper.readValue(text, Stock.class);
		} catch (IOException e) {
			System.out.println("Test failed.");
			e.printStackTrace();
		}
		return stock;
	}

}
