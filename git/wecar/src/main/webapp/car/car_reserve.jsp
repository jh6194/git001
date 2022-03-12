<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp" %>

<style>
.panel {
	padding:15px;
}
th {
	background-color:#e9f0f2;
	color:gray;
}
</style>

	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-10">
			<div class = "row">
				<h3>고객정보</h3>
				<div class = "row panel panel-default">
					<div class = "col-sm-4">
						<div class = "form-group">
							<label for = "name">운전자</label>
							<input class = "form-control" type = "text" id = "name" value = "${userinfo.name}" readonly/>
						</div>
						
						<div class = "form-group">
							<label for = "birth">생년월일</label>
							<input class = "form-control" type = "text" id = "birth" value = "${userinfo.birth}" readonly/>
						</div>
						
						<div class = "form-group">
							<label for = "phone">휴대전화</label>
							<input class = "form-control" type = "text" id = "phone" value = "${userinfo.phone}" readonly/>
						</div>
						
						<div class = "form-group">
							<label for = "email">이메일</label>
							<input class = "form-control" type = "text" id = "email" value = "${userinfo.email}" readonly/>
						</div>
					</div>

					<div style = "padding-left:60px; padding-top:10px;" class = "col-sm-8">
						<h4 style = "color:red; font-weight:900;">꼭 확인해주세요!</h4>
						<p style = "font-weight:600;">* 렌터카 예약시 유의사항</p>
						<ol style = "padding-left:15px;" type="1">
							<li><span>고객 정보는 렌터카 이용 시 긴급사항 발생에 대비하여 즉시 연락이 가능한 정보를 입력하셔야 합니다.</span></li>
							<li><span>잘못된 정보 또는 수신이 불가한 정보 입력으로 연락이 불가능할 경우 발생되는 불이익에 대해 당사는 책임지지 않으니 유의해 주시기 바랍니다.</span></li>
							<li><span>고객 정보는 마이페이지에서 수정 가능합니다.</span></li>
							<li><span>운전자 추가 등록은 차량 대여 시 현장에서 신청 가능합니다.</span></li>
							<li><span>결제 전 대여규정 및 약관동의를 반드시 확인 후 진행 바랍니다. 미확인으로 인한 불이익에 대해 당사는 책임지지 않으니 유의해주시기 바랍니다.</span></li>
							<li><span>면허증 미지침시 인수 거절 될 수 있으므로 유의해주시기 바랍니다.</span></li>
						</ol>
					</div>
				</div>
			</div>
		
			<div class = "row">
				<h3>결제정보</h3>
				<div class = "row panel panel-default">
					<table class = "table table-bordered panel">
						<tbody>
							<tr><th scope = "row">금액</th><td>${strprice}</td></tr>
							<tr><th scope = "row">간편결제</th>
								<td>
									<label style = "margin-left:10px;"><input type = "radio" name = "payment" value = ""/><img alt="SamsungPay" src="${pageContext.request.contextPath}/inc/SamsungPay.png"></label>
									<label><input type = "radio" name = "payment" value = ""/><img style = "border-radius:25px; height:35px; margin-left:15px; margin-right: 15px;" alt="SamsungPay" src="${pageContext.request.contextPath}/inc/KakaoPay.png"></label>
									<label><input type = "radio" name = "payment" value = ""/><img alt="SamsungPay" src="${pageContext.request.contextPath}/inc/Payco.png"></label>
									<label><input type = "radio" name = "payment" value = ""/><img style = "margin-left:15px; margin-right:15px;" alt="SamsungPay" src="${pageContext.request.contextPath}/inc/Lpay.png"></label>
									<label><input type = "radio" name = "payment" value = ""/><img style = "height:30px; margin-left:15px;" alt="SamsungPay" src="${pageContext.request.contextPath}/inc/NaverPay.png"></label>
								</td>
							</tr>
							<tr><th scope = "row">일반결제</th>
								<td>
									<label style = "margin-left:10px;"><input type = "radio" name = "payment" value = ""/>  신용카드/체크카드</label>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class = "row">
				<div class = "col-sm-11">
					<div class = "form-group">
						<span style = "font-weight:700;">(필독) 대여 규정 및 약관 동의  </span>
					</div>
					
					<div class = "form-group">
						<span style = "font-weight:700;">결제진행약관 </span>
					</div>
				</div>
				
				<div class = "col-sm-1">
					<p><a href = "#">보기</a></p>
					<p><a href = "#">보기</a></p>
				</div>
			</div>
			
			<div class = "row text-center">
				<div class = "form-group">
					<input type = "checkbox" id = "check" name = "check"/>
					<label for = "check">위 결제/대여 규정을 모두 확인하였으며, 회원 본인은 결제에 동의합니다.</label>
				</div>
				
				<form action="reserveDo.car" method = "post" id = "form">
					<fieldset>
						<div class = "form-group">
							<input style = "width:20%; height:40px; font-size:16px;" class = "btn btn-primary" type = "submit" value = "결제하기"/>
						</div>
						<input type = "hidden" name = "uno" value = "${userinfo.uno}"/>
						<input type = "hidden" name = "cno" value = "${cno}"/>
						<input type = "hidden" name = "rprice" value = "${price}"/>
						<input type = "hidden" name = "insu" value = "${insu}"/>
						<input type = "hidden" name = "pdate" value = "${pdate}"/>
						<input type = "hidden" name = "rdate" value = "${rdate}"/>
					</fieldset>
				</form>
			</div>
		</div>
		<div class = "col-sm-1"></div>
	</div>
	
	<script>
		$(function() {
			$("#form").on("submit", function() {
				if ($("input:radio[name='payment']:checked").length == 0) {
					alert('결제방법을 선택해주세요.');
					return false;
				} else if (!$("#check").is(":checked")) {
					alert('결제/대여 규정에 동의하지 않았습니다.');
					return false;
				}
			});
		});
	</script>

<%@ include file = "../inc/footer.jsp" %>