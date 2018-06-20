package com.kasi.rrrf.entity;

public class Advisor {

	private String advisorUserId;
	private String firstName;
	private String lastName;
	private String displayName;
	private String mobile;
	private float yearsOfExp;
	private double hourlyRate;
	private String qualificaiton;
	private String location;
	private String description;
	
	
	public Advisor() {}

	public Advisor(String advisorUserId, String firstName, String lastName, String displayName,
			String mobile, float yearsOfExp, double hourlyRate, String qualificaiton, String description, String location) {
		this.advisorUserId = advisorUserId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.displayName = displayName;
		this.mobile = mobile;
		this.yearsOfExp = yearsOfExp;
		this.hourlyRate = hourlyRate;
		this.qualificaiton = qualificaiton;
		this.description = description;
		this.location = location;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
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

	public String getQualificaiton() {
		return qualificaiton;
	}

	public void setQualificaiton(String qualificaiton) {
		this.qualificaiton = qualificaiton;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAdvisorUserId() {
		return advisorUserId;
	}

	public void setAdvisorUserId(String advisorUserId) {
		this.advisorUserId = advisorUserId;
	}
	
	
}
