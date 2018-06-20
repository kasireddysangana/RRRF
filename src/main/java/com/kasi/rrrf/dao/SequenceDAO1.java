package com.kasi.rrrf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.kasi.rrrf.entity.Advisor;
import com.kasi.rrrf.entity.Sequence;

public class SequenceDAO1 {

	public Sequence getSequence()
	{
		Sequence sequence = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try
		{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select USER_SEQUENCE_NO, ADVISOR_SEQUENCE_NO, CLIENT_SEQUENCE_NO from SEQUENCE");
			rs = pst.executeQuery();
			if(rs.next())
			{
				sequence = new Sequence();
				sequence.setUserSequenceNo(rs.getString(1));
				sequence.setAdvisorSequenceNo(rs.getString(2));
				sequence.setClientSequenceNo(rs.getString(3));
				
			}
		}catch(Exception e) {
				e.printStackTrace();
		}finally {
				DBConnect.closeResultSet(rs);
				DBConnect.closeStatement(pst);
				DBConnect.closeConnection(con);
		}
		return sequence;
	}
	public boolean updateSequenceNo(String sequenceNo, String userType)
	{
		//Sequence sequence = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		int count = 0;
		try
		{
			con = DBConnect.getConnection();
			if(userType.equals("User")){
				pst = con.prepareStatement("update SEQUENCE set USER_SEQUENCE_NO = ?");
			}else if(userType.equalsIgnoreCase("Advisor")) {
				pst = con.prepareStatement("update SEQUENCE set ADVISOR_SEQUENCE_NO = ?");
			}else if(userType.equalsIgnoreCase("Client")) {
				pst = con.prepareStatement("update SEQUENCE set CLIENT_SEQUENCE_NO = ?");
			}
			pst.setString(1,sequenceNo);
			count = pst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeResultSet(rs);
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		return (count==1);
	}
}	
