<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List,com.kasi.rrrf.entity.RateAndReview,com.kasi.rrrf.dao.RateAndReviewDAO,java.lang.Math,java.text.SimpleDateFormat,java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="./css/review.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<title>Rate & Review </title>
	
	<script type="text/javascript">
			$(document).ready(function()
			{
				$("#writeReviewButton").click(function(){
					alert("Please login to rate and review");
					window.location.href="http://localhost:8080/RRRF/index";
					//$.post("http://localhost:8080/RRRF/index");
				})
			});
		</script>
	<%-- <%response.sendRedirect("/RRRF/index"); %> --%>

</head>
<body>
	<%
		List<RateAndReview> reviewsAndRatingList = (List<RateAndReview>)request.getAttribute("reviewsAndRatingList");
		Integer finalRating = (Integer)request.getAttribute("finalRating");
		String displayName = (String)request.getAttribute("displayName");
		String advisorUserId = (String)request.getAttribute("advisorUserId");
		
		int oneStarRatings = 0;		double oneStarPercentage = 0.0;
		int twoStarRatings = 0; 	double twoStarPercentage = 0.0;
		int threeStarRatings = 0;	double threeStarPercentage = 0.0;
		int fourStarRatings = 0; 	double fourStarPercentage = 0.0;
		int fiveStarRatings = 0;	double fiveStarPercentage = 0.0;
		int totalNoOfRatings = 0;
		SimpleDateFormat formatter = null;  
		String reviewDate = null;
		
		for(RateAndReview rar : reviewsAndRatingList)
		{
			
			totalNoOfRatings++;
			switch(rar.getRating())
			{
		case 1: 
			oneStarRatings++;
			break;
		case 2:
			twoStarRatings++;
			break;
		case 3:
			threeStarRatings++;
			break;
		case 4:
			fourStarRatings++;
			break;
		case 5:
			fiveStarRatings++;
			break;
			}
		}
		oneStarPercentage = (double) oneStarRatings/totalNoOfRatings*100;
		twoStarPercentage = (double) twoStarRatings/totalNoOfRatings*100;
		threeStarPercentage = (double)threeStarRatings/totalNoOfRatings*100;
		fourStarPercentage = (double) fourStarRatings/totalNoOfRatings*100;
		fiveStarPercentage = (double) fiveStarRatings/totalNoOfRatings*100;
	%>
	<div class="container">
		<div class="col-md-4">
			<div>
				<h2>Client Rating</h2>
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
				<div class="col-md-4" style="text-align:left">
					<div>5 Star</div>
					<div>4 Star</div>
					<div>3 Star</div>
					<div>2 Star</div>
					<div>1 Star</div>
					
				</div>
				<div class="col-md-4" style="align:left; margin-top:5px">
					<div class="progress">
					  <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
					  			style="height:10px;width:<%=fiveStarPercentage%>%;rounded-cor"></div>
					</div>
					<div class="progress">
					  <div class="progress-bar" role="progressbar" style="height:10px;width:<%=fourStarPercentage%>%;rounded-cor" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<div class="progress">
					  <div class="progress-bar" role="progressbar" style="height:10px;width:<%=threeStarPercentage%>%;rounded-cor" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<div class="progress">
					  <div class="progress-bar" role="progressbar" style="height:10px;width:<%=twoStarPercentage%>%;rounded-cor" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<div class="progress">
					  <div class="progress-bar" role="progressbar" style="height:10px;width:<%=oneStarPercentage%>%;rounded-cor" aria-valuenow="100" aria-valuemin="0" aria-valuemax="10"></div>
					</div>
				</div>
				<div class="col-md-4">
					<div><%=Math.round(fiveStarPercentage)%>%</div>
					<div><%=Math.round(fourStarPercentage)%>%</div>
					<div><%=Math.round(threeStarPercentage)%>%</div>
					<div><%=Math.round(twoStarPercentage)%>%</div>
					<div><%=Math.round(oneStarPercentage)%>%</div>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div>
				<img src="./appimages/<%=advisorUserId%>.jpg" class="profilePic" style="margin-top:30px">
			</div>
			<br>
			
		</div>
		<div class="col-md-4">
			<div>
				<h3 style="margin-top:100px;text-align:left;"><a href="#" class="displayName" style="text-decoration:none;"><%=displayName%></a></h3>
			</div>
			<div>
				<input type="button" class="btn btn-info btn-md" id="writeReviewButton" value="Write a Review" style="text-align:center;margin-top:10px;margin-left:40px">
			</div>
		</div>
		
		<div class="clearDetails"></div>
		<hr>
	
		<%
				int counter = 0;
					int rating = 0;
					for(RateAndReview rar : reviewsAndRatingList)
					{
				rating = rar.getRating();
				formatter = new SimpleDateFormat("MMMM dd yyyy");  
				reviewDate = formatter.format(rar.getReviewDate());  
					    if(counter==0)
				{
			%>
		<div>
			<div>
				<h3>Top Positive Reviews</h3>
			</div>
			<div>
				<a href="" style="text-decoration:none">see all positive reviews ></a>
			</div>
			<div>
				<%	
					for(int i=1; i<=rating; i++)
					{
				%>
					<span class="fa fa-star checked"></span>	
					<%
					}
					if(rating<5)
					{
						for(int i=rating;i<5;i++)
						{
					%>
					<span class="fa fa-star"></span>
					<%
						}
					}
					%>
					
				<%=rar.getReviewDescription() %>
			</div>
			<div>
				By <%=rar.getClientUserName() %> on <%=reviewDate%>
			</div>
		</div>
		
		<%
			counter++;
		}else{
				
			for(int i=1; i<=rating; i++)
			{
		%>
			<span class="fa fa-star checked"></span>	
			<%
			}
			if(rating<5)
			{
				for(int i=rating;i<5;i++)
				{
			%>
			<span class="fa fa-star"></span>
			<%
				}
			}
			%>
	
			<%=rar.getReviewDescription() %>
			
			<div>
				By <%=rar.getClientUserName() %> on <%=reviewDate%>
			</div>
		
		<%}
			counter++;	
		
		} %>
	</div>
	
</body>
</html>
