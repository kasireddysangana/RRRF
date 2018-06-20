package com.kasi.rrrf.entity;

public class Sequence {
	
	private String userSequenceNo;
	private String advisorSequenceNo;
	private String clientSequenceNo;

	public Sequence() {}

	public Sequence(String userSequenceNo, String advisorSequenceNo, String clientSequenceNo) {
		super();
		this.userSequenceNo = userSequenceNo;
		this.advisorSequenceNo = advisorSequenceNo;
		this.clientSequenceNo = clientSequenceNo;
	}

	public String getUserSequenceNo() {
		return userSequenceNo;
	}

	public void setUserSequenceNo(String userSequenceNo) {
		this.userSequenceNo = userSequenceNo;
	}

	public String getAdvisorSequenceNo() {
		return advisorSequenceNo;
	}

	public void setAdvisorSequenceNo(String advisorSequenceNo) {
		this.advisorSequenceNo = advisorSequenceNo;
	}

	public String getClientSequenceNo() {
		return clientSequenceNo;
	}

	public void setClientSequenceNo(String clientSequenceNo) {
		this.clientSequenceNo = clientSequenceNo;
	}
	
}
