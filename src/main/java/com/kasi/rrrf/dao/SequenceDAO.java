package com.kasi.rrrf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SequenceDAO {

	public String getSequence()
	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String currentSequenceNo = null;
		try
		{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select USER_SEQUENCE_NO from SEQUENCE");
			rs = pst.executeQuery();
			if(rs.next())
			{
				currentSequenceNo = rs.getString(1);
				
			}
		}catch(Exception e) {
				e.printStackTrace();
		}finally {
				DBConnect.closeResultSet(rs);
				DBConnect.closeStatement(pst);
				DBConnect.closeConnection(con);
		}
		return currentSequenceNo;
	}
	public boolean updateSequenceNo(String sequenceNo)
	{
		//Sequence sequence = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		int count = 0;
		try
		{
			con = DBConnect.getConnection();
			
			pst = con.prepareStatement("update SEQUENCE set USER_SEQUENCE_NO = ?");
			
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
