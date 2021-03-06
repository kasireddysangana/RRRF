 <%@page import="com.kasi.rrrf.entity.AdvisorBasicDetails,com.kasi.rrrf.dao.AdvisorDAO,java.util.List,com.kasi.rrrf.entity.RateAndReview,com.kasi.rrrf.dao.RateAndReviewDAO,
 		com.kasi.rrrf.entity.Location,com.kasi.rrrf.dao.LocationDAO" %>

<%
			AdvisorBasicDetails advisor = (AdvisorBasicDetails)request.getAttribute("advisor");
			//List<ReviewsAndRating> reviewList = new ReviewsAndRatingDAO().fetchReviews(advisor.getAdvisorUserId());
			Integer finalRating = (Integer)request.getAttribute("finalRating");
			Integer counter = (Integer)request.getAttribute("counter");
			Integer totalNoOfReviews = (Integer)request.getAttribute("totalNoOfReviews");
			String advisorId = advisor.getAdvisorUserId();
			System.out.println("In advisorshortinfo advisorId : " + advisorId);
			int hourlyRate = (int) (advisor.getHourlyRate());
			if(counter%2==1)
			{
					
						
		%>
			<div id="advisorDetails" class="col-md-12" style="flex-direction:row">
			
				<div class="col-md-6">	
					<div >
						<div class="col-md-6 col-sm-6" style="margin-bottom:10px">
							<%if(finalRating!=0){ %>
							<a href="advisorProfile1.jsp?advisorId=<%=advisorId%>&rating=<%=finalRating%>"><img src="./appimages/<%=advisorId%>.jpg" class="profile"></a>
							<%}else{ %>
							<a href="advisorProfile1.jsp?advisorId=<%=advisorId%>"><img src="./appimages/<%=advisorId%>.jpg" class="profile"></a>
							<%} %>
						</div>
						<div class="col-md-6">
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
					
					<div class="profileDetails col-md-12">
						<p><%=advisor.getDescription() %> <a href="#" style="text-decoration:none">More>></a></p>
					</div>
					
				</div>	
			
			<%counter++;
			} else{%>
			
				<div class="col-md-6">	
					<div>
						<div class="col-md-6 col-sm-6 " style="margin-bottom:10px">
						<%if(finalRating!=0){ %>
						
							<a href="advisorProfile1.jsp?advisorId=<%=advisorId%>&rating=<%=finalRating%>"><img src="./appimages/<%=advisorId%>.jpg" class="profile"></a>
						
							<%}else{ %>
						
							<a href="advisorProfile1.jsp?advisorId=<%=advisorId%>"><img src="./appimages/<%=advisorId%>.jpg" class="profile"></a>
						
							<%} %>
						
						</div>
						<div class="col-md-6">
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
					
					
					<div class="profileDetails col-md-12">
						<p><%=advisor.getDescription() %> <a href="#" style="text-decoration:none">More>></a></p>
					</div>
					</div>
				</div>
				<div class="profileDetails row">
					<hr>
					</div>
				<%counter++;}%>
		