<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.kasi.rrrf.entity.AdvisorBasicDetails,com.kasi.rrrf.dao.AdvisorDAO,java.util.List,com.kasi.rrrf.entity.RateAndReview,
 com.kasi.rrrf.dao.RateAndReviewDAO,com.kasi.rrrf.entity.Location,com.kasi.rrrf.dao.LocationDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="./css/index.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		
	</head>
<body>
	<div class="container">
		
			<div class="secondHeader">
				<%
					List<Location> locationsList = new LocationDAO().fetchLocations();
						                                    if(locationsList.size()>0)
						                                    {
				%>
                <div class="form-group" style="text-align:center;  margin-left:40%;">
                    <label for="select"><h4>Location</h4></label>
                        <select id="location" name="location" class="location" 
                        onchange="location.href ='GetRegisteredAdvisorsByLocationServlet'">
                        																	
                            <option>Select</option>
                            <%
                            	for(Location location:locationsList)
                                                                                                {
                            %>
                <option value=<%=location.getLocation()%>><%=location.getLocation()%></option>
                            <%
                            	}
                            %>
                        </select>
                </div>
                <%
                	}
                %>
			</div>
				
		<!--  Code to display first two Advisor Profiles - Start -->
		<div id="advisorsList">
		<form action="" method="post">
		<%
			/* List<AdvisorBasicDetails> advisorList = (List<AdvisorBasicDetails>) request.getAttribute("advisorsList"); */
			List<AdvisorBasicDetails> advisorList = new AdvisorDAO().fetchAdvisorBasicDetails();
			List<RateAndReview> reviewList = null;
			Integer counter=0;
			if(advisorList.size() > 0)
			{
				for(AdvisorBasicDetails advisor : advisorList)
				{
				 	
				   reviewList = new RateAndReviewDAO().fetchReviews(advisor.getAdvisorUserId());
				
					int hourlyRate = (int) (advisor.getHourlyRate());
					int rating = 0;
					int totalNoOfReviews = 0;
					Integer finalRating = 0;
					counter++;
					if(reviewList.size() > 0)
					{
						totalNoOfReviews = reviewList.size();
						for(RateAndReview review : reviewList)
						{
							rating = rating+review.getRating();
						}
						finalRating = rating/totalNoOfReviews;
					}
					String userId=advisor.getAdvisorUserId();
					
					request.setAttribute("advisor", advisor);
					request.setAttribute("finalRating", finalRating);
					request.setAttribute("counter", counter);
					request.setAttribute("totalNoOfReviews",totalNoOfReviews);
		%>
			<jsp:include page="advisorshortinfo.jsp">
				<jsp:param name="advisor" value="advisor"/>
			</jsp:include>
			<%} }%>
			</form>
			</div>
			
			</div>
	
</body>
</html>
