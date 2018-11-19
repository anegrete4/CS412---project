package model;

public class Review {
	private int reviewId;
	private int userId;
	private int itemId;
	private String reviewMessage;
	private int rating;
	public Review(int userId, int itemId, String reviewMessage, int rating) {
		this.userId=userId;
		this.itemId=itemId;
		this.reviewMessage=reviewMessage;
		this.rating=rating;
	}
}
