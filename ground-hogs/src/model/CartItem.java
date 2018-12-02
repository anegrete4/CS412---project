package model;

public class CartItem extends SalesItem {
	private int itemCount=0;
	public double getTotalPrice() {
		return itemCount*getItemPrice();
	}
	public int getItemCount() {
		return itemCount;
	}
	public CartItem() {}
	public CartItem(int count, SalesItem item) {
		super(item.getItemId(),item.getItemName(),item.getItemDescription(),item.getItemPrice(),item.getImagePath(),item.getRating(),item.getNoOfReviews());
		this.itemCount=count;
	}
	public CartItem(int count, int itemId, String itemName, String itemDescription, double itemPrice, String imagePath,
			double rating, int noOfReviews) {
		super(itemId, itemName, itemDescription, itemPrice, imagePath, rating, noOfReviews);
		itemCount=count;
	}
	
	public void add(int count) {
		this.itemCount+=count;
	}
	public void setItemCount(int count) {
		this.itemCount=count;
	}
}
