package com.kasi.rrrf.entity;

import java.io.InputStream;

public class AdvisorBasicDetails {

	private String advisorId;
	private String displayName;
	private float yearsOfExp;
	private double hourlyRate;
	private String description;
	private InputStream image;
	
	public AdvisorBasicDetails() {}
	
	public AdvisorBasicDetails(String advisorId, String displayName, float yearsOfExp, double hourlyRate,
			String description, InputStream image) {
		this.advisorId = advisorId;
		this.displayName = displayName;
		this.yearsOfExp = yearsOfExp;
		this.hourlyRate = hourlyRate;
		this.description = description;
		this.image = image;
	}

	public String getAdvisorId() {
		return advisorId;
	}

	public void setAdvisorId(String advisorId) {
		this.advisorId = advisorId;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public float getYearsOfExp() {
		return yearsOfExp;
	}

	public void setYearsOfExp(float yearsOfExp) {
		this.yearsOfExp = yearsOfExp;
	}

	public double getHourlyRate() {
		return hourlyRate;
	}

	public void setHourlyRate(double hourlyRate) {
		this.hourlyRate = hourlyRate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public InputStream getImage() {
		return image;
	}

	public void setImage(InputStream image) {
		this.image = image;
	}
	
}
