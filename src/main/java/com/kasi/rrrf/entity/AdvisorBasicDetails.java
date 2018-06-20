package com.kasi.rrrf.entity;

import java.io.InputStream;

public class AdvisorBasicDetails {

	private String advisorUserId;
	private String displayName;
	private float yearsOfExp;
	private double hourlyRate;
	private String description;
	
	public AdvisorBasicDetails() {}
	
	public AdvisorBasicDetails(String advisorUserId, String displayName, float yearsOfExp, double hourlyRate, String description) {
		this.advisorUserId = advisorUserId;
		this.displayName = displayName;
		this.yearsOfExp = yearsOfExp;
		this.hourlyRate = hourlyRate;
		this.description = description;
	}

	public String getAdvisorUserId() {
		return advisorUserId;
	}

	public void setAdvisorUserId(String advisorUserId) {
		this.advisorUserId = advisorUserId;
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
}
