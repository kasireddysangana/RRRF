package com.kasi.rrrf.entity;

public class ServiceUtilized {

	private int serviceId;
	private String clientUserId;
	private String advisorUserId;
	
	public ServiceUtilized() {}

	public ServiceUtilized(int serviceId, String clientUserId, String advisorUserId) {
		
		this.serviceId = serviceId;
		this.clientUserId = clientUserId;
		this.advisorUserId = advisorUserId;
	}

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public String getClientUserId() {
		return clientUserId;
	}

	public void setClientUserId(String clientUserId) {
		this.clientUserId = clientUserId;
	}

	public String getAdvisorUserId() {
		return advisorUserId;
	}

	public void setAdvisorUserId(String advisorUserId) {
		this.advisorUserId = advisorUserId;
	}

	
}
