package com.kasi.rrrf.entity;
import java.sql.Timestamp;

public class RateAndReview {
	
	private String clientUserId;
	private String clientUserName;
	private String advisorUserId;
	private Timestamp reviewDate;
	private int rating;
	private String reviewDescription;
	
	public RateAndReview() {}

	public RateAndReview(String clientUserId, String clientUserName, String advisorUserId, Timestamp reviewDate, int rating, String reviewDescription) {
		this.clientUserId = clientUserId;
		this.clientUserName = clientUserName;
		this.advisorUserId = advisorUserId;
		this.reviewDate = reviewDate;
		this.rating = rating;
		this.reviewDescription = reviewDescription;
	}

	public String getClientUserId() {
		return clientUserId;
	}

	public void setClientUserId(String clientUserId) {
		this.clientUserId = clientUserId;
	}

	public String getClientUserName() {
		return clientUserName;
	}

	public void setClientUserName(String clientUserName) {
		this.clientUserName = clientUserName;
	}

	public String getAdvisorUserId() {
		return advisorUserId;
	}

	public void setAdvisorUserId(String advisorUserId) {
		this.advisorUserId = advisorUserId;
	}

	public Timestamp getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Timestamp reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getReviewDescription() {
		return reviewDescription;
	}

	public void setReviewDescription(String reviewDescription) {
		this.reviewDescription = reviewDescription;
	}

	
	
}
