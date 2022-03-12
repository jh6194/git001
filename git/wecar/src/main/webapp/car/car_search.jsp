<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp"%>

<!-- color default #82CEFB -->
<!-- 가격 슬라이드 바 -->
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="jqueryui/style.css">

<style>
.sidebar {
    left: 100px;
    top: 120px;
  	margin-right: 10px;
    width: 300px;
    height: 461px;
    position: absolute;
    z-index: 1;
   	border-radius: 10px;
	box-shadow: 0 0 10px rgb(0 0 0 / 20%);
}

.wrap_content{
    width: 70%;
    height: 700px;
    margin-left: 300px;
    margin-top: 30px;
    margin-bottom: 15px;
    overflow-y: scroll;
}

.wrap_car{
    display: flex;
    padding: 20px;
    margin-top: 22px;
    background-color: #fff;
    width: 99%;
    position: relative;
   	border-radius: 10px;
	box-shadow: 0 0 10px rgb(0 0 0 / 20%);
}

.wrap_car > img{
    position: relative;
    width: 100%;
}

.wrap_main{
    display: flex;
    justify-content: center;
}

.car_name{
    font-size: 25px;
    color: #000;
}

.car_fuel{
    font-size: 16px;
    color: #000;
    margin-right: 15px;
}

.car_info{
    font-size: 16px;
}

.car_img{
    margin-top: 25px;
    max-width:350px;
    max-height:350px;
}

.wrap_car > .wrap_left{
    position: relative;
    width: 50%;
    height: 250px;
}

.wrap_car > .wrap_right{
    justify-content:end;
    position: relative;
    width: 65%;
    height: 250px;
    padding-right: 30px;

}

.wrap_reservation{
    display: flex;
    justify-content: end;
}

.btn_reservation{
    margin-left: 10px;
    background-color: #82CEFB;
    color: #fff;
}

.wrap_car .btn{
   font-size:16px;
    cursor: pointer;
    width: 25%;
    margin-top: 60px;
}

.wrap_option{
    margin-top: 10px;
    display: flex;
    height: 50px;
    justify-content: end;
}

.wrap_option > div:nth-child(1){
    margin: 3px;
    height: 30px;
    display: flex;
    font-weight: bold;
    font-size: 15px;
    color: grey;
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
    width: 100px;
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

.wrap_price > div:nth-child(1){
    color:#F15F5F;
    font-size: 20px;
    margin-right: 10px;
}

.wrap_price > div:nth-child(1) > span:nth-child(1){
    color:#000;
    font-size: 24px;
}

.text_cancel {
    text-decoration: line-through;
}

.wrap_review{
    flex-direction: column;
    height: auto;
    margin-left: 30px;

}

.wrap_review > span{
    position: relative;
    font-size: 15px;
    margin: 10px;
    font-weight: bold;
}

.wrap_review > span> span{
    position: relative;
    font-size: 15px;
    margin: 10px;
    font-weight: bold;
}

.flex_right{
    display: flex;
    justify-content: end;
}

.flex_center{
    display: flex;
    justify-content: center;
}

.sidebar_init{
    margin-top: 10px;
    margin-right: 10px;
    
}

.pointer{
    cursor: pointer;
}

.sidebar_init > span:nth-child(1){
    margin-right: 5px;
}
.sidebar_drop_down{
	border-top-style: solid;
    border-top-width: thin;
    border-bottom-width: thin;
    border-color: whitesmoke;
}
.sidebar_drop_down  > dt{
    width: 88%;
    font-size: 15px;
    padding: 10px;
}
.sidebar_drop_down  > svg{
    width: 10%;
}

.dateinput{
    padding: 0px;
    width: 40%;
    height: 30px;
    margin: 10px;
    border-color: lightgray;
    border-style: solid;
    border-width: thin;
    text-align: center;
}
.modelinput {
    padding: 10px;
    width: 70%;
    height: 30px;
    margin: 10px 0px 10px 10px;
    border-color: lightgray;
    border-style: solid;
    border-width: thin;
}

.search{
    padding: 0px;
    width: 100px;
    height: 20px;
    margin: 5px;
}

.no_drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;}

.section{
    display: none;
}

.menu{
    padding-top: 5px;
    padding-bottom: 5px;
}

.chk_group > div{
    display: inline-block;
    border: dodgerblue solid 1px;
    border-radius: 5px;
    min-width: 50px;
    margin: 2.5px;
    padding: 2.5px;
    text-align: center;
}

.chk_group > div:hover{
    cursor: pointer;
    color: #ffffff;
    background-color: dodgerblue;
    border: dodgerblue solid 1px;
}

.active_blue{
    background-color: dodgerblue;
    color: #fff;
}


.chk_group{
    padding: 5px;
}

#price_start, #price_end {
	border:0; font-weight:bold;
}
.jh_slid .ui-widget-header {
	background: royalblue;
	height: 8px;
	
}
.jh_slid .ui-state-hover, .jh_slid .ui-widget-content .ui-state-hover, .jh_slid .ui-state-focus, .jh_slid .ui-widget-content .ui-state-focus, .jh_slid .ui-state-default, .jh_slid .ui-widget-content .ui-state-default {
	background: white;
	border-style: solid;
	border-color: royalblue;
	border-radius: 100%;
	width: 14px;
    height: 14px;
}
.jh_slid {
	width: 90%;
    margin: 10px 10px 10px 19px;
}
.jh_slid .ui-slider-handle {
	margin-top: 2px;
}
.jh_slid .ui-slider .ui-slider-handle {
	z-index: 1;
}
.sidebar .panel {
	margin-bottom: 0;
	border-width: 0;
	border-radius: 0;
}
.sidebar .last {
	border-radius: 0 0 10px 10px;
	box-shadow: 0 1px 0 0 rgb(0 0 0 / 20%);
}
</style>

<div class="wrap_main">

    <div class="panel panel-default sidebar">
        <div class="flex_right sidebar_init pointer">
            <span>
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M17.65 6.35C16.2 4.9 14.21 4 12 4c-4.42 0-7.99 3.58-7.99 8s3.57 8 7.99 8c3.73 0 6.84-2.55 7.73-6h-2.08c-.82 2.33-3.04 4-5.65 4-3.31 0-6-2.69-6-6s2.69-6 6-6c1.66 0 3.14.69 4.22 1.78L13 11h7V4l-2.35 2.35z"/></svg>
            </span>
            <span> 전체해제</span>
        </div>

        <div class="no_drag menu panel" >
            <div class="flex_center pointer sidebar_drop_down">
            	<dt>날짜</dt>
                <svg class="arrow" direction="down" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/></svg>
            </div>
            <div class="flex_center section">
                <input class="dateinput init settingdata department_days" type="text" name="pdate" id="pdate" readonly/>
                ~
                <input class="dateinput init settingdata arrival_days" type="text" name="rdate" id="rdate" readonly/>
            </div>
        </div>
        
        <div class="no_drag menu panel" >
            <div class="flex_center pointer sidebar_drop_down">
                <dt>지역</dt>
                <svg class="arrow" direction="down" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/></svg>
            </div>
            <div class="flex_center section chk_group">
                <input type="hidden" class="hidden_chk init" name="lno" id="lno" value=""/>
                <div id="02">서울</div>
                <div id="032">인천</div>
                <div id="031">파주</div>
            </div>
        </div>
        
        <div class="no_drag menu panel" >
            <div class="flex_center pointer sidebar_drop_down">
                <dt>가격</dt>
                <svg class="arrow" direction="down" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/></svg>
            </div>
            <div class="flex_center section jh_slid">
				<input type="text" id="amount" style="border:0; font-weight:bold;" readonly>
				<input class = "init" type="hidden" id="price_start" value = ""/>
				<input class = "init" type="hidden" id="price_end" value = ""/>
				<div id="slider-range"></div>
            </div>
        </div>
        
        <div class="no_drag menu panel" >
            <div class="flex_center pointer sidebar_drop_down">
                <dt>차종</dt>
                <svg class="arrow" direction="down" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/></svg>
            </div>
            <div class="flex_center section chk_group">
                <input type="hidden" class="hidden_chk init" name="type" id="type" value=""/>
                <div id="1">경형</div>
                <div id="2">소형</div>
                <div id="3">준중형</div>
                <div id="4">중형</div>
                <div id="5">고급</div>
                <div id="6">RV/SUV</div>
            </div>
        </div>
        
        <div class="no_drag menu panel" >
            <div class="flex_center pointer sidebar_drop_down">
                <dt>제조사</dt>
                <svg class="arrow" direction="down" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/></svg>
            </div>
            <div class="flex_center section chk_group">
                <input type="hidden" class="hidden_chk init" name="brand" id="brand" value=""/>
                <div>현대</div>
                <div>기아</div>
                <div>르노삼성</div>
                <div>쌍용</div>
                <div>쉐보레</div>
                <div>제네시스</div>
            </div>
        </div>

        <div class="no_drag menu panel" >
            <div class="flex_center pointer sidebar_drop_down">
                <dt>모델</dt>
                <svg class="arrow" direction="down" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/></svg>
            </div>
            <div class="flex_center section">
                <input class="modelinput init settingdata" type="text" name="model" id="model" placeholder="모델명"/>
            </div>
        </div>

        <div class="no_drag menu panel" >
            <div class="flex_center pointer sidebar_drop_down">
                <dt>연료</dt>
                <svg class="arrow" direction="down" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/></svg>
            </div>
            <div class="flex_center section chk_group">
                <input type="hidden" class="hidden_chk init" name="fuel" id="fuel" value=""/>
                <div id="G">휘발유</div>
                <div id="D">경유</div>
                <div id="L">LPG</div>
                <div id="E">전기</div>
                <div id="H">하이브리드</div>
            </div>
        </div>
        
        <div class="no_drag menu panel" >
            <div class="flex_center pointer sidebar_drop_down">
                <dt>정원</dt>
                <svg class="arrow" direction="down" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/></svg>
            </div>
            <div class="flex_center section chk_group">
                <input type="hidden" class="hidden_chk init" name="personnel" id="personnel" value=""/>
                <div>2</div>
                <div>4</div>
                <div>5</div>
                <div>7</div>
                <div>9</div>
                <div>11</div>
                <div>12</div>
            </div>
        </div>

        <div class="no_drag menu panel last" >
            <div class="flex_center pointer sidebar_drop_down">
                <dt>연식</dt>
                <svg class="arrow" direction="down" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/></svg>
            </div>
            <div class="flex_center section chk_group">
                <input type="hidden" class="hidden_chk init" name="year" id="year" value=""/>
                <div>2022</div>
                <div>2021</div>
                <div>2020</div>
                <div>2019</div>
                <div>2018</div>
            </div>
        </div>
    </div>
    
		<div class = "row wrap_content"></div>
</div>
    
    <!-- 달력 ui -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

    <script>
    	
    	// 검색 조건 없을시 날짜 설정
    	function getFormatDate(date){
		    var year = date.getFullYear();              //yyyy
		    var month = (1 + date.getMonth());          //M
		    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
		    var day = date.getDate();                   //d
		    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
		    return  year + '-' + month + '-' + day;     //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}

		var date = new Date();	// 현재 날짜 및 시간
		var now = getFormatDate(date);
		var tomorrow = new Date(date.setDate(date.getDate() + 1));	// 내일
		tomorrow = getFormatDate(tomorrow);
		
		// 일정으로 검색시 초기값 변경
		if ($('#pdate').val() == "" || $('#rdate').val() == "") {
			pdate = now;
			rdate = tomorrow;
			if ("${param.pdate}" != "") {
				now = "${param.pdate}";
				tomorrow = "${param.rdate}";
			}
		}
		
 		if ("${param.lno}" != "") {
			$('#lno').val("${param.lno}");
			$('#${param.lno}').attr("class", "active_blue");
		}
		
		if ("${param.type}" != "") {
			$('#type').val("${param.type}");
			$('#${param.type}').attr("class", "active_blue");
		}
		
		if ("${param.fuel}" != "") {
			$('#fuel').val("${param.fuel}");
			$('#${param.fuel}').attr("class", "active_blue");
 		}
		
		$(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
               dateFormat: 'yy-mm-dd' // Input Format 설정
               ,showOtherMonths: true // 빈 공간에 앞뒤 월의 날짜 표시
               ,showMonthAfterYear:true // 년, 월 순서 표시
               ,changeYear: true // select박스 년 선택 가능
               ,changeMonth: true // select박스 월 선택 가능                
               ,buttonImageOnly: false // 기본 버튼의 회색 부분을 없애고, 이미지만 보이게            
               ,yearSuffix: "년"
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
               ,dayNamesMin: ['일','월','화','수','목','금','토'] 
               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
               ,minDate: "today" // 최소 선택일자
               ,maxDate: "+1Y" // 최대 선택일자            
            });
            // input을 datepicker로 선언
            $("#pdate").datepicker();                    
            $("#rdate").datepicker();
            
            $('#pdate').datepicker('setDate', now);	// From의 초기값을 오늘 날짜로 설정
            $('#rdate').datepicker('setDate', tomorrow);	// To의 초기값을 내일로 설정
		});

		// 날짜 변경 유효성 이벤트
		$("#pdate").change(function(){	// To 변경시 From은 다음날로 설정
			var pdate = new Date ($("#pdate").val());
			var rdate = new Date(pdate.setDate(pdate.getDate() + 1));
			rdate = getFormatDate(rdate);
			$("#rdate").val(rdate);
         });
         
         $("#rdate").change(function(){
            if($("#pdate").val() >= $("#rdate").val()){	// To >= From 이라면
	            alert('반납일과 인수일을 확인해주세요.');		// 알림창
	            var pdate = new Date ($("#pdate").val());
				var rdate = new Date(pdate.setDate(pdate.getDate() + 1));
				rdate = getFormatDate(rdate);
				$("#rdate").val(rdate);	// To 다음날로 설정
	            $("#rdate").focus();	// 다시 선택을 위해 포커스
            }
         });

		// 첫 화면
		setCarInfo(now,tomorrow);
    
		var arrow_up = '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 8l-6 6 1.41 1.41L12 10.83l4.59 4.58L18 14z"/></svg>';
		var arrow_down = '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/></svg>';
		
		// 검색 드롭다운
		$(".sidebar_drop_down").click(function (e) { 
		    var target = $(this).parent();
		    var direction = target.find(".arrow").attr("direction");
		    var section = target.find(".section");
		    if(direction == "up"){
		        target.find(".section").slideUp(100);
		        target.find(".arrow").attr("direction" , "down");
		    }else if(direction == "down"){
		        target.find(".section").slideDown(100);
		        target.find(".arrow").attr("direction" , "up");
		    }
		});
		
		// 검색 조건 값,이벤트 변경
		$(".chk_group > div").click(function(e){
		    $(this).parent().find("div").removeClass("active_blue");
		    var active = $(this).attr("active"); // 조건으로 이용하기 위해 attr 속성 부여
		    var val = $(this).text();
		    if (active == "true") {	// active_btn css, value 설정해제  
		        $(this).parent().find(".hidden_chk").val("");
		        $(this).removeClass(".active_blue");
		        $(this).parent().find("div").attr("active" , false);
		    } else {	// active_btn css, value 설정
		        $(this).parent().find(".hidden_chk").val(val);
		        $(this).toggleClass("active_blue");
		        $(this).attr("active" , true);
		    }
		    setCarInfo(now,tomorrow);	// 페이지 변경 함수 호출
		});
		
		// 전체해제
		$(".sidebar_init").click(function (e) { 
		    $(".init").val("");
		    $("div").removeClass("active_blue");
		    $( "#slider-range" ).slider({
		    	range: true,
				min: 50000,
				max: 250000,
				values: [ 50000 , 250000 ]
		    });
		    setPrice($("#slider-range").slider("values",0),$("#slider-range").slider("values",1));
		    $("#pdate").val(now);
		    $("#rdate").val(tomorrow);
		    setCarInfo(now,tomorrow);
		});
		
		// 조건 값 변경시 이벤트
		$(".settingdata").change(function() {
			setCarInfo(now,tomorrow);
		});
		
		// 검색 엔터 이벤트
		$(".settingdata").on("keyup",function(key){
	        if(key.keyCode==13) {
	        	setCarInfo(now,tomorrow);
	        }
	    });
			
		// 가격 슬라이드 바
		$(function() {
			$("#slider-range").slider({
				range: true,
				min: 50000,
				max: 250000,
				values: [ 50000 , 250000 ],	// 초기값
				slide: function( event, ui ) {	// 실시간 변경 이벤트 
					setPrice($("#slider-range").slider("values",0), $("#slider-range").slider("values",1));	// 형태 변환 함수 호출 
				}	
			});
			setPrice($("#slider-range").slider("values",0), $("#slider-range").slider("values",1));	// 초기값 변환
		});
		
		// 가격 클릭 이벤트
		const mouseup = document.querySelector('#slider-range');	// mouseup: 마우스 버튼을 떼었을 때 이벤트 발생
		mouseup.addEventListener('mouseup',e=> {
			setCarInfo(now,tomorrow);	// 페이지 변경 함수 호출
        }); 
		
		// 가격 형태 변환
		function priceToString(price) {
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');	// 1000단위로 ,찍기 정규식
		}

		function setPrice(start,end) {
			$("#amount").val(priceToString(start) + "원 - " + priceToString(end) + "원" );
			$("#price_start").val(start);
			$("#price_end").val(end);
		}
		
		// 옵션 검사
		function getActive(val){
		    var str = ""
		    if(val){
		     str = "option_active"   
		    }
		    return str;
		}
		
		// 검색 페이지 변경
		function setCarInfo(now,tomorrow){
			// hidden값 변수에 담기
			var pdate = $("#pdate").val();
			var rdate = $("#rdate").val();
			var lno = $("#lno").val();
			var price_start = $("#price_start").val();
			var price_end = $("#price_end").val();
			var brand = $("#brand").val();
			var model = $("#model").val();
			var type = $("#type").val();
			var fuel = $("#fuel").val();
			var personnel = $("#personnel").val();
			var year = $("#year").val();

			if (pdate == "" || rdate == "") {
				pdate = now;
				rdate = tomorrow;
			} // 날짜가 설정되어 있지 않다면 오늘, 내일로 설정

			switch (lno) {
				case "서울": lno = "02"; break;
				case "인천": lno = "032"; break;
				case "파주": lno = "031"; break;
			}
			switch (type) {
				case "경형": type = "1"; break;
				case "소형": type = "2"; break;
				case "준중형": type = "3"; break;
				case "중형": type = "4"; break;
				case "고급": type = "5"; break;
				case "RV/SUV": type = "6"; break;
			}
			switch (brand) {
				case "현대": brand = "1"; break;
				case "기아": brand = "2"; break;
				case "르노삼성": brand = "3"; break;
				case "쌍용": brand = "4"; break;
				case "쉐보레": brand = "5"; break;
				case "제네시스": brand = "6"; break;
			}
			switch (fuel) {
				case "휘발유": fuel = "G"; break;
				case "경유": fuel = "D"; break;
				case "LPG": fuel = "L"; break;
				case "전기": fuel = "E"; break;
				case "하이브리드": fuel = "H"; break;
			}
		
		    $.ajax({
		        type: "post",
		        url: "${pageContext.request.contextPath}/ajax.car",
		        data: {
		        "pdate":pdate,
		        "rdate":rdate,
		        "lno":lno,
		        "price_start":price_start,
		        "price_end":price_end,
		        "brand":brand,
		        "model":model,
		        "type":type,
		        "fuel":fuel,
		        "personnel":personnel,
		        "year":year
		    	},
		        dataType: "json",
		        success: function (data) {
		        	$(".wrap_content").html();
			        var html = "";
		            if (data.length == 0) {
		            	html += '<h3 class = "text-center" style = "margin-top:20%;"> 선택하신 조건에 맞는 차량이 없습니다. <h3>';
		            	$(".wrap_content").html(html);
		            } else {
		            	html = "";
			         	for (var i = 0; i < data.length; i++) {
			         		var smoking = data[i].smoking;
			         		var navigation = data[i].navigation;
			         		var smart = data[i].smart;
			         		var rear = data[i].rear;
			         		var bluetooth = data[i].bluetooth;			     		      
			         		
			            	html += '<div class="wrap_car">';
							html += '	<div class="wrap_left">';
							html += '		<span class="car_name">'+data[i].model+' </span><span class="car_info">'+data[i].tname+' | '+data[i].personnel+'인승 | '+data[i].fname+' | '+data[i].vehicle_year+' | '+data[i].lname+'점</span>';
							html += '		<img src="${pageContext.request.contextPath}/car/upload/'+data[i].cimg+'" alt="'+data[i].model+'.png" class="car_img"></img>';
							html += '	</div>';
							html += '	<div class="wrap_right">';
							html += '		<div class="wrap_reservation">';
							html += '			<div class="wrap_price">';
							html += '				<div class = "text-right"><span>'+data[i].cprice+'</span></div>';
							html += '	            <div><span>대여 24시간 / 일반자차 포함 가격</span></div>';
							html += '	        </div>';
							html += '	    </div>';
							html += '	    <div class="wrap_option">';
							html += '	    	<div>옵션</div>';
							html += '	        <div>';
							html += '	    	   <span class="option '+getActive(smoking)+'">금연</span>';
							html += '	           <span class="option '+getActive(navigation)+'">네비</span>';
							html += '              <span class="option '+getActive(smart)+'">스마트키</span>';
							html += '              <span class="option '+getActive(rear)+'">후방카메라</span>';
							html += '              <span class="option '+getActive(bluetooth)+'">블루투스</span>';
							html += '          </div>';             
							html += '	    </div>';	       
							html += '	    <div class="wrap_review text-right">';              
							html += '	   		<span>리뷰<span class="review_count">'+data[i].cnt+'개</span></span>';
							html += '           <span>★<span class="rating">'+data[i].star+'.0 / 5.0</span></span>';
				            html += '	    </div>';
			            	html += '	    <div class = "text-right">';
		            		html += '    	   <a href = "${pageContext.request.contextPath}/searchDetail.car?cno='+data[i].cno+'&pdate='+pdate+'&rdate='+rdate+'" class="btn btn-primary">예약</a>';
		           			html += '	    </div>';
		        			html += '	</div>';	   
		     				html += '</div>';
			            }
	     				$(".wrap_content").html(html);
		            }
		        }
		    });
		}
		
	</script>

<%@ include file = "../inc/footer.jsp"%>