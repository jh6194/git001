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
	<script>
		function setCookie(cname, cvalue, exdays) {
			  const d = new Date();
			  d.setTime(d.getTime() + (exdays*24*60*60*1000));
			  let expires = "expires="+ d.toUTCString();
			  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
		}
		
		function getCookie(cname) {
			let name = cname + "=";
			let decodedCookie = decodeURIComponent(document.cookie);
			let ca = decodedCookie.split(';');
			for(let i = 0; i <ca.length; i++) {
				let c = ca[i];
				while (c.charAt(0) == ' ') {
					c = c.substring(1);
				}
				if (c.indexOf(name) == 0) {
					return c.substring(name.length, c.length);
				}
			}
			return "";
		}
	</script>
<body>
	<div class = "container panel panel-info" id="notice">
		<h3 class = "panel-heading">공지사항</h3>
		<div>
			이 포트폴리오는 상업적 목적이 아닌 <strong>개인 포트폴리오</strong> 용도로 제작되었으며,
			홈페이지의 일부내용과 기타 이미지 등은 그 출처가 따로 있음을 밝힙니다. 
		</div>
		<div>
			<img alt="" src="QRCodeImg.jpg">
		</div>
		<div>
			<input type="checkbox" id="subpop" name="subpop" />
			<label for="subpop">오늘 하루 동안 이창 열지 않음</label>
			<input type="button" value="닫기" class="btn btndefault" id="close"/>
		</div>
	</div>
	
	<script>
		$(function() {
			$('#close, #subpop').click(function() {
				if ($('#subpop:checked').length == 1) { setCookie('subpop', 'done', 1); }
				$('#notice').fadeOut();
			});
			
			if (getCookie('subpop') == 'done') { $('#notice').hide() }
			else { $('#notice').fadeIn(); }
		});
	</script>
</body>
</html>