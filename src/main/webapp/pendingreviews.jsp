<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kasi.rrrf.dao.ServiceUtilizedDAO, java.util.ArrayList,com.kasi.rrrf.dao.AdvisorDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pending Advisors List</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="./css/pendingreviews.css">
		<link rel="stylesheet" href="./css/starrating.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		
		<!-- default styles -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
		<link href="path/to/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
		 
		<!-- optionally if you need to use a theme, then include the theme CSS file as mentioned below -->
		<link href="path/to/themes/krajee-svg/theme.css" media="all" rel="stylesheet" type="text/css" />
		 
		<!-- important mandatory libraries -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
		<script src="path/to/js/star-rating.js" type="text/javascript"></script>
		 
		<!-- optionally if you need to use a theme, then include the theme JS file as mentioned below -->
		<script src="path/to/themes/krajee-svg/theme.js"></script>
		 
		<!-- optionally if you need translation for your language then include locale file as mentioned below -->
	
		
		<script type="text/javascript">
				$(document).ready(function()
				{
					//$("submitButton").show();
					
					$('input[name=rating]').click(function(e)
					{
						console.log('radio button clicked '+$(this).val());
					})
				});
			var enableSubmitButton = false;
			/*function onRatingGiven(element,id)
			{
				console.log("rating: "+id);
				//console.log("rating value: "+id.valu());
				var rating = $(element).find('input[name=rating]:checked');
				console.log(rating.val());
				$('#'+id).show();
				//$(document).ready(function() {
				    //$('#myrating').click(function() {
				        $('#submitButton').show();
				    //});
				//});
				//$("#showButton").show("slow");
				//enableSubmitButton = true;
			}*/
			
			
		</script>
</head>
<body>
	<div class="container">
	<%
		String clientUserId="U10005";
		ArrayList<String> pendingAdvisorReviewsList  = (ArrayList) new ServiceUtilizedDAO().getPendingReviewsList(clientUserId);
		System.out.println("pendingAdvisorReviewsList : " + pendingAdvisorReviewsList);
	%>
	
	<h3 style="color:red"> Your Pending Reviews </h3>
	<hr>
	
	<%
		if(pendingAdvisorReviewsList.size() > 0)
		{
			for(String advisorUserId : pendingAdvisorReviewsList)
			{
				System.out.println("AdvisorId : " + advisorUserId);
				String advisorDisplayName = new AdvisorDAO().getAdvisorDisplayName(advisorUserId);
				//boolean enableSubmitButton = false;
				/* if(advisorDisplayName!=null)
				{ */
					System.out.println("Advisor id : " + advisorDisplayName);
					%>
					<div class=row>
						<div class="col-md-4">
							<a href="" ><img src="./appimages/<%=advisorUserId%>.jpg" class="profilePic"></a>
						</div>
						<div class="col-md-8">
							<div>
								<h3> <a href ="" style="text-decoration:none"><%=advisorDisplayName %></a></h3>
							</div>
							<div>
								<%-- <fieldset class="rating" id="myrating" onclick="onRatingGiven(this,'submitButton_<%=advisorUserId%>')"> --%>
								
								<fieldset class="rating" id="myrating">
									<input type="radio" id="star5_<%=advisorUserId%>" name="rating" value="5"/>
	    								<label class = "full" for="star5_<%=advisorUserId%>" title="Awesome - 5 stars" ></label>
	    							<input type="radio" id="star4half_<%=advisorUserId%>" name="rating" value="4.5" />
	    								<label class="half" for="star4half_<%=advisorUserId%>" title="Pretty good - 4.5 stars"></label>
	    								
	    							<input type="radio" id="star4_<%=advisorUserId%>" name="rating" value="4" />
	    								<label class = "full" for="star4_<%=advisorUserId%>" title="Pretty good - 4 stars"></label>	
								    <input type="radio" id="star3half_<%=advisorUserId%>" name="rating" value="3.5" />
								    	<label class="half" for="star3half_<%=advisorUserId%>" title="Meh - 3.5 stars"></label>
								    	
								    <input type="radio" id="star3_<%=advisorUserId%>" name="rating" value="3" />
								    	<label class = "full" for="star3_<%=advisorUserId%>" title="Meh - 3 stars"></label>
								    <input type="radio" id="star2half_<%=advisorUserId%>" name="rating" value="2.5" />
								    	<label class="half" for="star2half_<%=advisorUserId%>" title="Kinda bad - 2.5 stars"></label>
								    	
								    <input type="radio" id="star2_<%=advisorUserId%>" name="rating" value="2" />
								    	<label class = "full" for="star2_<%=advisorUserId%>" title="Kinda bad - 2 stars"></label>
								    <input type="radio" id="star1half_<%=advisorUserId%>" name="rating" value="1.5" />
								    	<label class="half" for="star1half_<%=advisorUserId%>" title="Meh - 1.5 stars"></label>
								    
								    <input type="radio" id="star1_<%=advisorUserId%>" name="rating" value="1" />
								    	<label class = "full" for="star1_<%=advisorUserId%>" title="Sucks big time - 1 star"></label>	
								    <input type="radio" id="starhalf_<%=advisorUserId%>" name="rating" value="0.5" />
								    	<label class="half" for="starhalf_<%=advisorUserId%>" title="Sucks big time - 0.5 stars"></label>
								</fieldset>
								<br>
								<div id="reviewSubmitForm_<%=advisorUserId%>" class="ratingaction">
									<input type="button" value="Submit">
									<textarea name="reviewcomment"></textarea>
								</div>
								
							</div>
						</div>
					</div>
					<div style="clear:both">
						<hr>
					</div>
					<%
				//}
			}
		}
	%>
	
	
</body>
</html>