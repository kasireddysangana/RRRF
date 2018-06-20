package com.kasi.rrrf.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kasi.rrrf.dao.AdvisorDAO;
import com.kasi.rrrf.dao.LocationDAO;
import com.kasi.rrrf.dao.SequenceDAO;
import com.kasi.rrrf.dao.UserDAO;
import com.kasi.rrrf.entity.Advisor;
import com.kasi.rrrf.entity.User;
import com.kasi.rrrf.utility.RRRFUtility;
import com.kasi.rrrf.entity.Location;
/**
 * Servlet implementation class AdvisorRegistrationServlet
 */
@MultipartConfig(maxFileSize=1000000000)
public class AdvisorRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String USER_TYPE="A";   
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String userName = request.getParameter("auname");
		String firstName = request.getParameter("afname");
		String lastName = request.getParameter("alname");
		String displayName = request.getParameter("adname");
		String password = request.getParameter("apwd");
		String mobile = request.getParameter("amobile");
		float yearsOfExp = Float.parseFloat(request.getParameter("aexp"));
		double hourlyRate = Double.parseDouble(request.getParameter("arate"));
		String qualificaiton = request.getParameter("aqualification");
		String location = request.getParameter("alocation");
		String description = request.getParameter("adescription");
		
		//Part filePart = request.getPart("aphoto");
		String userId = "U10001";
		
		String tableSequenceNo = new SequenceDAO().getSequence();
		User user = null;
		Advisor advisor = null;
		int newSequenceNoForUser;
		
		if(tableSequenceNo!=null && (!tableSequenceNo.equals("0")))
		{
			newSequenceNoForUser = RRRFUtility.getNextSequenceNo(tableSequenceNo);
			userId = "U"+newSequenceNoForUser;
		}
		/* Code for getting LocationId to insert a record in Location table  - Start */
		insertLocationIfNotInTable(location);
		
		/* Code for inserting LocationId to insert a record in Location table  - End */
		
		user = new User(userId,userName,password,USER_TYPE);
		advisor = new Advisor(userId,firstName,lastName ,displayName,mobile,yearsOfExp,hourlyRate,qualificaiton,description,location);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		
		RequestDispatcher rd = null;
		
		if(new UserDAO().createUser(user))
		{
			if(new SequenceDAO().updateSequenceNo(userId))
			{
				
				if(new AdvisorDAO().registerAdvisor(advisor)) 
				{
					InputStream is = null;
					FileOutputStream fos = null;
					Part filePart = request.getPart("image");
					try {
						is = filePart.getInputStream();
						fos = new FileOutputStream("/Users/kasireddysangana/eclipse-workspace/RRRF/src/main/webapp/appimages/"+userId+".jpg");
						int ch;
						while((ch=is.read())!=-1) {
							fos.write(ch);
						}
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						try {
							if(is!=null)
								is.close();
							if(fos!=null)
								fos.close();
						}catch(Exception e) {
							e.printStackTrace();
						}
					}
					/*out.print("<html><body>");
					out.print("<script type=text/javascript>");
					//out.print("alert('Advisor Registered Successfully')");
					out.print("Advisor Registered Successfully");
					out.print("</script>");
					out.print("</body></html>");
					rd = request.getRequestDispatcher("index2.jsp");
					rd.forward(request, response);*/
					response.sendRedirect("/RRRF/index");
				}
				else {
					out.println("<center><h1>Advisor registration failed :(</h1></center>");
					out.print("<hr width=100% size=3 color=red>");
					System.out.println("Hello New Message");
					rd = request.getRequestDispatcher("index2.jsp");
					rd.include(request, response);
				}
			}
		}
		else {
			
			out.println("<center><h1>User could not be creatred properly and so Advisor :(</h1></center>");
			out.print("<hr width=100% size=3 color=red>");
			rd = request.getRequestDispatcher("index2.jsp");
			rd.include(request, response);
		}
	}

	/*
	 * This method is used to insert a new record into Location Table if not in Table.
	 */
	private void insertLocationIfNotInTable(String locationName)
	{
		boolean locationExists = new LocationDAO().fetchLocationByName(locationName);
		if(!locationExists)
		{
			List<Location> locationsList = null;
			String newLocationId = null;
			Location location = new Location();
			locationsList = new LocationDAO().fetchLocations();
			if(locationsList.size()>0)
			{
				String tableLocationId = locationsList.get(0).getLocationId();
				int nextSequenceNo = RRRFUtility.getNextSequenceNo(tableLocationId);
				nextSequenceNo++;
				newLocationId = "L"+nextSequenceNo;
			}else
			{
				newLocationId ="L10001";
			}
			location.setLocationId(newLocationId);
			location.setLocation(locationName);
			new LocationDAO().createLocation(location);
		}
	}
	
}
