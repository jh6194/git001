<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "/inc/header.jsp" %>

	<div class = "row">
		<div class = "row">
			<div class = "col-sm-2"></div>
			
			<div class = "col-sm-8">
				<br/>
				<h3>자주 찾는 질문</h3>
				<br/>
			
				<!-- 아코디언 -->
				<!-- 아코디언 -->
					
				<div class="container">
					<div class="panel-group" id="accordion">
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#questions1">예약하려면 회원가입이 필요한가요?</a>
								</h4>
							</div>
						
							<div id="questions1" class="panel-collapse collapse in">
								<div class="panel-body">
									<p>렌트카 예약은 회원가입을 하지 않아도 비회원 예약이 가능합니다!</p>
									<p>다만 쿠폰 및 프로모션 코드는 회원가입 및 로그인 후 사용 가능합니다.</p>
								</div>
							</div>
						</div>
				   	 	
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#questions2">예약자와 운전자가 동일해야 하나요?</a>
								</h4>
							</div>
				
							<div id="questions2" class="panel-collapse collapse">
								<div class="panel-body">
									<p>위카는 예약자와 운전자를 구분하여 기재할 수 있습니다.</p>
									<p>단, 대여 및 자차가입 규정에 적합한 운전자만 렌터카 대여가 가능하므로 실 운전자 정보를 기재해주시기 바랍니다.</p>
								</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#questions3">예약한 차량과 다른 차량이 배차되는 경우도 있나요?</a>
								</h4>
							</div>
						
							<div id="questions3" class="panel-collapse collapse">
								<div class="panel-body">
									<p>예약한 차량의 갑작스러운 고장, 사고로 인해 대여가 불가한 경우 동일 차종 또는 다른 차량으로 변경될 수 있으며, 이 때에는 고객센터에서 사전에 별도 안내를 드립니다.</p>
								</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#questions4">차량을 반납했는데 귀중품이 차 안에 있어요.</a>
								</h4>
							</div>
						
							<div id="questions4" class="panel-collapse collapse">
								<div class="panel-body">
									<p>반납하신 차량 안에 있는 귀중품에 대한 분실물 문의는 고객센터로 접수 시 확인이 가능합니다.</p>
									<p>위카 고객센터(☎ 02-2222-2222)</p>
								</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#questions5">예약 취소 수수료는 어떻게 되나요?</a>
								</h4>
							</div>
						
							<div id="questions5" class="panel-collapse collapse">
								<div class="panel-body">
									<p>[예약취소 규정]</p>
									<p>* 결제당일(23시 59분 전), 인수 168시간 이상(7일 전) : 수수료 없음</p>
									<p>* 인수 168시간 미만 ~ 72시간 이상 : 수수료 10%</p>
									<p>* 인수 72시간 미만 ~ 24시간 이상 : 수수료 30%</p>
									<p>* 인수 24시간 미만 : 수수료 50%</p>
									<p>* No Show : 환불 불가</p>
									<p>* No-Show : 인수시작 시간 2시간이 경과하여 렌터카사로 별도 의사를 밝히지 않고, 무단으로 차량인수가 되지 않은 경우</p>
									<p>* 차량 인수 24시간 이내 취소하는 경우, 예약 당일 취소 구간(수수료 없음)이 적용되지 않습니다.</p>
									<p>* 취소 시점은 인수 시작 시간으로부터 남은 시간을 기준으로 합니다.</p>
								</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#questions6">취소한 결제 금액은 언제 확인 가능한가요?</a>
								</h4>
							</div>
						
							<div id="questions6" class="panel-collapse collapse">
								<div class="panel-body">
									<p>결제 취소 접수 후 카드사 사정에 따라 영업일 기준 7일 이내로 확인 가능합니다.</p>
									<p>이후에도 확인이 안될 경우 위카 고객센터(☎ 02-2222-2222)로 문의 부탁드립니다.</p>
								</div>
							</div>
						</div>
		
					</div> 
				</div>
			</div>
			
			<div class = "col-sm-2 text-center">
				<br/>
				<br/>
				<a href = "otherInfo.we"><img alt="" src="${pageContext.request.contextPath}/img/otherInfo.png"></a>
				<br/>
				<span>기타정보</span>
			</div>
		</div>
		
		<div class = "row">
			<div class = "col-sm-2"></div>
			
			<div class = "col-sm-8">
				<h3>고객센터 위치</h3>
				<span>문의 (☎ 02-2222-2222)</span> <a href = "#">1:1문의</a>
				<br/>
				<br/>
				<!-- 지도 -->
				<!-- 지도 -->
				
				<div id="map" style="width:40%; height:300px;">
				
					<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ebe74705f55a124a8d38b794147e176"></script>
					<script>
						var mapContainer = document.getElementById('map'),
						   mapOption = { 
						       center: new kakao.maps.LatLng(37.656661,126.7647865),	// 지도 중심좌표
						       level: 7	// 지도 확대 레벨
						   };
						
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
						
						var markerPosition  = new kakao.maps.LatLng(37.656661,126.7647865); // 마커 위치
						
						var marker = new kakao.maps.Marker({ position: markerPosition });	// 마커 생성
						
						marker.setMap(map);	// 마커 표시
					</script>
				</div>

			</div>
			
			<div class = "col-sm-2"></div>
		</div>
	</div>

<%@ include file = "/inc/footer.jsp" %>