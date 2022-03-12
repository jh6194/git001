<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp"%>

	<div class = "row">
		<div class = "row">
			<div class = "col-sm-1"></div>
			<div class = "col-sm-11 form-group">
				<h3>차량등록</h3>
			</div>
		</div>
		
		<form action="insertDo.car" method="post" enctype="multipart/form-data" id = "insertForm">
		<fieldset>
		<div class = "row">
			<div class = "col-sm-1"></div>
			<div class = "col-sm-10 container panel panel-default">
				<div class = "row">
					<div>
						<h4>차량정보</h4>
						<div class = "form-group">
							<label for = "cno">차량번호</label>
							<input class = "form-control" type = "text" id = "cno" name = "cno" placeholder="123허1234" maxlength="8"/>
						</div>
						
						<div class = "form -group">
							<label for = "brand">제조사 : </label>
							<select name = "brand" id = "brand">
								<option value = "0">선택없음</option>
								<option value = "1">현대</option>
								<option value = "2">기아</option>
								<option value = "3">르노삼성</option>
								<option value = "4">쌍용</option>
								<option value = "5">쉐보레</option>
								<option value = "6">제네시스</option>
							</select>
						</div>
						
						<div class = "form-group">
							<label for = "model">모델</label>
							<input class = "form-control" type = "text" id = "model" name = "model" placeholder="K5"/>
						</div>
						
						<div class = "form -group">
							<label for = "type">차종 : </label>
							<select name = "type" id = "type">
								<option value = "0">선택없음</option>
								<option value = "1">경형</option>
								<option value = "2">소형</option>
								<option value = "3">준중형</option>
								<option value = "4">중형</option>
								<option value = "5">고급</option>
								<option value = "6">RV/SUV</option>
							</select>
						</div>
						
						<div class = "form -group">
							<label for = "personnel">정원 : </label>
							<select name = "personnel" id = "personnel">
								<option value = "0">선택없음</option>
								<option value = "2">2</option>
								<option value = "4">4</option>
								<option value = "5">5</option>
								<option value = "7">7</option>
								<option value = "9">9</option>
								<option value = "11">11</option>
								<option value = "12">12</option>
							</select>
						</div>
						
						<div class = "form -group">
							<label for = "vehicle_year">연식 : </label>
							<select name = "vehicle_year" id = "vehicle_year">
								<option value = "0">선택없음</option>
								<option value = "2022">2022</option>
								<option value = "2021">2021</option>
								<option value = "2020">2020</option>
								<option value = "2019">2019</option>
								<option value = "2018">2018</option>
							</select>
						</div>
						
						<div class = "form -group">
							<label for = "fuel">연료 : </label>
							<select name = "fuel" id = "fuel">
								<option value = "0">선택없음</option>
								<option value = "G">휘발유</option>
								<option value = "D">경유</option>
								<option value = "L">LPG</option>
								<option value = "E">전기</option>
								<option value = "H">하이브리드</option>
							</select>
						</div>
						
						<div class = "form -group">
							<label>옵션 : </label>
							<label>금연 <input type = "checkbox" name = "option" value = "1"/></label>
							<label>네비게이션 <input type = "checkbox" name = "option" value = "2"/></label>
							<label>스마트키 <input type = "checkbox" name = "option" value = "3"/></label>
							<label>후방카메라 <input type = "checkbox" name = "option" value = "4"/></label>
							<label>블루투스 <input type = "checkbox" name = "option" value = "5"/></label>
						</div>
						
						<div class = "form -group">
							<label for = "lno">위치 : </label>
							<select name = "lno" id = "lno">
								<option value = "0">선택없음</option>
								<option value = "02">서울</option>
								<option value = "032">인천</option>
								<option value = "031">파주</option>
							</select>
						</div>
						
						<div class = "form-group">
							<label for = "cprice">금액</label>
							<input class = "form-control" type = "text" id = "cprice" name = "cprice" placeholder = "130000"/>
						</div>
						
						<div class = "form-group">
							<label for = "cimg">이미지</label>
							<input class = "form-control" type = "file" id = "cimg" name = "cimg"/>
						</div>
					</div>	
					
					<div class = "form-group text-right">
						<input class = "btn btn-primary" type = "submit" value = "등록"/>
						<a href = "list.car" class = "btn btn-default">취소</a>
					</div>	
				</div>
			</div>
			<div class = "col-sm-1"></div>
		</div>
		</fieldset>
		</form>
	</div>
	
	<script>
		$(function() {
			$("#insertForm").on("submit", function() {
				if ($("#cno").val() == "") {
					alert('차량번호를 입력해주세요.');
					$("#cno").focus();
					return false;
				} else if ($("#brand option:selected").val() == 0) {
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
				} else if ($("#cpirce").val() == "") {
					alert('금액을 입력해주세요.');
					$("#cprice").focus();
					return false;
				} else if ($("#cimg").val() == "") {
					alert('이미지를 선택해주세요.');
					$("#cimg").focus();
					return false;
				}
			});
		});
	</script>

<%@ include file = "../inc/footer.jsp"%>