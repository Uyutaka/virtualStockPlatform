package com.virtualStockPlatform.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.virtualStockPlatform.entity.Property;
import com.virtualStockPlatform.entity.User;

@Repository
public class UserDAOImpl implements UserDAO{

	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<User> getUsers() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<User> theQuery = currentSession.createQuery("from User", User.class);
		
		// execute query and get result list
		List<User> users = theQuery.getResultList();
		
		// return the results
		
		return users;
	}


	@Override
	public void saveUser(User theUser) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		// save/update the user
		currentSession.saveOrUpdate(theUser);
	}


	@Override
	public User getUser(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// retrieve/read from db using the primary key
		User theUser = currentSession.get(User.class, theId);
		return theUser;
	}


	@Override
	public void deleteUser(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// delete object with primary key
		Query theQuery =
				currentSession.createQuery("delete from User where id=:userId");
		theQuery.setParameter("userId", theId);
		theQuery.executeUpdate();
	}


	@Override
	public List<Property> getProperties(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Property> theQuery = currentSession.createQuery("from Property where userId=:Id", Property.class);
		theQuery.setParameter("Id", theId);
		// execute query and get result list
		List<Property> properties = theQuery.getResultList();
		System.out.println(properties);
		
		// return the results
		
		return properties;
	}
}
