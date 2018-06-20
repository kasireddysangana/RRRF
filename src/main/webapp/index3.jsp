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
                <!-- <div class="form-group" style="text-align:center;  margin-left:40%;"> -->
                <div class="form-group" style="text-align:center;">
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
					String advisorId=advisor.getAdvisorUserId();
					
					/*request.setAttribute("advisor", advisor);
					request.setAttribute("finalRating", finalRating);
					request.setAttribute("counter", counter);
					request.setAttribute("totalNoOfReviews",totalNoOfReviews);*/
					if(counter%2==1)
					{
		%>
			<%-- <jsp:include page="advisorshortinfo.jsp">
				<jsp:param name="advisor" value="advisor"/>
			</jsp:include> --%>
			<div id="advisorDetails" style="flex-direction:row">
			
				<div class="col-md-4">	
					<div >
						<div class="col-md-4" style="margin-bottom:10px">
							<%if(finalRating!=0){ %>
							<a href="advisorProfile1.jsp?advisorId=<%=advisorId%>&rating=<%=finalRating%>"><img src="./appimages/<%=advisorId%>.jpg" class="profile"></a>
							<%}else{ %>
							<a href="advisorProfile1.jsp?advisorId=<%=advisorId%>"><img src="./appimages/<%=advisorId%>.jpg" class="profile"></a>
							<%} %>
						</div>
						<div class="col-md-4">
							<div>
								<%if(finalRating!=0){ %>
								<h3><a href="advisorProfile1.jsp?advisorId=<%=advisorId%>&rating=<%=finalRating%>" style="text-decoration:none"><%=advisor.getDisplayName() %></a></h3>
								<%}else{ %>
								<h3><a href="advisorProfile1.jsp?advisorId=<%=advisorId%>" style="text-decoration:none"><%=advisor.getDisplayName() %></a></h3>
								<%} %>
							</div>
							
								<div>
								<a href="" id="rating"  
								style="text-decoration:none;font-size:30px" >
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
								<a href="GetReviewsAndRatingServlet?advisorId=<%=advisorId%>&rating=<%=finalRating%>&displayName=<%=advisor.getDisplayName()%>" style="text-decoration:none;font-size:20px"><%=totalNoOfReviews%> customer reviews </a>
							</div>
							<div>
								<h4>Experience - <%=advisor.getYearsOfExp() %> Years</h4>
							</div>
							<div>
								<h4>Hourly Rate : Rs <%=hourlyRate%>/-</h4>
							</div>
						</div>
					
					</div>
					
					<div class="profileDetails col-md-8">
						<p><%=advisor.getDescription() %> <a href="#" style="text-decoration:none">More>></a></p>
					</div>
					
				</div>	
				<%counter++;
			} else{%>
			
				<div>	
					<div>
						<div class="col-md-4 col-sm-4 " style="margin-bottom:10px">
						<%if(finalRating!=0){ %>
						
							<a href="advisorProfile1.jsp?advisorId=<%=advisorId%>&rating=<%=finalRating%>"><img src="./appimages/<%=advisorId%>.jpg" class="profile"></a>
						
							<%}else{ %>
						
							<a href="advisorProfile1.jsp?advisorId=<%=advisorId%>"><img src="./appimages/<%=advisorId%>.jpg" class="profile"></a>
						
							<%} %>
						
						</div>
						<div class="col-md-4">
							<div>
								<%if(finalRating!=0){ %>
								<h3><a href="advisorProfile1.jsp?advisorId=<%=advisorId%>&rating=<%=finalRating%>" style="text-decoration:none"><%=advisor.getDisplayName() %></a></h3>
								<%}else{ %>
								<h3><a href="advisorProfile1.jsp?advisorId=<%=advisorId%>" style="text-decoration:none"><%=advisor.getDisplayName() %></a></h3>
								<%} %>
							</div>
						
								<a href="" 
								id="rating" style="text-decoration:none;font-size:30px">
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
								<a href="GetReviewsAndRatingServlet?advisorId=<%=advisorId%>&rating=<%=finalRating%>&displayName=<%=advisor.getDisplayName()%>" style="text-decoration:none;font-size:20px"><%=totalNoOfReviews%> customer reviews </a>
							</div>
							<div>
								<h4>Experience - <%=advisor.getYearsOfExp() %> Years</h4>
							</div>
							<div>
								<h4>Hourly Rate : Rs <%=hourlyRate%>/-</h4>
							</div>
						</div>
					
					
					<div class="profileDetails col-md-8">
						<p><%=advisor.getDescription() %> <a href="#" style="text-decoration:none">More>></a></p>
					</div>
					</div>
				</div>
				<div class="profileDetails row">
					<hr>
					</div>
				<%counter++;}%>
			<%} }%>
			</form>
			</div>
			
			</div>
	
</body>
</html>
