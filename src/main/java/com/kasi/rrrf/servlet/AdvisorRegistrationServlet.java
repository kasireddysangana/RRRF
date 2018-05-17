package com.kasi.rrrf.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kasi.rrrf.dao.AdvisorDAO;
import com.kasi.rrrf.dao.UserDAO;
import com.kasi.rrrf.entity.Advisor;
import com.kasi.rrrf.entity.User;
/**
 * Servlet implementation class AdvisorRegistrationServlet
 */

public class AdvisorRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String USER_TYPE="A";   
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String advisorId = "A10002";
		String firstName = request.getParameter("afname");
		String lastName = request.getParameter("asname");
		String displayName = request.getParameter("adname");
		String password = request.getParameter("apwd");
		String mobile = request.getParameter("amobile");
		float yearsOfExp = Float.parseFloat(request.getParameter("aexp"));
		double hourlyRate = Double.parseDouble(request.getParameter("arate"));
		String qualificaiton = request.getParameter("aqualification");
		String location = request.getParameter("alocation");
		String description = request.getParameter("adescription");
		InputStream image = null;
		String userId = "U10002";
		
		User user = new User(userId,password,USER_TYPE);
		Advisor advisor = new Advisor(advisorId,firstName,lastName ,displayName,password,mobile,yearsOfExp,hourlyRate,qualificaiton,description,image,userId,location);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		
		RequestDispatcher rd = null;
		if(new UserDAO().createUser(user)){
			if(new AdvisorDAO().registerAdvisor(advisor)) {
				//rd = request.getRequestDispatcher("registeradvisorsuccess.jsp"); 
				// rd.forward(request, response);
				out.print("<html><body>");
				out.print("<script type=text/javascript>");
				out.print("alert('Advisor Registered Successfully')");
				out.print("</script>");
				out.print("</body></html>");
			}
			else 
				out.println("<center><h1>Advisor registration failed :(</h1></center>");
				out.print("<hr width=100% size=3 color=red>");
				rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
		}
		else {
			
			out.println("<center><h1>User could not be creatred properly and so Advisor :(</h1></center>");
			out.print("<hr width=100% size=3 color=red>");
			rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
	}

}
