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
	<div class="container  panel panel-warning">
		<h3 class="panel-heading">NAVER-MAIL</h3>
			<form action="${pageContext.request.contextPath}/mail001_17.do" method="post"  >
				<table class="table  table-striped">
					<caption>관리자에게메일보내기</caption>
					<tbody>
					<tr>
					<th scope="row"><label for="subject">Title</label></th>
					<td><input type="text" name="subject" id="subject" size="40" class="form-control"></td>
					</tr>
					
					<tr>
					<th scope="row"><label for="content">Content</label></th>
					<td><textarea name="content" rows="10" cols="40"  class="form-control"   id="content" ></textarea></td>
					</tr>
					
					<tr>
					<td colspan="2"><input type="submit" value="Submit"  class="btn btn-warning"></td>
					</tr>
					</tbody>
				</table>	
			</form>
	</div>
<!-- 	 * java mail 보내기
		 * #1.  JavaMail 1.4.7
		 * 		jar파일다운로드
		 * 		https://mvnrepository.com/artifact/javax.mail/mail/1.4.7
		 * #2.  javax.mail api
		 * 		http://www.javadoc.io/doc/javax.mail/javax.mail-api/1.4.7	 -->
</body>
</html>
<!-- https://ckeditor.com/ckeditor-4/download/ -->