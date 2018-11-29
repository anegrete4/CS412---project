package model;

import java.util.ArrayList;

public class SalesItem {
	private int itemId;
	private String itemName;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemDescription() {
		return itemDescription;
	}
	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}
	
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
	public String createHtmlAnchor(String anchorName) {
		if(anchorName.isEmpty()) {
			anchorName=itemName;
		}
		return "<a href='http://localhost:8080/ground-hogs/popUpDisplay.do?popUpTitle="+itemName+"&popUpContent=popUpSalesItem&itemId="+itemId+"'>"+anchorName+"</a>";
		/*String htmlString=
			"<form class=\"InputForm\" ACTION=\"popUpDisplay.do\" METHOD=\"GET\">"+
	        "<input type=\"hidden\" value=\""+itemName+"\" name=\"popUpTitle\" />"+
	        "<input type=\"hidden\" value=\"popUpSalesItem\" name=\"popUpContent\"/>"+
	        "<input type=\"hidden\" value=\""+itemId+"\" name=\"itemId\" />"+
	        "<input type=\"submit\" value=\""+itemName+"\" class=\"salesItemLink\">"+ 
	        "</form>";
		return htmlString;*/
	}
	
	public String createHtmlAnchorHref() {
		return "http://localhost:8080/ground-hogs/popUpDisplay.do?popUpTitle="+itemName+"&popUpContent=popUpSalesItem&itemId="+itemId;
		
	}


}
