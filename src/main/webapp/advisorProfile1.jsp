<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kasi.rrrf.entity.Advisor,com.kasi.rrrf.dao.AdvisorDAO,java.util.List,com.kasi.rrrf.entity.RateAndReview,com.kasi.rrrf.dao.RateAndReviewDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Advisor Profile</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="./css/advisorProfile.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<%
	String advisorId = (String) request.getParameter("advisorId");
	String strRating = (String) request.getParameter("rating");
	Integer finalRating = 0;
	if(strRating!=null)
	{
		finalRating  = Integer.parseInt(strRating);
	}
	//Integer finalRating = Integer.parseInt(request.getParameter("rating"));
	
	System.out.println("finalRating 1 : " + finalRating);
	System.out.println("advisorId : "  + advisorId);
	
	Advisor advisor = new AdvisorDAO().fetchAdvisorDetails(advisorId);
	//Advisor advisor = (Advisor) request.getAttribute("advisor");
	System.out.println("advisorId : "  + advisor.getAdvisorUserId());
	System.out.println("Display Name : "  + advisor.getDisplayName());
	if(advisor.getAdvisorUserId()!=null)
	{
		int hourlyRate = (int) (advisor.getHourlyRate());
	%>
	<div class="container">
		<div>	
				<div class="row">
					<div class="col-md-4" style="margin-top:15px">
						<a href="#"><img src="./appimages/<%=advisorId%>.jpg" class="advisorProfile"></a>
					</div>
					<div class="col-md-4" style="margin-top:15px">
						<div>
							<h3><a href="#" style="text-decoration:none"><%=advisor.getDisplayName() %></a></h3>
						</div>
						<div>
							<a href="" style="text-decoration:none;font-size:30px">
									<%	
										for(int i=1; i<=finalRating; i++)
										{
									%>
											<span class="fa fa-star checked"></span>	
										<%
										}
										if(finalRating<5)
										{
											for(int i=finalRating;i<5;i++)
											{
										%>
												<span class="fa fa-star"></span>
										<%
											}
										}
										%>
								
								</a>
						</div>
						<div>
							<h4>Experience - <%=advisor.getYearsOfExp() %> Years</h4>
						</div>
						<br>
						<div>
							<h4>Hourly Rate : Rs <%=hourlyRate%>/- </h4>
						</div>
						<br>
						<div>
							<h4><a href="">Contact Me</a></h4>
						</div>
						<br>
						<div>
							<h4><a href="#">Mail Me</a></h4>
						</div>
						
					</div>
				
				</div>
				<hr>
				<div class="row" >
					<h3>About</h3>
					<p style="font-size:20px">A Registered Investment Advisor (RIA) is defined by The Investment Advisers Act of 1940 as a 
					"person or firm that, for compensation, is engaged in the act of providing advice, making 
					recommendations, issuing reports or furnishing analysis on securities, either directly or through 
					publications." <a href="#" style="text-decoration:none">More>></a></p>
				
				</div>
				<hr>
				<div class="row">
					<h3>Qualification</h3>
					<p style="font-size:20px"><%=advisor.getQualificaiton() %><a href="#" style="text-decoration:none">More>></a></p>
				</div>
				
				<hr>
				<div class="row" >
					<h3>Experience Details</h3>
					<p style="font-size:20px">A Registered Investment Advisor (RIA) is defined by The Investment Advisers Act of 1940 as a 
					"person or firm that, for compensation, is engaged in the act of providing advice, making 
					recommendations, issuing reports or furnishing analysis on securities, either directly or through 
					publications." <a href="#" style="text-decoration:none">More>></a></p>
				</div>
				<hr>
			</div>
		</div>	
	<%} %>
</body>
</html>




