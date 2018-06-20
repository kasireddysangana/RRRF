<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kasi.rrrf.entity.UserDetails, javax.servlet.http.HttpSession" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Client Login</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		<script type="text/javascript">
			$(document).ready(function()
			{
				$("#pendingReviews").click(function(event){
					 event.preventDefault();
					$.get( "http://localhost:8080/RRRF/pendingreviews1.jsp", function( data ) {
						  $( "#ClientData" ).html( data );
						 });
				});
				$("#registeredAdvisors").click(function(event){
					event.preventDefault();
					$.get( "http://localhost:8080/RRRF/index3.jsp", function( data ) {
						  $( "#ClientData" ).html( data );
						 });
				});
				$("#signoutbutton").click(function(){
					$.post(
				             "UserSignOutServlet",
				              function(result) {
				            	 console.log(result);
				            	  if(result != null && result != "" ){
				            		  showMessage(result);
				            	  }
				            	  else{
				            		  alert("User unable to Signout");
				            	  }
				         });
					function showMessage(result){
				    	 alert(result);
				    	 window.location.replace("http://localhost:8080/RRRF/index");
				    	 };
				    	 
				})
			});
		</script>
		
</head>
<body>
	<%
		//String userName = (String) request.getAttribute("clientUserName");
		String userName = (String) request.getSession().getAttribute("clientUserName");
	%>
	<div class="container">
		<div style="text-align:center">
			<%-- <h2 style="color:red">Hello <%=userName %>, Welcome to Investment Advisors site!!!</h2> --%>
			<h2 style="color:red">Hello <%=userName %>, Welcome to Investment Advisors site!!!</h2>
		</div>
		<hr>
		<div >
			<div class="pull-right" style="padding:5px">
				<button type="button" class="btn btn-success btn-md" id="loginbutton" onclick="" style="width:auto;font-family:30px;font-weight:bold">userName</button>
				<button type="button" class="btn btn-danger btn-md" id="signoutbutton" onclick="" style="width:auto;font-family:30px;font-weight:bold">SignOut</button> 
			</div>

		<div style="width:250px;height:570px;float:left;clear:both">
			<br>
			
			<table width="243" border="0" align="center" cellpadding="5">
 				<tr>
  					<td height="60"></td>
				</tr>
					 
				<tr>
					<td height="30"><a href="" class="big" style="text-decoration:none" id="registeredAdvisors">
					  	<h3 style="font-family:cursive; color:#1f9cff">Registered Advisors</h3></a></td>
				</tr>
				
				<tr>
					 <td height="30" ><a href="" class="big" style="text-decoration:none" id="pendingReviews">
					  	<h3 style="font-family:cursive; color:#1f9cff">Pending Reviews</h3></a></td>
				</tr>
					 
			</table>
		</div>
		<div id="ClientData" style="width:890px;height:570px;float:left">
			
			<%-- <%@include file="pendingreviews1.jsp" %> --%>
			<%-- <%response.sendRedirect("/RRRF/index"); %> --%>
		</div>
	</div>
	</div>
</body>
</html>