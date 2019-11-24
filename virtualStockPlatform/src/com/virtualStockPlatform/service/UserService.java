package com.virtualStockPlatform.service;

import java.util.List;

import com.virtualStockPlatform.entity.Property;
import com.virtualStockPlatform.entity.User;

public interface UserService {
	public List<User> getUsers();

	public void saveUser(User theUser);

	public User getUser(int theId);

	public void deleteUser(int theId);
	
	public List<Property> getProperties(int theId);

}
