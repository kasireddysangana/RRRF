package com.kasi.rrrf.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kasi.rrrf.dao.ClientDAO;
import com.kasi.rrrf.dao.SequenceDAO;
import com.kasi.rrrf.dao.UserDAO;
import com.kasi.rrrf.entity.Advisor;
import com.kasi.rrrf.entity.Client;
import com.kasi.rrrf.entity.User;
import com.kasi.rrrf.utility.RRRFUtility;

/**
 * Servlet implementation class ClientRegistrationServlet
 */
public class ClientRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String USER_TYPE="C";
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String clientName = request.getParameter("cname");
		String userName = request.getParameter("cuname");
		String password = request.getParameter("cpwd");
		String clientMobile = request.getParameter("cmobile");
		String clientLocation = request.getParameter("clocation");
		String userId = "U10001";
		
		String tableSequenceNo = new SequenceDAO().getSequence();
		int newSequenceNoForUser;
		
		if(tableSequenceNo!=null && (!tableSequenceNo.equals("0")))
		{
			newSequenceNoForUser = RRRFUtility.getNextSequenceNo(tableSequenceNo);
			userId = "U"+newSequenceNoForUser;
		}
		
		User user = new User(userId,userName,password,USER_TYPE);
		Client client = new Client(userId,clientName,clientMobile,clientLocation);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		
		RequestDispatcher rd = null;
		if(new UserDAO().createUser(user)){
			if(new SequenceDAO().updateSequenceNo(userId))
			{
				if(new ClientDAO().registerClient(client)) 
				{
					/*out.print("<html><body>");
					out.print("<script type=text/javascript>");
					out.print("alert('Client Registered Successfully')");
					out.print("</script>");
					out.print("</body></html>");*/
					request.setAttribute("registrationSuccess", true);
					response.sendRedirect("/RRRF/index");
					
				}
				else 
				{	
					out.println("<center><h1>Client registration failed :(</h1></center>");
					out.print("<hr width=100% size=3 color=red>");
					rd = request.getRequestDispatcher("index2.jsp");
					rd.include(request, response);
				}
			}
		}
		else {
			
			out.println("<center><h1>User could not be creatred properly and so Client :(</h1></center>");
			out.print("<hr width=100% size=3 color=red>");
			rd = request.getRequestDispatcher("index2.jsp");
			rd.include(request, response);
		}
	}

}
