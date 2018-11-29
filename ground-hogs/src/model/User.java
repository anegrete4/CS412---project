package model;

import java.util.ArrayList;

public class User {
	private int userId;
	private String userName;
	private String password;
	public ArrayList<Order> myOrders;
	public ArrayList<Review> myReviews;
	
	public void login(String userName, char[] pasword) {
		
	}
	public void logout() {
		
	}
	public Order getOrder(int orderId) {
		return null;
	}
	public void addOrder(Order order) {
		myOrders.add(order);
	}
	public void addReview(Review review) {
		myReviews.add(review);
	}
}
