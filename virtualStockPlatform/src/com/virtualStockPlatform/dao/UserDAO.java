package com.virtualStockPlatform.dao;

import java.util.List;

import com.virtualStockPlatform.entity.Property;
import com.virtualStockPlatform.entity.User;

public interface UserDAO {
	public List<User> getUsers();

	public void saveUser(User theUser);

	public User getUser(int theId);

	public void deleteUser(int theId);
	
	public List<Property> getProperties(int theId);
}
