package com.kasi.rrrf.entity;
import java.sql.Date;
public class ReviewsAndRating {
	
	private String advisorId;
	private String clientId;
	private String clientName;
	private Date reviewDate;
	private int rating;
	private String reviewDescription;
	
	public ReviewsAndRating() {}

	public ReviewsAndRating(String advisorId, String clientId, String clientName, Date reviewDate, int rating, String reviewDescription) {
		this.advisorId = advisorId;
		this.clientId = clientId;
		this.clientName = clientName;
		this.reviewDate = reviewDate;
		this.rating = rating;
		this.reviewDescription = reviewDescription;
	}

	public String getAdvisorId() {
		return advisorId;
	}

	public void setAdvisorId(String advisorId) {
		this.advisorId = advisorId;
	}

	public String getClientId() {
		return clientId;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
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
