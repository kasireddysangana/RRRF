package com.kasi.rrrf.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kasi.rrrf.dao.RateAndReviewDAO;
import com.kasi.rrrf.dao.ServiceUtilizedDAO;
import com.kasi.rrrf.entity.RateAndReview;

/**
 * Servlet implementation class RateAndReviewServlet
 */
public class RateAndReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("In RateAndReviewServlet");
		String clientUserId = request.getParameter("clientUserId");
		String clientUserName = request.getParameter("clientUserName");
		String advisorUserId = request.getParameter("advisorUserId");
		String reviewComments = request.getParameter("reviewComments");
		Integer rating = (Integer.parseInt(request.getParameter("rating")));
		Integer serviceId = (Integer.parseInt(request.getParameter("serviceId")));
		
		java.util.Date date = new java.util.Date();
		java.sql.Timestamp sqlTime = new java.sql.Timestamp(date.getTime());
		
		RateAndReview rateAndReview = new RateAndReview();
		
		rateAndReview.setClientUserId(clientUserId);
		rateAndReview.setClientUserName(clientUserName);
		rateAndReview.setAdvisorUserId(advisorUserId);
		rateAndReview.setRating(rating);
		rateAndReview.setReviewDescription(reviewComments);
		rateAndReview.setReviewDate(sqlTime);
		
		PrintWriter out = response.getWriter();
		
		if(new RateAndReviewDAO().insertReview(rateAndReview))
		{
			boolean reviewStatus = new ServiceUtilizedDAO().updateReviewStatus(serviceId);
			if(reviewStatus)
				out.print("Reveiw updated Successfully");
		}
		else
		{
		
		}
	}

}
