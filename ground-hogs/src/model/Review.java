package model;

public class Review {
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getReviewMessage() {
		return reviewMessage;
	}
	public void setReviewMessage(String reviewMessage) {
		this.reviewMessage = reviewMessage;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	private String userName;
	private String reviewMessage;
	private int rating;
	public Review(String userName, String reviewMessage, int rating) {
		this.userName=userName;
		this.reviewMessage=reviewMessage;
		this.rating=rating;
	}
}
