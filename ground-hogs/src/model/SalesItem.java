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
	private double rating;
	private int noOfReviews;
	private String imagePath;
	public int getNoOfReviews() {
		return noOfReviews;
	}
	public double getRating() {
		return rating;
	}
	
	public SalesItem(int itemId, String itemName, String itemDescription, double itemPrice, String imagePath, double rating, int noOfReviews) {
		this.itemId=itemId;
		this.itemName=itemName;
		this.itemDescription=itemDescription;
		this.itemPrice=itemPrice;
		this.imagePath=imagePath;
		this.rating=rating;
		this.noOfReviews=noOfReviews;
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
