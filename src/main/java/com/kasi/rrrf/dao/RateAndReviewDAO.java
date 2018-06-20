package com.kasi.rrrf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.kasi.rrrf.entity.RateAndReview;

public class RateAndReviewDAO {
	
	public boolean insertReview(RateAndReview review)
	{
		Connection con = null;
		PreparedStatement pst = null;
		int count = 0;
		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement("INSERT INTO REVIEW (CLIENT_USER_ID,CLIENT_USER_NAME,ADVISOR_USER_ID,REVIEW_DATE,"
					+ "RATING,REVIEW_DESCRIPTION) VALUES (?,?,?,?,?,?)");
			
			pst.setString(1, review.getClientUserId());
			pst.setString(2, review.getClientUserName());
			pst.setString(3, review.getAdvisorUserId());
			pst.setTimestamp(4, review.getReviewDate());
			pst.setInt(5, review.getRating());
			pst.setString(6, review.getReviewDescription());
			
			count = pst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		return (count==1);
	}
	public List<RateAndReview> fetchReviews(String advisorId)
	{
		ArrayList<RateAndReview> reviewList = new ArrayList<RateAndReview>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select CLIENT_USER_ID,CLIENT_USER_NAME,ADVISOR_USER_ID,REVIEW_DATE,RATING,"
					+ "REVIEW_DESCRIPTION from REVIEW where ADVISOR_USER_ID = ? ORDER BY RATING DESC");
			
			pst.setString(1,advisorId);
			rs = pst.executeQuery();

			while(rs.next())
			{
				reviewList.add(new RateAndReview(rs.getString(1),rs.getString(2),rs.getString(3),rs.getTimestamp(4),rs.getInt(5),
						rs.getString(6)));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeResultSet(rs);
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		
		return reviewList;
	}
}
