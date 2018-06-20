package com.kasi.rrrf.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kasi.rrrf.dao.AdvisorDAO;
import com.kasi.rrrf.entity.AdvisorBasicDetails;

/**
 * Servlet implementation class GetRegisteredAdvisorsByLocationServlet
 */
public class GetRegisteredAdvisorsByLocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String location = (String) request.getParameter("location");
		List<AdvisorBasicDetails> advisorsList = new AdvisorDAO().fetchAdvisorsByLocation(location);
		request.setAttribute("advisorsList", advisorsList);
		request.getRequestDispatcher("index2.jsp").forward(request, response);
	}

}
