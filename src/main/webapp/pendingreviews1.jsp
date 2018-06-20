<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kasi.rrrf.dao.ServiceUtilizedDAO,com.kasi.rrrf.entity.ServiceUtilized, java.util.ArrayList,com.kasi.rrrf.dao.AdvisorDAO,
	java.util.List" %>
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
		
		<script type="text/javascript">
		$(document).ready(function()
				{
					//$("submitButton").show();
					
					$('input[name=rating]').click(function(e)
					{
						//console.log('radio button clicked '+$(this).val());						
						var advisorId=$(e.target).data("advisorid");
						//console.log("advisor id:" + advisorId);
						$(this).parent().data("rating",$(this).val());
						
						$('#submitButton_'+advisorId).show();
				        //$('#submitButton').show();
					})
				});
			function onRatingGiven(element,id)
			{
				//console.log("rating in onRatingGiven Method : "+id);
				var rating = $(element).find('input[name=rating]:checked');
				//$(element).find("fieldset").data("rating").val()=rating;
				//$(element).
				console.log(rating.val());
				$('#'+id).show();
				        $('#submitButton').show();
			}
			function submitReview(element,advisorUserId,clientUserId,clientUserName,serviceId)
			{
				var rating = $(element).parent().parent().find("fieldset").data("rating");
				var reviewComments = $(element).parent().find("textarea").val();
				$.post(
			             "RateAndReviewServlet", 
			              {clientUserId:clientUserId, clientUserName:clientUserName, advisorUserId:advisorUserId, 
			            	 reviewComments:reviewComments, rating:rating, serviceId:serviceId },
			             function(result) {
			            	 console.log(result);
			            	  if(result != null && result != "" ){
			            		  showMessage(result);
			            	  }
			            	  else{
			            		  alert("Unable to update your Review");
			            	  }
			         });
				function showMessage(result){
			    	 //alert(("#"+clientUserId));
			    	  $("#"+advisorUserId).remove();
			    	};
			}
		</script>
</head>
<body>
	<div class="container">
	<%
		String clientUserId= (String) request.getSession().getAttribute("clientUserId");
		String clientUserName=(String) request.getSession().getAttribute("clientUserName");
		
		List<ServiceUtilized> pendingAdvisorReviewsList = new ServiceUtilizedDAO().getPendingReviewsList(clientUserId);
		System.out.println("pendingAdvisorReviewsList : " + pendingAdvisorReviewsList);
	%>
	
	<h3 style="color:red"> Your Pending Reviews </h3>
	<hr>
	
	<%
		if(pendingAdvisorReviewsList.size() > 0)
		{
			for(ServiceUtilized pendingServiceDetails : pendingAdvisorReviewsList)
			{
				String advisorUserId = pendingServiceDetails.getAdvisorUserId();
				clientUserId=pendingServiceDetails.getClientUserId();
				int serviceId = pendingServiceDetails.getServiceId();
				System.out.println("AdvisorId : " + pendingServiceDetails.getAdvisorUserId());
				String advisorDisplayName = new AdvisorDAO().getAdvisorDisplayName(pendingServiceDetails.getAdvisorUserId());
			
				System.out.println("Advisor id : " + advisorDisplayName);
					%>
					<div class=row id="<%=advisorUserId%>">
						<div class="col-md-4">
							<a href="" ><img src="./appimages/<%=advisorUserId%>.jpg" class="profilePic"></a>
						</div>
						<div class="col-md-8">
							<div>
								<h3> <a href ="" style="text-decoration:none"><%=advisorDisplayName %></a></h3>
							</div>
							<div>
								<%-- <fieldset class="rating" id="myrating" data-rating="5" data-advisorid="<%=advisorUserId%>" onclick="onRatingGiven(this,'submitButton_<%=advisorUserId%>')"> --%>
								<fieldset class="rating" id="myrating" data-rating="5" data-advisorid="<%=advisorUserId%>">
									<input type="radio" id="star5_<%=advisorUserId%>" data-advisorid="<%=advisorUserId%>" name="rating" value="5"/>
	    								<label class = "full" for="star5_<%=advisorUserId%>" title="Awesome - 5 stars" ></label>
	    								
	    							<input type="radio" id="star4_<%=advisorUserId%>" data-advisorid="<%=advisorUserId%>" name="rating" value="4" />
	    								<label class = "full" for="star4_<%=advisorUserId%>" title="Pretty good - 4 stars"></label>	
								    	
								    <input type="radio" id="star3_<%=advisorUserId%>" data-advisorid="<%=advisorUserId%>" name="rating" value="3" />
								    	<label class = "full" for="star3_<%=advisorUserId%>" title="Meh - 3 stars"></label>
								    	
								    <input type="radio" id="star2_<%=advisorUserId%>" data-advisorid="<%=advisorUserId%>" name="rating" value="2" />
								    	<label class = "full" for="star2_<%=advisorUserId%>" title="Kinda bad - 2 stars"></label>
								    
								    <input type="radio" id="star1_<%=advisorUserId%>" data-advisorid="<%=advisorUserId%>" name="rating" value="1" />
								    	<label class = "full" for="star1_<%=advisorUserId%>" title="Sucks big time - 1 star"></label>	
								    
								</fieldset>
								<br>
								<div id="submitButton_<%=advisorUserId%>" class="ratingaction">
									<textarea name="reviewcomment"></textarea>
									<input type="button" value="Submit" onclick="submitReview(this,'<%=advisorUserId%>','<%=clientUserId%>','<%=clientUserName%>','<%=serviceId%>')">
								</div>
								
							</div>
						</div>
						<div style="clear:both">
							<hr>
						</div>
					</div>
					
					<%
				//}
			}
		}
	%>
	</div>
	
</body>
</html>