<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp"%>

<style>
.insu_radio label {
	margin-right: 2%;
}
#reserve_btn {
	width: 32%;
    height: 40px;
    font-size: 16px;
    font-weight: 500;
}
.table>thead>tr.info>th {
	background-color: dodgerblue;
    color: white;
}
.panel {
	padding: 15px;
}
.star { color: royalblue; }
</style>

	<div class = "row">
		<div class = "col-sm-1"></div>
		
		<!-- 상세보기 -->
		<!-- 상세보기 -->
		<div class = "col-sm-10">
			<div class = "row">
				<h3>렌트카 상세보기</h3>
			</div>
			
			<div class = "row panel panel-default">
				<div class = "col-sm-5">
					<img style = "width:100%; margin-top:15px;" alt="${list[0].cimg}" src="${pageContext.request.contextPath}/car/upload/${list[0].cimg}"/>
				</div>
				
				<div class = "col-sm-7 form-group">
					<div class = "form-group">
						<h3> ${list[0].model} </h3>
					</div>
					
					<div class = "form-group">
						<strong>인수날짜 : ${pdate}</strong>	
					</div>
					
					<div class = "form-group">
						<strong>반납날짜 : ${rdate}</strong>	
					</div>
					
					<form action="reserveView.car" method = "post">
						<fieldset>
							<div class = "form-group insu_radio">
								<label>보험 : </label>
								<label><input type = "radio" name = "insu" value = "1" checked/> 일반자차<span>(+0)</span></label>
								<label><input type = "radio" name = "insu" value = "2"/> 완전자차<span>(+15,000)</span></label>
								<label><input type = "radio" name = "insu" value = "3"/> 무제한자차<span>(+30,000)</span></label>
							</div>
							
							<div class = "form-group text-right">
								<strong style = "font-size: 22px;" id = "price"></strong>				
								<p><input type = "submit" class = "btn btn-primary" value = "예약하기" id = "reserve_btn"/></p>
								<span>※상기 요금 규정 사항을 모두 확인하였으며, 회원 본인은 요금 규정에 동의합니다.</span>
							</div>
							
							<input type = "hidden" name = "pdate" value = "${pdate}"/>					
							<input type = "hidden" name = "rdate" value = "${rdate}"/>					
							<input type = "hidden" id = "strPrice" name = "strPrice"/>					
							<input type = "hidden" id = "totalPrice" name = "totalPrice"/>					
							<input type = "hidden" name = "cno" value = "${list[0].cno}"/>	
						</fieldset>
					</form>
				</div>
			</div>
			
			<script>
				//첫화면 가격
				setPrice();
				
				//선택시 가격
				$("input:radio[name='insu']").on("click", function() {
					setPrice();
				});
				//가격 변경 함수
				function setPrice() {
					var insu = $("input:radio[name='insu']:checked").val();
					$.ajax ({
						url:"${pageContext.request.contextPath}/price.car"
						,type:"post"
						,dataType:"json"
						,data:{"insu":insu, "cprice":${list[0].cprice}}
						,success: function(data) {
							$("#price").html();
							$("#price").text("총금액 : "+data.result);
							$("#strPrice").val(data.result);	// String
							$("#totalPrice").val(data.price);	// Int
						},error: function(xhr,text,Status,errorThrown) {
							$("#price").html(textStauts + "(HTTP-"+xht.status+"/"+errorThreown);
						}
					});
				}
			</script>
			
			<!-- 보상/면제범위 -->
			<!-- 보상/면제범위 -->
			<div class = "row">	
				<h4>보상/면제 범위</h4>
				<div class = "col-sm-12">
					<table class="table table-bordered panel">
						<thead>
							<tr class = "info"><th scope = "col">보상내용</th><th scope = "col">일반자차</th><th scope = "col">완전자차</th><th scope = "col">무제한자차</th></tr>
						</thead>
						
						<tbody>
							<tr><td><span>면책금</span></td><td><span>수리비의 약 20%~</span></td><td><span style="color:royalblue;">면제</span></td><td><span style="color:royalblue;">면제</span></td></tr>
							<tr><td><span>보상한도</span></td><td><span>200~500만</span></td><td><span>200~500만</span></td><td><span style="color:royalblue;">무제한</span></td></tr>
							<tr><td><span>휴차보상료</span></td><td><span style="color:red;">보징블가</span></td><td><span>일부가능</span></td><td><span style="color:royalblue;">면제</span></td></tr>
							<tr><td><span>단독사고</span></td><td><span style="color:red;">보징블가</span></td><td><span>일부가능</span></td><td><span style="color:red;">보장불가</span></td></tr>
							<tr><td><span>휠/타이어</span></td><td><span style="color:red;">보징블가</span></td><td><span style="color:red;">보징블가</span></td><td><span style="color:red;">보장불가</span></td></tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<!-- 취소 수수료 -->
			<!-- 취소 수수료 -->
			<div class = "row">
				<h4>취소 수수료</h4>
				<div class = "col-sm-12">
					<table class="table table-bordered panel">
						<thead>
							<tr class = "info"><th scope = "col">구분</th><th scope = "col">설명</th><th scope = "col">수수료</th></tr>
						</thead>
						
						<tbody>
							<tr><td><span>예약당일</span></td><td><span>- 예약 당일 취소는 당일 23:59분까지 기준</span><p><span>- 차량 인수 24시간 내 취소시, 예약 당일 취소 구간(수수료 없음) 적용 불가</span></p></td><td><span style="color:royalblue;">수수료 없음</span></td></tr>
							<tr><td><span>예약 다음날 ~ 인수 7일전까지</span></td><td><span>- 168시간 이전까지</span></td><td><span style="color:royalblue;">수수료 없음</span></td></tr>
							<tr><td><span>인수 6일전 ~ 인수 3일전까지</span></td><td><span>- 72시간 이전까지</span></td><td><span>수수료 10%</span></td></tr>
							<tr><td><span>인수 2일전 ~ 인수 1일전까지</span></td><td><span>- 24시간 이전까지</span></td><td><span>수수료 30%</span></td></tr>
							<tr><td><span>인수 24시간 이내</span></td><td></td><td><span>수수료 50%</span></td></tr>
							<tr><td><span>NoShow</span></td><td></td><td><span style = "color:red;">환불 불가</span></td></tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<!-- 인수/반납 장소 -->
			<!-- 인수/반납 장소 -->
			<div class = "row">
				<h4>인수/반납 장소</h4>
				<div class = "row">
					<div class = "col-sm-6">
						<div id="map" style="width:100%; height:400px; margin-bottom: 15px;">
				
							<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ebe74705f55a124a8d38b794147e176"></script>
							<script>
								var mapContainer = document.getElementById('map'),
								   mapOption = { 
								       center: new kakao.maps.LatLng(${list[0].lat},${list[0].log}),
								       level: 4
								   };
								
								var map = new kakao.maps.Map(mapContainer, mapOption); 
								
								var markerPosition  = new kakao.maps.LatLng(${list[0].lat},${list[0].log}); 
								
								var marker = new kakao.maps.Marker({
								    position: markerPosition
								});
								
								marker.setMap(map);
							</script>
						</div>
					</div>
					
					<div class = "col-sm-6 panel panel-default">
						<div class = "form-group">
							<strong>주소 : ${list[0].laddress} ${list[0].laddress_detail}</strong>
						</div>
			
						<div class = "form-group">
							<strong>담당지점 : ${list[0].lname}점</strong>
						</div>
			
						<div class = "form-group">
							<strong>고객센터 : ${list[0].lno}-2222-2222</strong>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 후기 -->
			<!-- 후기 -->
			<div class = "row form-group">
				<h4>이용 후기</h4>
				<div class = "col-sm-12">
					<c:if test="${empty review}">
						<div class = "panel panel-default text-center">
							<strong>등록된 후기가 없습니다.</strong>
						</div>
					</c:if>
					
					<div class="row">
						<c:if test="${!empty review}">
							<c:forEach items="${review}" var="review">
								<div style="padding:30px; height: 400px;" class="col-sm-6 panel panel-default">
									<p style="font-size: 18px; font-weight: 500;}">****님</p>
									<div>
										<c:forEach begin="1" end="5" step="1" varStatus="st">
											<span <c:if test="${st.count <= review.star}">style="color:royalblue;"</c:if>>★</span>
										</c:forEach>
										<span style="font-size:15px; margin-left:10px; color:royalblue;"> ${review.star}.0 / 5.0</span>
									</div>
									<hr/>
									<c:if test="${review.sfile != '####'}">
										<img style="max-width: 300px;" src="https://jh6194.cafe24.com/wecar_spring/resources/upload/${review.sfile}" alt="${review.sfile}"/>
									</c:if>
									<pre>${review.scontent}</pre>
									<p class="sdate">작성일 : ${review.sdate}</p>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			
		</div>
		<div class = "col-sm-1"></div>
	</div>

<%@ include file = "../inc/footer.jsp"%>