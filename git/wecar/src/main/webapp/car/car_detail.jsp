<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp"%>

	<div class = "row">
		<div class = "row">
			<div class = "col-sm-1"></div>
			<div class = "col-sm-11 form-group">
				<h3>차량정보</h3>
			</div>
		</div>
		
		<form action="#" method = "post" id = "detailForm" enctype="multipart/form-data">
		<fieldset>
		<div class = "row">
			<div class = "col-sm-1"></div>
			<div class = "col-sm-5 form-group panel panel-default">
				<div class = "form-group">
					<h4>차량사진</h4>
					<img style = "width:750px; height:340px;" alt="${list[0].cimg}" src="${pageContext.request.contextPath}/car/upload/${list[0].cimg}"/>
				</div>
				
				<div class = "form-group">
					<input class = "form-control" type = "file" id = "cimg" name = "cimg"/>
					<input class = "form-control" type = "text" value = "${list[0].cimg}" readonly/>
				</div>
				
				<div class = "form-group">
					<h4>인수/반납장소</h4>
					<span> ${list[0].laddress} ${list[0].laddress_detail} (${list[0].lname}점)</span>
				</div>
				
				<div id="map" style="width:100%; height:300px; margin-bottom: 15px;">
				
					<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ebe74705f55a124a8d38b794147e176"></script>
					<script>
						var mapContainer = document.getElementById('map'),
						   mapOption = { 
						       center: new kakao.maps.LatLng(${list[0].lat},${list[0].log}),	// 지도 중심좌표
						       level: 4	// 지도 확대 레벨
						   };
						
						var map = new kakao.maps.Map(mapContainer, mapOption);	// 지도 생성
						
						var markerPosition  = new kakao.maps.LatLng(${list[0].lat},${list[0].log});	// 마커 위치						
						var marker = new kakao.maps.Marker({ position: markerPosition });	// 마커 생성	
						marker.setMap(map);	// 마커 표시
					</script>
				</div>
			</div>
				
			<div class = "col-sm-5 form-group panel panel-default">
				<h4>차량정보</h4>
				<div class = "form-group">
					<label for = "cno">차량번호</label>
					<input class = "form-control" type = "text" id = "cno" name = "cno" value = "${list[0].cno}" readonly/>
				</div>
					
				<div class = "form-group">
					<label for = "brand">제조사 : </label>
					<select name = "brand" id = "brand">
						<option value = "0">선택없음</option>
						<option value = "1" <c:if test="${list[0].brand == 1}">selected</c:if>>현대</option>
						<option value = "2" <c:if test="${list[0].brand == 2}">selected</c:if>>기아</option>
						<option value = "3" <c:if test="${list[0].brand == 3}">selected</c:if>>르노삼성</option>
						<option value = "4" <c:if test="${list[0].brand == 4}">selected</c:if>>쌍용</option>
						<option value = "5" <c:if test="${list[0].brand == 5}">selected</c:if>>쉐보레</option>
						<option value = "6" <c:if test="${list[0].brand == 6}">selected</c:if>>제네시스</option>
					</select>
				</div>
				
				<div class = "form-group">
					<label for = "model">모델</label>
					<input class = "form-control" type = "text" id = "model" name = "model" placeholder="K5" value = "${list[0].model}"/>
				</div>
				
				<div class = "form-group">
					<label for = "type">차종 : </label>
					<select name = "type" id = "type">
						<option value = "0">선택없음</option>
						<option value = "1" <c:if test="${list[0].type == 1}">selected</c:if>>경형</option>
						<option value = "2" <c:if test="${list[0].type == 2}">selected</c:if>>소형</option>
						<option value = "3" <c:if test="${list[0].type == 3}">selected</c:if>>준중형</option>
						<option value = "4" <c:if test="${list[0].type == 4}">selected</c:if>>중형</option>
						<option value = "5" <c:if test="${list[0].type == 5}">selected</c:if>>고급</option>
						<option value = "6" <c:if test="${list[0].type == 6}">selected</c:if>>RV/SUV</option>
					</select>
				</div>
				
				<div class = "form-group">
					<label for = "personnel">정원 : </label>
					<select name = "personnel" id = "personnel">
						<option value = "0">선택없음</option>
						<option value = "2" <c:if test="${list[0].personnel == 2}">selected</c:if>>2</option>
						<option value = "4" <c:if test="${list[0].personnel == 4}">selected</c:if>>4</option>
						<option value = "5" <c:if test="${list[0].personnel == 5}">selected</c:if>>5</option>
						<option value = "7" <c:if test="${list[0].personnel == 7}">selected</c:if>>7</option>
						<option value = "9" <c:if test="${list[0].personnel == 9}">selected</c:if>>9</option>
						<option value = "11" <c:if test="${list[0].personnel == 11}">selected</c:if>>11</option>
						<option value = "12" <c:if test="${list[0].personnel == 12}">selected</c:if>>12</option>
					</select>
				</div>
				
				<div class = "form-group">
					<label for = "vehicle_year">연식 : </label>
					<select name = "vehicle_year" id = "vehicle_year">
						<option value = "0">선택없음</option>
						<option value = "2022" <c:if test="${list[0].vehicle_year == '2022'}">selected</c:if>>2022</option>
						<option value = "2021" <c:if test="${list[0].vehicle_year == '2021'}">selected</c:if>>2021</option>
						<option value = "2020" <c:if test="${list[0].vehicle_year == '2020'}">selected</c:if>>2020</option>
						<option value = "2019" <c:if test="${list[0].vehicle_year == '2019'}">selected</c:if>>2019</option>
						<option value = "2018" <c:if test="${list[0].vehicle_year == '2018'}">selected</c:if>>2018</option>
						<option value = "2017" <c:if test="${list[0].vehicle_year == '2017'}">selected</c:if>>2017</option>
						<option value = "2016" <c:if test="${list[0].vehicle_year == '2016'}">selected</c:if>>2016</option>
					</select>
				</div>
				
				<div class = "form-group">
					<label for = "fuel">연료 : </label>
					<select name = "fuel" id = "fuel">
						<option value = "0">선택없음</option>
						<option value = "G" <c:if test="${list[0].fuel == 'G'}">selected</c:if>>휘발유</option>
						<option value = "D" <c:if test="${list[0].fuel == 'D'}">selected</c:if>>경유</option>
						<option value = "L" <c:if test="${list[0].fuel == 'L'}">selected</c:if>>LPG</option>
						<option value = "E" <c:if test="${list[0].fuel == 'E'}">selected</c:if>>전기</option>
						<option value = "H" <c:if test="${list[0].fuel == 'H'}">selected</c:if>>하이브리드</option>
					</select>
				</div>
				
				<div class = "form-group">
					<label>옵션 : </label>
					<label>금연 <input type = "checkbox" name = "option" value = "1" <c:if test="${dto.smoking}">checked</c:if>/></label>
					<label>네비게이션 <input type = "checkbox" name = "option" value = "2" <c:if test="${dto.navigation}">checked</c:if>/></label>
					<label>스마트키 <input type = "checkbox" name = "option" value = "3" <c:if test="${dto.smart}">checked</c:if>/></label>
					<label>후방카메라 <input type = "checkbox" name = "option" value = "4" <c:if test="${dto.rear}">checked</c:if>/></label>
					<label>블루투스 <input type = "checkbox" name = "option" value = "5" <c:if test="${dto.bluetooth}">checked</c:if>/></label>
				</div>
				
				<div class = "form-group">
					<label for = "lno">위치 : </label>
					<select name = "lno" id = "lno">
						<option value = "0">선택없음</option>
						<option value = "02" <c:if test="${list[0].lno == 02}">selected</c:if>>서울</option>
						<option value = "031" <c:if test="${list[0].lno == 031}">selected</c:if>>파주</option>
						<option value = "032" <c:if test="${list[0].lno == 032}">selected</c:if>>인천</option>
					</select>
				</div>
				
				<div class = "form-group">
					<label for = "cprice">금액</label>
					<input class = "form-control" type = "text" id = "cprice" name = "cprice" placeholder="130000" value = "${list[0].cprice}"/>
				</div>
				
				<div>
					<strong>등록일 : ${list[0].cdate}</strong>
				</div>
				
				<div class = "form-group">
					<strong>등록아이피 : ${list[0].cip}</strong>
				</div>
				
				<div style = "margin-top:224px;" class = "form-group text-right">
					<input class = "btn btn-primary" type = "button" value = "수정" data-toggle="modal" data-target="#update" id = "updateBtn"/>
					<input class = "btn btn-danger" type = "button" value = "삭제" data-toggle="modal" data-target="#delete"/>
					<a href = "list.car" class = "btn btn-default">목록</a>
				</div>
			</div>
			<div class = "col-sm-1"></div>
		</div>
		</fieldset>
		</form>
		
		<c:if test="${!empty review}">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h3>이용후기</h3>
				<c:forEach items="${review}" var="review">
					<div style="padding:30px; height: 400px;" class="col-sm-6 panel panel-default">
						<p style="font-size: 18px; font-weight: 500;}">${review.sname}님</p>
						<div>
							<c:forEach begin="1" end="5" step="1" varStatus="st">
								<span <c:if test="${st.count <= review.star}">style="color:royalblue;"</c:if>>★</span>
							</c:forEach>
							<span style="font-size:15px; margin-left:10px; color:royalblue;"> ${review.star}.0 / 5.0</span>
							<span style="margin-left: 70%"><a class="btn btn-danger" href="https://jh6194.cafe24.com/wecar_spring/review/delete?sno=${review.sno}&cno=${list[0].cno}">삭제</a></span>
						</div>
						<hr/>
						<c:if test="${review.sfile != '####'}">
							<img style="max-width: 300px;" src="https://jh6194.cafe24.com/wecar_spring/resources/upload/${review.sfile}" alt="${review.sfile}"/>
						</c:if>
						<pre>${review.scontent}</pre>
						<p>작성일 : ${review.sdate}</p>
						<p>작성아이피 : ${review.sip}</p>
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-1"></div>
		</div>
		</c:if>
	</div>
	
	<!-- 모달 -->	
	<!-- 모달 -->	

		<div class="modal fade" id="update" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">차량수정</h4>
					</div>
					
					<div class="modal-body">
						<p>정말 수정하시겠습니까?</p>
					</div>
					
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value = "수정" id = "modalUpdateBtn"/>
		       			<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	
		<div class="modal fade" id="delete" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">차량삭제</h4>
					</div>
					
					<div class="modal-body">
						<p>정말 삭제하시겠습니까?</p>
					</div>
					
					<div class="modal-footer">
						<input type="submit" class="btn btn-danger" value = "삭제" id = "modalDeleteBtn"/>
		       			<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	
	<script>
		$(function() {
			$("#updateBtn").on("click", function() {
				if ($("#brand option:selected").val() == 0) {
					alert('제조사를 선택해주세요.');
					$("#brand").focus();
					return false;
				} else if ($("#model").val() == "") {
					alert('모델을 입력해주세요.');
					$("#model").focus();
					return false;
				} else if ($("#type option:selected").val() == 0) {
					alert('차종을 선택해주세요.');
					$("#type").focus();
					return false;
				} else if ($("#personnel option:selected").val() == 0) {
					alert('정원을 선택해주세요.');
					$("#personnel").focus();
					return false;
				} else if ($("#vehicle_year option:selected").val() == 0) {
					alert('연식을 선택해주세요.');
					$("#vehicle_year").focus();
					return false;
				} else if ($("#fuel option:selected").val() == 0) {
					alert('연료를 선택해주세요.');
					$("#fuel").focus();
					return false;
				} else if ($("#lno option:selected").val() == 0) {
					alert('위치를 선택해주세요.');
					$("#lno").focus();
					return false;
				}
			});
			
			$("#modalUpdateBtn").on("click", function() {
				$("#detailForm").attr("action","edit.car")
				$("#detailForm").submit();
			});

			$("#modalDeleteBtn").on("click", function() {
				$("#detailForm").attr("action","delete.car?cno=${list[0].cno}")
				$("#detailForm").submit();
			});
		});
	</script>

<%@ include file = "../inc/footer.jsp"%>