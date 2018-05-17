package com.kasi.rrrf.entity;

import java.io.InputStream;

public class Advisor {

	private String advisorId;
	private String firstName;
	private String lastName;
	private String displayName;
	private String password;
	private String mobile;
	private float yearsOfExp;
	private double hourlyRate;
	private String qualificaiton;
	private String location;
	private String description;
	private InputStream image;
	private String userId;
	
	public Advisor() {}

	public Advisor(String advisorId, String firstName, String lastName, String displayName, String password,
			String mobile, float yearsOfExp, double hourlyRate, String qualificaiton, String description,
			InputStream image, String userId, String location) {
		this.advisorId = advisorId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.displayName = displayName;
		this.password = password;
		this.mobile = mobile;
		this.yearsOfExp = yearsOfExp;
		this.hourlyRate = hourlyRate;
		this.qualificaiton = qualificaiton;
		this.description = description;
		this.image = image;
		this.userId = userId;
		this.location = location;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAdvisorId() {
		return advisorId;
	}

	public void setAdvisorId(String advisorId) {
		this.advisorId = advisorId;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public InputStream getImage() {
		return image;
	}

	public void setImage(InputStream image) {
		this.image = image;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
