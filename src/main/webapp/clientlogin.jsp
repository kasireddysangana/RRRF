<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kasi.rrrf.entity.UserDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Client Login</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="./css/clientlogin.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%-- <%
		UserDetails userDetails = (UserDetails) request.getAttribute("userDetails");
		String userId = userDetails.getUserId();
		String userName = userDetails.getUserName();
	%> --%>
	<div class="container">
		<div style="text-align:center">
			<%-- <h2 style="color:red">Hello <%=userName %>, Welcome to Investment Advisors site!!!</h2> --%>
			<h2 style="color:red">Hello Kasi, Welcome to Investment Advisors site!!!</h2>
		</div>
		<hr>
		<div>
			<div class="pull-right" style="padding:5px">
				<button type="button" class="btn btn-success btn-md" id="loginbutton" onclick="" style="width:auto;font-family:30px;font-weight:bold">userName</button>
				<button type="button" class="btn btn-danger btn-md" id="signoutbutton" onclick="" style="width:auto;font-family:30px;font-weight:bold">SignOut</button> 
			</div>
			
			
		<table style="height: 400px; width: 700px;">  <tbody>
			<tr>
			   <%-- <td colspan="2" height="100" width="700"><%@ include file="./index2.jsp"%></td> --%>
			</tr>
			
			<tr>
				<td colspan="2" height="100" width="700"><%@ include file="./index2.jsp"%></td>
			    
			   
			   <%-- <td align="center" height="100" valign="top" width="400"><%@ include
			     file=""%></td> --%>
  			</tr>
  			
			
</tbody></table>
		
		
		
	</div>
</body>
</html>