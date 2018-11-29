package model;

import java.util.ArrayList;

public class SalesItem {
	private int itemId;
	private String itemName;
	private String itemDescription;
	private double itemPrice;
	private int rating;
	private String imagePath;
	private ArrayList<Review> reviews;
	
	public SalesItem(int itemId, String itemName, String itemDescription, double itemPrice, String imagePath) {
		this.itemId=itemId;
		this.itemName=itemName;
		this.itemDescription=itemDescription;
		this.itemPrice=itemPrice;
		this.imagePath=imagePath;
	}
	public  void addReview(Review review) {
		reviews.add(review);
	}
	public ArrayList getReview() {
		return reviews;
	}
	public double getItemPrice() {
		return itemPrice;
	}

}
