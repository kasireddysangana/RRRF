<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sample Ratings Demo</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/reviewdetails.css">
</head>
<body>
	<a href="" style="text-decoration:none;font-size:30px">
									<%	int finalRating=3;
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
</body>
</html>