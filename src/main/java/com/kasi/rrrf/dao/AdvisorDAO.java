package com.kasi.rrrf.dao;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kasi.rrrf.entity.Advisor;
import com.kasi.rrrf.entity.AdvisorBasicDetails;

public class AdvisorDAO {

	public boolean registerAdvisor(Advisor advisor)
	{
		Connection con = null;
		PreparedStatement pst = null;
		FileInputStream inputStream = null;
		boolean result;
		//String image = null;
		int count = 0;
		try {
			con = DBConnect.getConnection();
			//inputStream = new FileInputStream(image);
			pst = con.prepareStatement("INSERT INTO ADVISOR (ADVISOR_ID,ADVISOR_FIRST_NAME,"
					+ "ADVISOR_LAST_NAME,ADVISOR_DISPLAY_NAME,ADVISOR_PASSWORD,ADVISOR_MOBILE,"
					+ "ADVISOR_YEARS_OF_EXP,"
					+ "ADVISOR_HOURLY_RATE,ADVISOR_QUALIFICATION,ADVISOR_LOCATION,"
					+ "ADVISOR_BRIEF_DESCRIPTION,USER_ID) VALUES (?,?,?,?,?,?,?,?,?,"
					+ "?,?,?)");
			pst.setString(1,advisor.getAdvisorId());
			pst.setString(2, advisor.getFirstName());
			pst.setString(3,advisor.getLastName());
			pst.setString(4, advisor.getDisplayName());
			pst.setString(5, advisor.getPassword());
			pst.setString(6,advisor.getMobile());
			pst.setFloat(7, advisor.getYearsOfExp());
			pst.setDouble(8,advisor.getHourlyRate());
			pst.setString(9, advisor.getQualificaiton());
			pst.setString(10,advisor.getLocation());
			pst.setString(11, advisor.getDescription());
			//pst.setString(12, "Hello");
			pst.setString(12, advisor.getUserId());
			count = pst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		return (count==1);
	}
	
	public Advisor fetchAdvisorDetails(String advisorId)
	{
		Advisor advisor = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select ADVISOR_ID,ADVISOR_DISPLAY_NAME,ADVISOR_MOBILE,ADVISOR_YEARS_OF_EXP,"
					+ "ADVISOR_HOURLY_RATE,ADVISOR_QUALIFICATION,ADVISOR_BRIEF_DESCRIPTION,ADVISOR_IMAGE "
					+ "from advisor where ADVISOR_ID = ?");
			pst.setString(1,advisorId);
			rs = pst.executeQuery();
			while(rs.next())
			{
				advisor = new Advisor();
				advisor.setAdvisorId(rs.getString(1));
				advisor.setDisplayName(rs.getString(2));
				advisor.setMobile(rs.getString(3));
				advisor.setYearsOfExp(rs.getFloat(4));
				advisor.setHourlyRate(rs.getFloat(5));
				advisor.setQualificaiton(rs.getString(6));
				advisor.setDescription(rs.getString(7));
				advisor.setImage(rs.getBinaryStream(8));
				
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
	public List<Advisor> fetchAdvisorsByLocation(String location)
	{
		ArrayList<Advisor> alist = new ArrayList<Advisor>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select * from advisor where location=?");
			pst.setString(1,location);
			rs = pst.executeQuery();
			while(rs.next())
			{
				alist.add(new Advisor(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),
						rs.getString(5),rs.getString(6),rs.getFloat(7),rs.getDouble(8),rs.getString(9),
						rs.getString(10),rs.getBinaryStream(11),rs.getString(12),rs.getString(13)));
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
			pst = con.prepareStatement("select ADVISOR_ID,ADVISOR_DISPLAY_NAME,ADVISOR_YEARS_OF_EXP,ADVISOR_HOURLY_RATE,"
					+ "ADVISOR_BRIEF_DESCRIPTION,ADVISOR_IMAGE from advisor");
			
			rs = pst.executeQuery();
			while(rs.next())
			{
				alist.add(new AdvisorBasicDetails(rs.getString(1),rs.getString(2),rs.getFloat(3),rs.getDouble(4),rs.getString(5),
						rs.getBinaryStream(6)));
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
}
