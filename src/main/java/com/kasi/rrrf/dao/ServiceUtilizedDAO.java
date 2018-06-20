package com.kasi.rrrf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kasi.rrrf.entity.AdvisorBasicDetails;
import com.kasi.rrrf.entity.ServiceUtilized;

public class ServiceUtilizedDAO {

	public List<ServiceUtilized> getPendingReviewsList(String clientUserId)
	{
		ArrayList<ServiceUtilized> pendingAdvisorReviewsList = new ArrayList<ServiceUtilized>();;
		
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select SERVICE_ID, CLIENT_USER_ID, ADVISOR_USER_ID from SERVICE_UTILIZED where CLIENT_USER_ID = ? "
					+ "AND RATING_GIVEN = ?");
			
			pst.setString(1,clientUserId);
			pst.setString(2, "N");
			rs = pst.executeQuery();

			while(rs.next())
			{
				pendingAdvisorReviewsList.add(new ServiceUtilized(rs.getInt(1),rs.getString(2),rs.getString(3)));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeResultSet(rs);
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		return pendingAdvisorReviewsList;
	}
	
	public boolean updateReviewStatus(int serviceId)
	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		int count = 0;
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement(" update  SERVICE_UTILIZED set RATING_GIVEN = 'Y' WHERE SERVICE_ID = ?");
			pst.setInt(1,serviceId);
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
