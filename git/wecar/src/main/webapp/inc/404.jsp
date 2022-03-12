<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page isErrorPage = "true"%>
<%response.setStatus(200);%>
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
	<div class = "container panel-warning">
		<h3 class = "panel-heading">404. 요청하신 페이지가 없습니다.</h3>
		<pre>
		ㅁ error 종류
		가. 1** 정보전달용 : 임시응답을 나타냄
			100 : 계속작업함
		나. 2** 성공 : 요청을 받아들임
			200 : 성공 ##
			201 : created, post 명령 실행 및 성공
		다. 3** 경로변경 : 클라이언트 브라우저는 요청을 처리하기위해 좀더 조치를 취해야 함
			300 : multiple choices , 최근에 변경된 데이터를 요청
			304 : not modified , 웹페이지에서 요청만하고 자신의 브라우저의 캐쉬를 수정이 안됨
		라. 4** 클라이언트 오류 : 오류발생하고 클라이언트에 문제가 있음
			400 : bad request 클라이언트의 잘못된 요청으로 처리불가능
			404 : not found , 파일 못찾음 ##
		마. 5** 서버오류 : servlet, jsp의 요청을 서버가 처리하지 못함
			500 : internal server error, 내부서버오류(잘못된 스크립트 실행시) ##
			502 : bad gateway , 서버의 과부하상태
		</pre>
		<%=exception.getMessage()%>
	</div>
</body>
</html>