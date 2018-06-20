package com.kasi.rrrf.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kasi.rrrf.dao.UserDAO;

/**
 * Servlet implementation class UserSignOutServlet
 */
public class UserSignOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String clientUserName = (String) session.getAttribute("clientUserName");
		System.out.println("In UserSignOutServlet clientUserName : " + clientUserName );
		PrintWriter out = response.getWriter();
		if(new UserDAO().updateUserLogOut(clientUserName))
		{
			out.print("User Logged out Successfully");
		}
	}

	

}
