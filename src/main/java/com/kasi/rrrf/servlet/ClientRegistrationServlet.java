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
import com.kasi.rrrf.dao.UserDAO;
import com.kasi.rrrf.entity.Client;
import com.kasi.rrrf.entity.User;

/**
 * Servlet implementation class ClientRegistrationServlet
 */
public class ClientRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String USER_TYPE="U";
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String clientId = "C10001";
		String clientName = request.getParameter("cname");
		String password = request.getParameter("cpwd");
		String clientMobile = request.getParameter("cmobile");
		String clientLocation = request.getParameter("clocation");
		String userId = "U10002";
		
		User user = new User(userId,password,USER_TYPE);
		Client client = new Client(clientId,clientName,clientMobile,clientLocation,userId);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		
		RequestDispatcher rd = null;
		if(new UserDAO().createUser(user)){
			if(new ClientDAO().registerClient(client)) {
				out.print("<html><body>");
				out.print("<script type=text/javascript>");
				out.print("alert('Client Registered Successfully')");
				out.print("</script>");
				out.print("</body></html>");
			}
			else 
				out.println("<center><h1>Client registration failed :(</h1></center>");
				out.print("<hr width=100% size=3 color=red>");
				rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
		}
		else {
			
			out.println("<center><h1>User could not be creatred properly and so Client :(</h1></center>");
			out.print("<hr width=100% size=3 color=red>");
			rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
	}

}
