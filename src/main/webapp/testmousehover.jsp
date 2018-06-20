<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<!-- <script type="text/javascript">
			$(document).ready(function()
			{
				$("#myratings").hover( function() 
				{
	  				alert( this.value );
				});
			});
		/* function onMouseOver()
		{
			alert("Hello");
		} */
	</script> -->
	
	<script type="text/javascript">
		$(document).ready(function()
		{
			$("#myratings").click(function(){
				alert("hello");
			});
		});
	</script>
	
</head>
<body>
	
	<div class="container" style="margin-top:20px">
		hello how are you
		<br>
		<!-- <div class="rating" style="font-size:30px" onselect="onMouseOver()"> -->
		<div class="rating" style="font-size:30px" id="myratings">
			<span class="glyphicon glyphicon-star"></span>
			<span class="glyphicon glyphicon-star"></span>
			<span class="glyphicon glyphicon-star"></span>
			<span class="glyphicon glyphicon-star"></span>
			<span class="glyphicon glyphicon-star"></span>  
		</div>
	</div>
</body>
</html>