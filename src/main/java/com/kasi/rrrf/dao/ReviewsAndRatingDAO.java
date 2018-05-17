package com.kasi.rrrf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.kasi.rrrf.entity.ReviewsAndRating;

public class ReviewsAndRatingDAO {
	
	public boolean registerReview(ReviewsAndRating review)
	{
		Connection con = null;
		PreparedStatement pst = null;
		int count = 0;
		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement("INSERT INTO REVIEW (ADVISOR_ID,CLIENT_ID,CLIENT_NAME,REVIEW_DATE,"
					+ "RATING,REVIEW_DESCRIPTION) VALUES (?,?,?,?,?)");
			
			pst.setString(1, review.getAdvisorId());
			pst.setString(2, review.getClientId());
			pst.setDate(3, review.getReviewDate());
			pst.setInt(4, review.getRating());
			pst.setString(5, review.getReviewDescription());
			
			count = pst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		return (count==1);
	}
	public List<ReviewsAndRating> fetchReviews(String advisorId)
	{
		ArrayList<ReviewsAndRating> reviewList = new ArrayList<ReviewsAndRating>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select ADVISOR_ID,CLIENT_ID,CLIENT_NAME,REVIEW_DATE,RATING,REVIEW_DESCRIPTION "
					+ "from REVIEW where ADVISOR_ID = ? ORDER BY RATING DESC");
			
			pst.setString(1,advisorId);
			rs = pst.executeQuery();

			while(rs.next())
			{
				reviewList.add(new ReviewsAndRating(rs.getString(1),rs.getString(2),rs.getString(3),rs.getDate(4),rs.getInt(5),
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
