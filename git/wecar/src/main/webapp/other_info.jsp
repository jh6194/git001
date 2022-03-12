<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "/inc/header.jsp" %>

	<div class = "row">
		<div class = "col-sm-2 text-center"></div>
		
		<div class = "col-sm-8">
		<br/>
		
		<!-- 탭 -->
		<!-- 탭 -->
		
		<div class = "container">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#menu1">실시간 교통정보</a></li>
				<li><a data-toggle="tab" href="#menu2">전국 날씨예보</a></li>
				<li><a data-toggle="tab" href="#menu3">전국 미세먼지농도</a></li>
				<li><a data-toggle="tab" href="#menu4">국내 코로나 현황</a></li>
			</ul>
			
			<!-- 교통정보 -->
			<!-- 교통정보 -->
			
			<div class="tab-content">
				<div id="menu1" class="tab-pane fade in active">
					<br>
					<div class = "container panel">
						<h4>실시간 교통정보</h4>
						<div class = "text-center">
							<br/>
							<a href = "http://www.utic.go.kr/etc/telMap.do?key=NXloPGzRdOTUMugNhpitQD6InVsk3JRF2FkTNTMQMB0gwoakUi17MC5oS1u6G" class = "btn btn-default">실시간 교통정보 바로가기</a>
							<br/>
							<br/>
							<p>제공처 : 경찰청 교통정보(UTIC)</p>
						</div>
						<br/>
					</div>
				</div>
			
			<!-- 날씨 -->
			<!-- 날씨 -->

				<div id="menu2" class="tab-pane fade">
					<br>
					<div class = "container panel">
						<h4>전국 날씨예보</h4>
						<p class = "weather well"><p>
						
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
						<br/>
					</div>
				</div>
		
			<!-- 미세먼지 -->
			<!-- 미세먼지 -->
			
				<div id="menu3" class="tab-pane fade">
					<br>
					<div class = "container panel">
						<h4>전국 미세먼지 농도</h4>
						<table class = "table table-striped me">
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
						<br/>
					</div>
				</div>
		
		<!-- 코로나 -->
		<!-- 코로나 -->
		
				<div id="menu4" class="tab-pane fade">
					<br>
					<div class = "container panel c19">
						<h4>국내 코로나 현황</h4>
						<table class = "table table-striped">
							<thead><tr><th scope = "col">기준일</th><th scope = "col">확진자 수</th><th scope = "col">사망자수</th></tr></thead>
							<tbody></tbody>
						</table>
						<br/>
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
					</div>
				</div>
			</div>
		</div>
		
		<div class = "col-sm-2"></div>
	</div>

<%@ include file = "/inc/footer.jsp" %>