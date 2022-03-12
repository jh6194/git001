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
	<div class = "container panel panel-info">
		<h3 class = "panel-heading">DATA.GO.KR-API</h3>
		<table class = "table table-striped me">
			<caption>Me</caption>
			<thead><tr><th scope = "col">지역</th><th scope = "col">미세먼지농도</th></tr></thead>
			<tbody></tbody>
		</table>
		
		<script>
			$(function() {
				$(".me tbody").empty();
				$.ajax({
						url:"${pageContext.request.contextPath}/Me"
						,type:"get"
						,dataType:"json"
						,success:function(json){
							var data = json.data;
							for (var i = 0; i < data.length; i++) {
								tr = $("<tr>");
								td1 = $("<td>").html(data[i].loc);
								td2 = $("<td>").html(data[i].pm10_after);
								tr.append(td1).append(td2);
								$(".me tbody").append(tr);
							}
						},error:function(xhr,textStatus,errorThrown){
							$(".me tbody").html(textStatus+"(HTTP-"+xhr.status+"/"+errorThrown+")");
						}
					});
				});
		</script>
	</div>
</body>
</html>