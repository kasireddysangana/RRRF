package com.kasi.rrrf.entity;

public class Client {
	
	private String clientId;
	private String clientName;
	private String clientMobile;
	private String clientLocation;
	private String userId;
	
	public Client() {}

	public Client(String clientId, String clientName, String clientMobile, String clientLocation, 
			String userId) {
		this.clientId = clientId;
		this.clientName = clientName;
		this.clientMobile = clientMobile;
		this.clientLocation = clientLocation;
		this.userId = userId;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getClientMobile() {
		return clientMobile;
	}

	public void setClientMobile(String clientMobile) {
		this.clientMobile = clientMobile;
	}

	public String getClientLocation() {
		return clientLocation;
	}

	public void setClientLocation(String clientLocation) {
		this.clientLocation = clientLocation;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
