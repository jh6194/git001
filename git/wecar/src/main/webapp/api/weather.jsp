<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class = "container">
		<h4>전국 날씨예보</h4>
		<p class = "weather"></p>
		
		<script>
			$(function() {
				$(".weather").empty();
				$.ajax({
						url:"${pageContext.request.contextPath}/Weather"
						,type:"get"
						,dataType:"xml"
						,success:function(xml){
								var header = $(xml).find("header");
								var text = $(header).find("wf").text();
								$(".weather").append(text);
						},error:function(xhr,textStatus,errorThrown){
							$(".weather").html(textStatus+"(HTTP-"+xhr.status+"/"+errorThrown+")");
						}
					});
				});
		</script>
	</div>
</body>
</html>