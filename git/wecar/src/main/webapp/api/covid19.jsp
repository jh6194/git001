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
	<div class = "container panel panel-info c19">
		<h3 class = "panel-heading">코로나</h3>
		<table class = "table table-striped">
			<thead><tr><th scope = "col">기준일</th><th scope = "col">확진자 수</th><th scope = "col">사망자수</th></tr></thead>
			<tbody>
			</tbody>
		</table>
	</div>
	
	<script>
		$(function() {
			$(".c19 tbody").empty();
			$.ajax({
					url:"${pageContext.request.contextPath}/COVID19"
					,type:"get"										
					,dataType:"xml"
					,success:function(xml){
						var item = $(xml).find("item");
						for (var i = 0; i < item.length; i++) {
							tr = $("<tr>");
							td1 = $("<td>").html($(item[i]).find("stateDt").text());
							td2 = $("<td>").html($(item[i]).find("decideCnt").text());
							td3 = $("<td>").html($(item[i]).find("deathCnt").text());
							tr.append(td1).append(td2).append(td3);
							$(".c19 tbody").append(tr);
						}
					},error:function(xhr,textStatus,errorThrown){
						$(".c19 tbody").html(textStatus+"(HTTP-"+xhr.status+"/"+errorThrown+")");
					}
				});
			});
	</script>
</body>
</html>