package com.kasi.rrrf.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kasi.rrrf.dao.UserDAO;
import com.kasi.rrrf.entity.UserDetails;
import com.kasi.rrrf.entity.UserLoginDetails;

/**
 * Servlet implementation class ValidateUserLoginServlet
 */
@WebServlet("/ValidateUserLoginServlet")
public class ValidateUserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("In ValidateUserLoginServlet");
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		System.out.println("In ValidateUserLoginServlet userName : " + userName);
		System.out.println("In ValidateUserLoginServlet password : " + password);
		UserDetails userDetails = null;
		userDetails = new UserDAO().getUserId(userName, password);
		 
		response.setContentType("text/html");
		PrintWriter out =response.getWriter();
		
		if(userDetails!=null) 
		{
			System.out.println("In ValidateUserLoginServlet userId :" + userDetails.getUserId());
			//userLoginDetails.set
			request.setAttribute("userDetails", userDetails);
			if(userDetails.getUserType().equals("C"))
			{
				if(new UserDAO().insertUserLoginDetails(userName))
				{
					//request.setAttribute("clientUserId", userDetails.getUserId());
					//request.setAttribute("clientUserName", userDetails.getUserName());
					//request.getRequestDispatcher("clientlogin1.jsp").forward(request, response);
					HttpSession session = request.getSession();
					session.setAttribute("clientUserId", userDetails.getUserId());
					session.setAttribute("clientUserName", userDetails.getUserName());
					response.sendRedirect("clientlogin1.jsp");
				}
				else
				{
					out.print("User already logged in or not logged out properly :(");
				}
			}
			else
			{
				out.print("Invalid User, Only Clients are allowed to login :(");
			}
			
			
		}
		else {
				out.print("alert('Invalid Login or Password')");
				response.sendRedirect("/RRRF/index");
			/*out.print("<html><body>");
			out.print("<script type=text/javascript>");
			out.print("Invalid UserName or Password");
			out.print("<hr>");
			request.getRequestDispatcher("index2.jsp").include(request, response);
			out.print("</script>");
			out.print("</body></html>");*/
			
		}
	}

}
