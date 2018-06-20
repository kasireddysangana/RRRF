package com.kasi.rrrf.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kasi.rrrf.dao.RateAndReviewDAO;
import com.kasi.rrrf.entity.RateAndReview;

/**
 * Servlet implementation class GetReviewsAndRatingServlet
 */
public class GetReviewsAndRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String advisorUserId = (String) request.getParameter("advisorId");
		Integer finalRating = (Integer.parseInt(request.getParameter("rating")));
		String displayName = request.getParameter("displayName");
		List<RateAndReview> reviewsAndRatingList = new RateAndReviewDAO().fetchReviews(advisorUserId);
		request.setAttribute("reviewsAndRatingList", reviewsAndRatingList);
		request.setAttribute("finalRating", finalRating);
		request.setAttribute("displayName", displayName);
		request.setAttribute("advisorUserId", advisorUserId);
		request.getRequestDispatcher("review.jsp").forward(request, response);
	}

}
