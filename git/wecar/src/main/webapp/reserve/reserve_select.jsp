<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file = "../inc/header.jsp" %>

<style>
.panel {
	padding: 15px;
}
.wrap_option{
    margin-top: 10px;
    margin-bottom: 10px;
    justify-content: end;
}
.wrap_option > div:nth-child(1){
    margin: 3px;
    height: 30px;
    font-weight: bold;
    font-size: 15px;
    justify-content: center;
    align-items: center;
}
.wrap_option > div:nth-child(2){
    display: flex;
}
.option{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 30px;
    width: 100%;
    border: 1px solid;
    margin: 3px;
    position: relative;
}
.option_active{
    border-color: dodgerblue;
    color: dodgerblue;
}
.option_inactive{
    border-color: grey;
    color: grey;
}
</style>
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-10">
			<h3 class = "text-center">예약확인</h3>
			<div class = "row panel panel-default">
				<div class = "col-sm-4">
					<div class = "row form-group">
						<h4>예약</h4>
						<hr/>
						<div class = "form-group">
							<form action="#" method = "post" id = "Form">
								<fieldset>
									<label for = "rno">예약번호</label>
									<input class = "form-control" type = "text" id = "rno" name = "rno" value = "${map.rno}" readonly/>
								</fieldset>
							</form>
						</div>
						
						<div class = "form-group">
							<label for = "insu">보험</label>
							<input class = "form-control" type = "text" id = "insu" value = "${map.insuname}" readonly/>
						</div>
						
						<div class = "form-group">
							<label for = "rprice">금액</label>
							<input class = "form-control" type = "text" id = "rprice" value = "${map.rprice}" readonly/>
						</div>
					</div>
				
					<div class = "row form-group">
						<h4>운전자</h4>
						<hr/>
						<div class = "form-group">
							<label for = "name">운전자</label>
							<input class = "form-control" type = "text" id = "name" value = "${map.name}" readonly/>
						</div>
						
						<div class = "form-group">
							<label for = "birth">생년월일</label>
							<input class = "form-control" type = "text" id = "birth"  value = "${map.birth}" readonly/>
						</div>
						
						<div class = "form-group">
							<label for = "phone">휴대전화</label>
							<input class = "form-control" type = "text" id = "phone" value = "${map.phone}" readonly/>
						</div>
						
						<div class = "form-group">
							<label for = "email">이메일</label>
							<input class = "form-control" type = "text" id = "email" value = "${map.email}" readonly/>
						</div>
					</div>
				</div>
				
				<div class = "col-sm-3"></div>
				
				<div class = "col-sm-5">
					<div class = "row form-group">
						<h4>차량</h4>
						<hr/>
						<div class = "form-group">
							<label for = "cno">차량번호</label>
							<input class = "form-control" type = "text" id = "cno" value = "${map.cno}" readonly/>
						</div>
						<div class = "form-group">
							<label for = "model">모델</label>
							<input class = "form-control" type = "text" id = "model" value = "${map.model}" readonly/>
						</div>
						<div class = "form-group">
							<label for = "type">차종</label>
							<input class = "form-control" type = "text" id = "type" value = "${map.tname}" readonly/>
						</div>
						<div class = "form-group">
							<label for = "brand">제조사</label>
							<input class = "form-control" type = "text" id = "brand" value = "${map.brname}" readonly/>
						</div>
						<div class = "form-group">
							<label for = "fuel">연료</label>
							<input class = "form-control" type = "text" id = "fuel" value = "${map.fname}" readonly/>
						</div>
						<div class = "form-group">
							<label for = "vehicle_year">연식</label>
							<input class = "form-control" type = "text" id = "vehicle_year" value = "${map.vehicle_year}" readonly/>
						</div>
						<div class = "form-group">
							<label for = "personnel">정원</label>
							<input class = "form-control" type = "text" id = "personnel" value = "${map.personnel}" readonly/>
						</div>
	                    <div class="wrap_option">
	                        <div> 옵션 </div>
	                        <div>
	                            <!-- 금연, 네비, 스마트키, 후방카메라,블루투스  -->               
	                            <span class="option <c:if test = "${map.smoking == 1}">option_active</c:if>">금연</span>
	                            <span class="option <c:if test = "${map.navigation == 1}">option_active</c:if>">네비</span>
	                            <span class="option <c:if test = "${map.smart == 1}">option_active</c:if>">스마트키</span>
	                            <span class="option <c:if test = "${map.rear == 1}">option_active</c:if>">후방카메라</span>
	                            <span class="option <c:if test = "${map.bluetooth == 1}">option_active</c:if>">블루투스</span>
	                        </div>             
                    	</div>         
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-10">
			<div class = "row panel panel-default">
				<h4>인수/반납</h4>
				<hr/>
				<div class = "col-sm-7">					
					<div id="map" style="width:100%; height:400px; margin-bottom: 15px;">
			
						<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ebe74705f55a124a8d38b794147e176"></script>
						<script>
							var mapContainer = document.getElementById('map'),
							   mapOption = { 
							       center: new kakao.maps.LatLng(${map.lat},${map.log}),	// 지도 중심 좌표
							       level: 4	// 지도 확대 레벨
							   };
							
							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
							
							var markerPosition  = new kakao.maps.LatLng(${map.lat},${map.log}); // 마커위치
							
							var marker = new kakao.maps.Marker({ position: markerPosition }); // 마커 생성
							
							marker.setMap(map); // 마커 표시
						</script>
					</div>
				</div>
				
				<div class = "col-sm-5">
					<div class = "form-group">
						<label for = "lno">인수/반납 장소</label>
						<input class = "form-control" type = "text" id = "lno" value = "${map.lname} ${map.laddress} ${map.laddress_detail}" readonly/>
					</div>
					
					<div class = "form-group">
						<label for = "pdate">인수일</label>
						<input class = "form-control" type = "text" id = "pdate" value = "${map.pdate}" readonly/>
					</div>
					<div class = "form-group">
						<label for = "rdate">반납일</label>
						<input class = "form-control" type = "text" id = "rdate" value = "${map.rdate}" readonly/>
					</div>
					<div class = "form-group">
						<label for = "state">상태</label>
						<input class = "form-control" type = "text" id = "state" 
						value = 
							<c:choose>
								<c:when test="${map.state == 0}">"예약"</c:when>
								<c:when test="${map.state == 1}">"인수"</c:when>
								<c:otherwise>"반납"</c:otherwise>
							</c:choose> readonly/>
					</div>
					<c:if test="${uno == 1}">
						<div class = "form-group">
							<label for = "rdate">예약일시</label>
							<input class = "form-control" type = "text" id = "rdate" value = "${map.date}" readonly/>
						</div>
						<div class = "form-group">
							<label for = "rdate">예약아이피</label>
							<input class = "form-control" type = "text" id = "rdate" value = "${map.rip}" readonly/>
						</div>
					</c:if>
				</div>
			</div>
			<c:choose>
				<c:when test="${uno == 1}">
					<c:if test="${map.state == 0}">
						<div class = "form-group">
							<a href = "update.reserve?rno=${map.rno}&state=1" class = "btn btn-primary form-control">인수</a>
						</div>
					</c:if>
					<c:if test="${map.state == 1}">
						<div class = "form-group">
							<a href = "update.reserve?rno=${map.rno}&state=2" class = "btn btn-warning form-control">반납</a>
						</div>
					</c:if>
				</c:when>
				
				<c:otherwise>
					<c:if test="${map.state == 2}">
						<div class = "form-group">
							<a href = "https://jh6194.cafe24.com/wecar_spring/review/writeView?rno=${map.rno}&cno=${map.cno}" class = "btn btn-info form-control">후기 작성</a>
						</div>					
					</c:if>
					
					<div class = "form-group">
						<a href = "main.we" class = "btn btn-primary form-control">확인</a>
					</div>
				</c:otherwise>
			</c:choose>
			
			<c:if test="${map.state == 0}">
				<div class = "form-group">
					<input class = "btn btn-danger form-control" type = "button" value = "취소" data-toggle="modal" data-target="#delete"/>
				</div>
			</c:if>
			<div class = "form-group">
				<a href = "list.reserve" class = "btn btn-default form-control">목록</a>
			</div>				
		</div>
		<div class = "col-sm-1"></div>
	</div>
	
	<!-- 모달 -->
	<!-- 모달 -->
	<div class="modal fade" id="delete" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">예약취소</h4>
				</div>
				
				<div class="modal-body">
					<p>정말 취소하시겠습니까?</p>
				</div>
				
				<div class="modal-footer">
					<input type="submit" class="btn btn-danger" value = "예" id = "modalDeleteBtn"/>
	       			<button type="button" class="btn btn-default" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			$("#modalDeleteBtn").on("click", function() {
				$("#Form").attr("action","delete.reserve?rno=${map.rno}")
				$("#Form").submit();
			});
		});
	</script>

<%@ include file = "../inc/footer.jsp" %>