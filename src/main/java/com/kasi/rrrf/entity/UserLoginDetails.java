package com.kasi.rrrf.entity;

import java.sql.Timestamp;

public class UserLoginDetails {

	String userName;
	String logInFlag;
	Timestamp logInTime;
	Timestamp lastLogOutTime;
	
	public UserLoginDetails() {}

	public UserLoginDetails(String userName, String logInFlag, Timestamp logInTime, Timestamp lastLogOutTime) {
		this.userName = userName;
		this.logInFlag = logInFlag;
		this.logInTime = logInTime;
		this.lastLogOutTime = lastLogOutTime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLogInFlag() {
		return logInFlag;
	}

	public void setLogInFlag(String logInFlag) {
		this.logInFlag = logInFlag;
	}

	public Timestamp getLogInTime() {
		return logInTime;
	}

	public void setLogInTime(Timestamp logInTime) {
		this.logInTime = logInTime;
	}

	public Timestamp getLastLogOutTime() {
		return lastLogOutTime;
	}

	public void setLastLogOutTime(Timestamp lastLogOutTime) {
		this.lastLogOutTime = lastLogOutTime;
	}
	
	
}
