<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.kasi.rrrf.entity.AdvisorBasicDetails,com.kasi.rrrf.dao.AdvisorDAO,java.util.List,com.kasi.rrrf.entity.RateAndReview,com.kasi.rrrf.dao.RateAndReviewDAO,com.kasi.rrrf.entity.Location,com.kasi.rrrf.dao.LocationDAO" %>
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
		
		<script type="text/javascript">
		
		$(document).ready(function(){
				$("#location").change(function(){
					var location = document.getElementById('location').value;
					var url="GetRegisteredAdvisorsByLocationServlet?location="+location;
					window.location=url;
				});
			});
			
			
		</script>
	</head>
<body>
	<div class="container">
		
			<div style="text-align:center">
				<h2 style="color:red">Welcome to Investment Advisors site!!!</h2>
			</div>
			<hr/>
			<div class="secondHeader">
				<%
					List<Location> locationsList = new LocationDAO().fetchLocations();
						                                    if(locationsList.size()>0)
						                                    {
				%>
                <div class="form-group" style="text-align:center;  margin-left:40%;">
                    <label for="select"><h4>Location</h4></label>
                        <select id="location" name="location" class="location">
                        	<!-- onchange="location.href ='GetRegisteredAdvisorsByLocationServlet?location='"> --> 
                        																	
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
				<div >
					<div class="pull-right" style="padding:5px">
						 <button type="button" class="btn btn-success btn-md glyphicon glyphicon-user" id="loginbutton" onclick="document.getElementById('loginmodal').style.display='block'" style="width:auto;font-family:30px;font-weight:bold">Login</button> 
						
					</div>
					<div  class="dropdown pull-right" style="padding:5px">
						<button type="button" class="btn btn-primary btn-md dropdown-toggle" data-toggle="dropdown" 
							>Sign-up
								<span class="caret"> </span>
						</button>
						<ul class="dropdown-menu">
							<li class="dropDownButtons" onclick="document.getElementById('registerAdvisor').style.display='block'"><a href="#">Advisor Sign-up</a></li>
							<li class="dropDownButtons" onclick="document.getElementById('registerClient').style.display='block'"><a href="#">Client Sign-up</a></li>
						</ul>
					</div>
				</div>
				
			</div>
			<!--  Code for Login Screen - Start -->
			<div id="loginmodal" class="modal">
				<!-- <form class="modal-content animate" action="http://localhost:8080/UserLoginServlet"> -->
				<form class="modal-content animate" method="post">
					<div class="imgcontainer">
				      <span onclick="document.getElementById('login').style.display='none'" class="close" title="Close Modal">&times;</span>
				      
				      <img src="./images/img-01.png" alt="Avatar" class="avatar">
				    </div>
				
				    <div class="container">
				      
				      <div class="inner-addon left-addon">
					      <i class="glyphicon glyphicon-user"></i>      
					      <input type="text"  name="userName" placeholder="Username" />
					   </div>
				
				      <!-- <label for="pwd"><b>Password</b></label><br>
				      <input type="password" placeholder="Enter Password" name="pwd" required><br> -->
				      
				      <div class="inner-addon left-addon">
					      <i class="glyphicon glyphicon-lock"></i>      
					      <input type="password"  name="password" placeholder="Password" />
					   </div>
					   
				      <button type="submit" class="loginButton" id="login">Login</button><br>
				      <label>
				        <input type="checkbox" checked="checked" name="remember"> Remember me
				      </label>
				    </div>
				
				   <div class="container" style="background-color:#f1f1f1 width:44%" >
				      <button type="button" onclick="document.getElementById('login').style.display='none'" class="cancelbtn">Cancel</button>
				      <span class="pwd">Forgot <a href="#">password?</a></span>
				    </div>
					
					
				</form>
			</div>
			<script>
				// Get the modal
				var modal = document.getElementById('login');
				
				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
				    if (event.target == modal) {
				        modal.style.display = "none";
				    }
				}
			</script>
		<!--  Code for Login Screen - End -->
	
		<!--  Code for Client Registration Screen - Start -->
			<div id="registerClient" class="modal">
				<form class="modal-content animate" action="http://localhost:8080/RRRF/ClientRegistrationServlet" method="post">
					<div class="imgcontainer">
				      <span onclick="document.getElementById('registerClient').style.display='none'" class="close" title="Close Modal">&times;</span>
				     
				    </div>
				
				    <div class="container">
				      
				      <label><b>Client User Name</b></label><br>
					  <input type="text" placeholder="Enter User Name" name="cuname" maxlength="30" required ><br>
						
					  <label><b>Password</b></label><br>
				      <input type="password" placeholder="Enter Password" name="cpwd" required><br>
				            
				      <label><b>Client Name</b></label><br>
				      <input type="text" placeholder="Enter Client Name" name="cname" required><br>
				
				      <label><b>Mobile Number</b></label><br>
				      <input type="text" placeholder="Enter Mobile" name="cmobile" required><br>
				      
				      <label><b>Location</b></label><br>
				      <input type="text" placeholder="Enter Location" name="clocation" required><br>
				      
				      <button type="submit" class="registerButton btn-primary">Register</button><br>
				      
				    </div>
				</form>
			</div>
			<script>
				// Get the modal
				var modal = document.getElementById('registerClient');
				
				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
				    if (event.target == modal) {
				        modal.style.display = "none";
				    }
				}
			</script>
		<!--  Code for Client Registration Screen - End -->
		
		<!--  Code for Advisor Registration Screen - Start -->
			<div id="registerAdvisor" class="modal">
				<form class="modal-content animate" action="http://localhost:8080/RRRF/AdvisorRegistrationServlet" method="post" enctype="multipart/form-data">
					<div class="imgcontainer">
				      <span onclick="document.getElementById('registerAdvisor').style.display='none'" class="close" title="Close Modal">&times;</span>
				    </div>
				    
					<div class="container">
					
							  <label><b>Advisor User Name</b></label><br>
						      <input type="text" placeholder="Enter User Name" name="auname" maxlength="30" required ><br>
						      
						      <label><b>Password</b></label><br>
						      <input type="password" placeholder="Enter Password" name="apwd" maxlength="30" required><br>
						      
				    		  <label><b>Advisor First Name</b></label><br>
						      <input type="text" placeholder="Enter First Name" name="afname" maxlength="30" required ><br>
						      	
							  <label><b>Advisor Last Name</b></label><br>
						      <input type="text" placeholder="Enter Last Name" name="alname" maxlength="30" required><br>
						    
						      <label><b>Advisor Display Name</b></label><br>
						      <input type="text" placeholder="Enter Display Name" name="adname" maxlength="50" required><br>
						      
						      <label><b>Mobile Number</b></label><br>
						      <input type="text" placeholder="Enter Mobile" name="amobile" maxlength="13" required><br>
						      
						      <label><b>Years Of Experience</b></label><br>
						      <input type="text" placeholder="Enter Experience" name="aexp" maxlength="5" required><br>
						      
						      <label><b>Hourly Rate</b></label><br>
						      <input type="text" placeholder="Enter Hourly Rate" name="arate" maxlength="5" required><br>
						      
						      <label><b>Qualification</b></label><br>
						      <input type="text" placeholder="Enter Qualification" name="aqualification" maxlength="30" required><br>
						      
						      <label><b>Location</b></label><br>
						      <input type="text" placeholder="Enter Location" name="alocation" maxlength="30" required><br>
						      
						      <label><b>Brief Description</b></label><br>
						      <input type="text" placeholder="Brief Description" name="adescription" required><br>
						      
						      <label><b>Upload Your Photo</b></label><br>
						      <input type="file" placeholder="Browse Photo" name="image" accept="image/x-png,image/gif,image/jpeg"><br>
						      
						      <button type="submit" class="registerButton btn-primary">Register</button><br>
						      
					</div>
				</form>
			</div>
			<script>
				// Get the modal
				var modal = document.getElementById('registerAdvisor');
				
				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
				    if (event.target == modal) {
				        modal.style.display = "none";
				    }
				}
			</script>
		<!--  Code for Advisor Registration Screen - End -->
		
		
		
		<!--  Code to display all the Advisors registered in the site -->
		
		
		<!--  Code to display first two Advisor Profiles - Start -->
		<div id="advisorsList">
		<form action="" method="post">
		<%
			List<AdvisorBasicDetails> advisorList = (List<AdvisorBasicDetails>) request.getAttribute("advisorsList");
				List<RateAndReview> reviewList = null;
				Integer counter=0;
				
				for(AdvisorBasicDetails advisor : advisorList)
				{
					reviewList = new RateAndReviewDAO().fetchReviews(advisor.getAdvisorUserId());
					if(reviewList.size()>0)
					{
						int hourlyRate = (int) (advisor.getHourlyRate());
						int rating = 0;
						int totalNoOfReviews = reviewList.size();
						Integer finalRating = 0;
						
						for(RateAndReview review : reviewList)
						{
							rating = rating+review.getRating();
						}
						finalRating = rating/totalNoOfReviews;
						counter++;
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
			
			<ul class="pager">
				  <li class="previous"><a href="#">Previous</a></li>
				  <li class="next"><a href="#">Next</a></li>
				</ul>		
	
</body>
</html>
