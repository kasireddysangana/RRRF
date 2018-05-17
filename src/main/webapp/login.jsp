<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/login.css">
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
		
		<h2>Login Form</h2>

		<form action="/action_page.php">
  			<div class="imgcontainer">
    			<img src="img_avatar2.png" alt="Avatar" class="avatar">
  			</div>

		  <div class="container">
		    <label for="uname"><b>User Name</b></label>
		    <input type="text" placeholder="Enter User Name" name="uname" required>
		
		    <label for="psw"><b>Password</b></label>
		    <input type="password" placeholder="Enter Password" name="psw" required>
		        
		    <button type="submit">Login</button>
		    <label>
		      <input type="checkbox" checked="checked" name="remember"> Remember me
		    </label>
		  </div>
		
		  <div class="container" style="background-color:#f1f1f1">
		    <button type="button" class="cancelbtn">Cancel</button>
		    <span class="psw">Forgot <a href="#">password?</a></span>
		  </div>
		</form>
		<hr>
	</div>	
</body>
</html>