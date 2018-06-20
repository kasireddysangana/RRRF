package com.kasi.rrrf.entity;

public class Client {
	
	private String clientUserId;
	private String clientName;
	private String clientMobile;
	private String clientLocation;
	
	public Client() {}

	public Client(String clientUserId, String clientName, String clientMobile, String clientLocation) 
	{
		this.clientUserId = clientUserId;
		this.clientName = clientName;
		this.clientMobile = clientMobile;
		this.clientLocation = clientLocation;
	}

	public String getClientUserId() {
		return clientUserId;
	}

	public void setClientUserId(String clientUserId) {
		this.clientUserId = clientUserId;
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

}
