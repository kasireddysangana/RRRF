package com.kasi.rrrf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.kasi.rrrf.dao.DBConnect;
import com.kasi.rrrf.entity.User;
import com.kasi.rrrf.entity.UserDetails;

public class UserDAO {

	public boolean createUser(User user)
	{
		Connection con =null;
		PreparedStatement pst = null;
		int count = 0;
		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement("insert into user values(?,?,?,?)");
			pst.setString(1, user.getUserId());
			pst.setString(2, user.getUserName().toUpperCase());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getUserType());
			count = pst.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		
		return (count==1);
	}
	
	public UserDetails getUserId(String userName, String password)
	{
		UserDetails userDetails = null;
		Connection con =null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select USER_ID, USER_NAME, USER_TYPE from USER WHERE USER_NAME = ? AND PASSWORD = ?");
			pst.setString(1, userName.toUpperCase());
			pst.setString(2, password);
			rs = pst.executeQuery();
			if(rs.next()) {
				userDetails = new UserDetails();
				userDetails.setUserId(rs.getString(1));
				userDetails.setUserName(rs.getString(2));
				userDetails.setUserType(rs.getString(3));
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		return userDetails;
	}
	public boolean insertUserLoginDetails(String userName)
	{
		Connection con =null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String logInFlag = null;
		int count = 0;
		try {
			con = DBConnect.getConnection();
			System.out.println("In insertUserLoginDetails 1" );
			pst = con.prepareStatement("select USER_NAME, LOGIN_FLAG  from USER_LOGIN WHERE USER_NAME = ? ");
			pst.setString(1, userName.toUpperCase());
			
			java.util.Date date = new java.util.Date();
			java.sql.Timestamp sqlTime = new java.sql.Timestamp(date.getTime());

			rs = pst.executeQuery();
			if(rs.next()) 
			{
				logInFlag = rs.getString(2);
				if(logInFlag.equals("N"))
				{
					PreparedStatement pst1 = null;
					try {
						pst1 = con.prepareStatement("update USER_LOGIN SET LOGIN_FLAG = ?,LAST_LOGIN_TS = ? WHERE USER_NAME = ?");

						pst1.setString(1,"Y");
						pst1.setTimestamp(2, sqlTime);
						pst1.setString(3,userName);
						count = pst1.executeUpdate();
					}catch(Exception e)
					{
						e.printStackTrace();
					}finally {
						DBConnect.closeStatement(pst1);
					}
				}
				else
				{
					return false;
				}
			}else
			{
				PreparedStatement pst2 = null;
				try {
					pst2 = con.prepareStatement("insert into USER_LOGIN (USER_NAME, LOGIN_FLAG, LAST_LOGIN_TS) VALUES (?,?,?)");
					pst2.setString(1, userName.toUpperCase());
					pst2.setString(2,"Y");
					pst2.setTimestamp(3, sqlTime);
					count = pst2.executeUpdate();
				}catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					DBConnect.closeStatement(pst2);
				}
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			DBConnect.closeResultSet(rs);
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		return (count==1);
	}
	
	public boolean updateUserLogOut(String clientUserName)
	{
		Connection con =null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = DBConnect.getConnection();
			System.out.println("In insertUserLoginDetails 1" );
			pst = con.prepareStatement("update USER_LOGIN set LOGIN_FLAG = 'N', LAST_LOGOUT_TS = ?  WHERE USER_NAME = ? ");
			
			java.util.Date date = new java.util.Date();
			java.sql.Timestamp sqlTime = new java.sql.Timestamp(date.getTime());
			
			pst.setTimestamp(1, sqlTime);
			pst.setString(2, clientUserName);
			
			count = pst.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			DBConnect.closeResultSet(rs);
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		return (count==1);
	}
}
