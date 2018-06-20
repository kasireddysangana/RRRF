package com.kasi.rrrf.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kasi.rrrf.entity.Advisor;
import com.kasi.rrrf.entity.AdvisorBasicDetails;

public class AdvisorDAO {

	public boolean registerAdvisor(Advisor advisor)
	{
		Connection con = null;
		PreparedStatement pst = null;
		int count = 0;
		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement("INSERT INTO ADVISOR (ADVISOR_USER_ID, ADVISOR_FIRST_NAME, ADVISOR_LAST_NAME, ADVISOR_DISPLAY_NAME, "
					+ "ADVISOR_MOBILE, ADVISOR_YEARS_OF_EXP, ADVISOR_HOURLY_RATE, ADVISOR_QUALIFICATION, ADVISOR_LOCATION, ADVISOR_BRIEF_DESCRIPTION) "
					+ "VALUES (?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1, advisor.getAdvisorUserId());
			//pst.setString(2, advisor.getUserName());
			pst.setString(2, advisor.getFirstName());
			pst.setString(3,advisor.getLastName());
			pst.setString(4, advisor.getDisplayName());
			pst.setString(5,advisor.getMobile());
			pst.setFloat(6, advisor.getYearsOfExp());
			pst.setDouble(7,advisor.getHourlyRate());
			pst.setString(8, advisor.getQualificaiton());
			pst.setString(9,advisor.getLocation());
			pst.setString(10, advisor.getDescription());
			
			count = pst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		return (count==1);
	}
	
	public Advisor fetchAdvisorDetails(String advisorUserId)
	{
		Advisor advisor = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select ADVISOR_USER_ID,ADVISOR_DISPLAY_NAME,ADVISOR_MOBILE,ADVISOR_YEARS_OF_EXP,"
					+ "ADVISOR_HOURLY_RATE,ADVISOR_QUALIFICATION,ADVISOR_BRIEF_DESCRIPTION "
					+ "from advisor where ADVISOR_USER_ID = ?");
			pst.setString(1,advisorUserId);
			rs = pst.executeQuery();
			while(rs.next())
			{
				advisor = new Advisor();
				advisor.setAdvisorUserId(rs.getString(1));
				advisor.setDisplayName(rs.getString(2));
				advisor.setMobile(rs.getString(3));
				advisor.setYearsOfExp(rs.getFloat(4));
				advisor.setHourlyRate(rs.getFloat(5));
				advisor.setQualificaiton(rs.getString(6));
				advisor.setDescription(rs.getString(7));			
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeResultSet(rs);
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		
		return advisor;
	}
	public List<AdvisorBasicDetails> fetchAdvisorsByLocation(String location)
	{
		ArrayList<AdvisorBasicDetails> alist = new ArrayList<AdvisorBasicDetails>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select ADVISOR_USER_ID,ADVISOR_DISPLAY_NAME,ADVISOR_YEARS_OF_EXP,ADVISOR_HOURLY_RATE, ADVISOR_BRIEF_DESCRIPTION "
					+ "from advisor where ADVISOR_LOCATION=?");
			pst.setString(1,location);
			rs = pst.executeQuery();
			while(rs.next())
			{
				alist.add(new AdvisorBasicDetails(rs.getString(1),rs.getString(2),rs.getFloat(3),rs.getDouble(4),rs.getString(5)));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeResultSet(rs);
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		
		return alist;
	}
	public List<AdvisorBasicDetails> fetchAdvisorBasicDetails()
	{
		ArrayList<AdvisorBasicDetails> alist = new ArrayList<AdvisorBasicDetails>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select ADVISOR_USER_ID,ADVISOR_DISPLAY_NAME,ADVISOR_YEARS_OF_EXP,ADVISOR_HOURLY_RATE,"
					+ "ADVISOR_BRIEF_DESCRIPTION from advisor");
			
			rs = pst.executeQuery();
			while(rs.next())
			{
				alist.add(new AdvisorBasicDetails(rs.getString(1),rs.getString(2),rs.getFloat(3),rs.getDouble(4),rs.getString(5)));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeResultSet(rs);
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		
		return alist;
	}
	public String getAdvisorDisplayName(String advisorUserId)
	{
		String advisorDisplayName = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select ADVISOR_DISPLAY_NAME from advisor where ADVISOR_USER_ID = ?");
			pst.setString(1,advisorUserId);
			
			rs = pst.executeQuery();
			if(rs.next())
			{
				advisorDisplayName=rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeResultSet(rs);
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		
		return advisorDisplayName;
	}
}
