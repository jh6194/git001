<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	var result = "${result}";
	if(result == "실패"){ alert(result + "관리자에게 문의바랍니다."); }
	else if(result.length != 0) { alert(result); }
	
	if ('${user.id}' == 'jh6194') {
		location.href='https://jh6194.cafe24.com/wecar/detail.car?cno=${cno}';		
	} else {
		location.href='${pageContext.request.contextPath}/review/list?pstartno=0&uno=${user.uno}';			
	}
</script>