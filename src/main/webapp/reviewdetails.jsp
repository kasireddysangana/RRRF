<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review Details</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="./css/reviewdetails.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div>
					<h2>Client Reviews</h2>
				</div>
				<div>
					<%	int maxValue=3;
						for(int i=1; i<=maxValue; i++)
						{
							%>
						<span class="fa fa-star checked"></span>	
							<%
						}
						if(maxValue<5)
						{
							for(int i=maxValue;i<5;i++)
							{
								%>
								<span class="fa fa-star"></span>
								<%
							}
						}
					%>
					<!-- <span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span> -->
				</div>
				<div>
					<div>5 Star		50%</div>
					<div>4 Star</div>
					<div>3 Star</div>
					<div>2 Star</div>
					<div>1 Star</div>
				</div>
			</div>
		</div>
		
	</div>

</body>
</html>