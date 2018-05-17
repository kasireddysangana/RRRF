<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.kasi.rrrf.entity.AdvisorBasicDetails,com.kasi.rrrf.dao.AdvisorDAO,java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="./css/index.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
	</head>
<body>
	<div class="container">
		
			<div style="text-align:center">
				<h2 style="color:red">Welcome to Investment Advisors site!!!</h2>
			</div>
			<hr/>
			
			<div class="secondHeader">
				
				
				<div class="form-group" style="text-align:center; top-padding:5px; margin-left:40%; margin-top:13px">
					<label for="sel1">Location</label>
	  					<select id="location" >
						    <option>Select</option>
						    <option>Hyderabad</option>
						    <option>Secunderabad</option>
						    <option>Guntur</option>
						    <option>Vijayawada</option>
	  					</select>
				</div>

				<div >
					<div class="pull-right" style="padding:5px">
						 <button type="button" class="btn btn-success btn-md" onclick="document.getElementById('login').style.display='block'" style="width:auto;">Login</button> 
						<!--<button type="button" class="btn btn-success btn-md" onclick="location.href = 'login1.jsp';" style="width:auto;">Login</button>-->
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
			<div id="login" class="modal">
				<form class="modal-content animate" action="http://http://localhost:8080/UserLoginServlet">
					<div class="imgcontainer">
				      <span onclick="document.getElementById('login').style.display='none'" class="close" title="Close Modal">&times;</span>
				      
				      <img src="./images/img-01.png" alt="Avatar" class="avatar">
				    </div>
				
				    <div class="container">
				      <!-- <label for="uname"><b>User Name</b></label><br> -->
				      <!-- <input type="text" placeholder="Enter Username" name="uname" required class="glyphicon glyphicon-user"><br> -->
				      
				      <div class="inner-addon left-addon">
					      <i class="glyphicon glyphicon-user"></i>      
					      <input type="text"  placeholder="Username" />
					   </div>
				
				      <!-- <label for="pwd"><b>Password</b></label><br>
				      <input type="password" placeholder="Enter Password" name="pwd" required><br> -->
				      
				      <div class="inner-addon left-addon">
					      <i class="glyphicon glyphicon-lock"></i>      
					      <input type="password"  placeholder="Password" />
					   </div>
					   
				      <button type="submit" class="loginButton">Login</button><br>
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
				<form class="modal-content animate" action="http://192.168.0.3:8080/RRRF/ClientRegistrationServlet" method="post">
					<div class="imgcontainer">
				      <span onclick="document.getElementById('registerClient').style.display='none'" class="close" title="Close Modal">&times;</span>
				     
				    </div>
				
				    <div class="container">
				      <label><b>Client Name</b></label><br>
				      <input type="text" placeholder="Enter Client Name" name="cname" required><br>
				
				      <label><b>Password</b></label><br>
				      <input type="password" placeholder="Enter Password" name="cpwd" required><br>
				      
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
				<form class="modal-content animate" action="http://192.168.0.3:8080/RRRF/AdvisorRegistrationServlet" method="post">
					<div class="imgcontainer">
				      <span onclick="document.getElementById('registerAdvisor').style.display='none'" class="close" title="Close Modal">&times;</span>
				    </div>
				    
					<div class="container">
					
				    		  <label><b>Advisor First Name</b></label><br>
						      <input type="text" placeholder="Enter First Name" name="afname" maxlength="30" required ><br>
						      	
							  <label><b>Advisor Second Name</b></label><br>
						      <input type="text" placeholder="Enter Second Name" name="asname" maxlength="30" required><br>
						    
						      <label><b>Advisor Display Name</b></label><br>
						      <input type="text" placeholder="Enter Display Name" name="adname" maxlength="50" required><br>
						      
						      <label><b>Password</b></label><br>
						      <input type="password" placeholder="Enter Password" name="apwd" maxlength="30" required><br>
						      
						      <label><b>Mobile Number</b></label><br>
						      <input type="text" placeholder="Enter Mobile" name="amobile" maxlength="10" required><br>
						      
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
						      <input type="file" placeholder="Browse Photo" name="aphoto" accept="image/x-png,image/gif,image/jpeg"><br>
						      
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
		
		<%
			List<AdvisorBasicDetails> alist = new AdvisorDAO().fetchAdvisorBasicDetails();
				for(AdvisorBasicDetails adv : alist)
				{
					
				}	
		%>
		<!--  Code to display first two Advisor Profiles - Start -->
		<form action="" method="post">
		
			<div class="col-md-12" style="flex-direction:row">
			
				<div class="col-md-6">	
					<div >
						<div class="col-md-6 col-sm-6" style="margin-bottom:10px">
							<a href="advisorProfile.jsp"><img src="./images/kasi.jpg" class="profile"></a>
						</div>
						<div class="col-md-6">
							<div>
								<h3><a href="advisorProfile.jsp" style="text-decoration:none">Kasi Reddy Sangana</a></h3>
							</div>
							<div>
								<a href="" style="text-decoration:none"><img src="./images/rating1.png" width=150px></a>
							</div>
							<div>
								<h4>Experience - 3 Years</h4>
							</div>
							<div>
								<h4>Hourly Rate : 3000/-</h4>
							</div>
						</div>
					
					</div>
					<div class="profileDetails col-md-12">
						<p>A Registered Investment Advisor (RIA) is defined by The Investment Advisers Act of 1940 as a 
						"person or firm that, for compensation, is engaged in the act of providing advice, making 
						recommendations, issuing reports or furnishing analysis on securities, either directly or through 
						publications." <a href="#" style="text-decoration:none">More>></a></p>
					</div>
					
				</div>	
			
				<div class="col-md-6">	
					<div >
						<div class="col-md-6 col-sm-6 " style="margin-bottom:10px">
							<a href=""><img src="./images/anuradha.jpg" class="profile"></a>
						</div>
						<div class="col-md-6">
							<div>
								<h3><a href="" style="text-decoration:none">Anuradha Sangana</a></h3>
							</div>
							<div>
								<a href="" style="text-decoration:none"><img src="./images/rating1.png" width=150px></a>
							</div>
							<div>
								<h4>Experience - 5 Years</h4>
							</div>
							<div>
								<h4>Hourly Rate : 3500/-</h4>
							</div>
						</div>
					
					</div>
					<div class="profileDetails col-md-12">
						<p>A Registered Investment Advisor (RIA) is defined by The Investment Advisers Act of 1940 as a 
						"person or firm that, for compensation, is engaged in the act of providing advice, making 
						recommendations, issuing reports or furnishing analysis on securities, either directly or through 
						publications." <a href="#" style="text-decoration:none">More>></a></p>
					</div>
					
				</div>
				
			</div>
			<!--  Code to display first two Advisor Profiles - End -->
			<div class="profileDetails"></div>
			<hr/>
			<!--  Code to display second set of two Advisor Profiles - Start -->
			<div class="col-md-12" style="flex-direction:row">
			
				<div class="col-md-6">	
					<div >
						<div class="col-md-6" style="margin-bottom:10px">
							<a href=""><img src="./images/adi.jpg" class="profile"></a>
						</div>
						<div class="col-md-6">
							<div>
								<h3><a href="" style="text-decoration:none">Adilakshmi Sangana</a></h3>
							</div>
							<div>
								<a href="" style="text-decoration:none"><img src="./images/rating1.png" width=150px></a>
							</div>
							<div>
								<h4>Experience - 2 Years</h4>
							</div>
							<div>
								<h4>Hourly Rate : 2000/-</h4>
							</div>
						</div>
					
					</div>
					<div class="profileDetails col-md-12">
						<p>A Registered Investment Advisor (RIA) is defined by The Investment Advisers Act of 1940 as a 
						"person or firm that, for compensation, is engaged in the act of providing advice, making 
						recommendations, issuing reports or furnishing analysis on securities, either directly or through 
						publications." <a href="#" style="text-decoration:none">More>></a></p>
					</div>
					
				</div>	
			
				<div class="col-md-6">	
					<div >
						<div class="col-md-6" style="margin-bottom:10px">
							<a href=""><img src="./images/netra.jpg" class="profile"></a>
						</div>
						<div class="col-md-6">
							<div>
								<h3><a href="" style="text-decoration:none">Netravarnani Sangana</a></h3>
							</div>
							<div>
								<a href="" style="text-decoration:none"><img src="./images/rating1.png" width=150px></a>
							</div>
							<div>
								<h4>Experience - 1 Years</h4>
							</div>
							<div>
								<h4>Hourly Rate : 1000/-</h4>
							</div>
						</div>
					
					</div>
					<div class="profileDetails col-md-12">
						<p>A Registered Investment Advisor (RIA) is defined by The Investment Advisers Act of 1940 as a 
						"person or firm that, for compensation, is engaged in the act of providing advice, making 
						recommendations, issuing reports or furnishing analysis on securities, either directly or through 
						publications." <a href="#" style="text-decoration:none">More>></a></p>
					</div>
					
				</div>
				
			</div>
			<!--  Code to display second set of two Advisor Profiles - End -->
			<div class="profileDetails"></div>
			<hr/>
			<!--  Code to display third set of two Advisor Profiles - Start -->
			<div class="col-md-12" style="flex-direction:row">
			
				<div class="col-md-6">	
					<div >
						<div class="col-md-6" style="margin-bottom:10px">
							<a href=""><img src="./images/4.jpg" class="profile"></a>
						</div>
						<div class="col-md-6">
							<div>
								<h3><a href="" style="text-decoration:none">Koti Reddy Bandi</a></h3>
							</div>
							<div>
								<a href="" style="text-decoration:none"><img src="./images/rating1.png" width=150px></a>
							</div>
							<div>
								<h4>Experience - 3 Years</h4>
							</div>
							<div>
								<h4>Hourly Rate : 3000/-</h4>
							</div>
						</div>
					
					</div>
					<div class="profileDetails col-md-12">
						<p>A Registered Investment Advisor (RIA) is defined by The Investment Advisers Act of 1940 as a 
						"person or firm that, for compensation, is engaged in the act of providing advice, making 
						recommendations, issuing reports or furnishing analysis on securities, either directly or through 
						publications." <a href="#" style="text-decoration:none">More>></a></p>
					</div>
					
				</div>	
		
				<div class="col-md-6">	
					<div >
						<div class="col-md-6" style="margin-bottom:10px">
							<a href=""><img src="./images/5.jpg" class="profile"></a>
						</div>
						<div class="col-md-6">
							<div>
								<h3><a href="" style="text-decoration:none">Surendra Reddy Bandi</a></h3>
							</div>
							<div>
								<a href="" style="text-decoration:none"><img src="./images/rating1.png" width=150px></a>
							</div>
							<div>
								<h4>Experience - 2 Years</h4>
							</div>
							<div>
								<h4>Hourly Rate : 2500/-</h4>
							</div>
						</div>
				
					</div>
					<div class="profileDetails col-md-12">
						<p>A Registered Investment Advisor (RIA) is defined by The Investment Advisers Act of 1940 as a 
						"person or firm that, for compensation, is engaged in the act of providing advice, making 
						recommendations, issuing reports or furnishing analysis on securities, either directly or through 
						publications." <a href="#" style="text-decoration:none">More>></a></p>
					</div>
				
				</div>
			
			</div>
		</form>
		<!--  Code to display third set of two Advisor Profiles - End -->
	</div>
</body>
</html>
