<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 주소검색 라이브러리 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 

<script type="text/javascript">

	$(document).ready(function() {
		
		//주차
		if ('${cafe_update.c_park}' == '가능') {
			$("#radio_ok").attr("checked", true);
		}else{
			$("#radio_no").attr("checked", true);
		}
		
		//가격대
		if ('${cafe_update.c_price}' == '2000') {
			$(".c_prince1").attr("selected", true);
		}else if ('${cafe_update.c_price}' == '4000') {
			$(".c_prince2").attr("selected", true);
		}else if ('${cafe_update.c_price}' == '6000') {
			$(".c_prince3").attr("selected", true);
		}else if ('${cafe_update.c_price}' == '8000') {
			$(".c_prince4").attr("selected", true);
		}else if ('${cafe_update.c_price}' == '10000') {
			$(".c_prince5").attr("selected", true);
		}else {
			$(".c_prince6").attr("selected", true);
		}
		
		/* 주소검색 ============================= */
		$("#btn_find_addr").click(function() {
			//http://postcode.map.daum.net/guide
			//우편번호 서비스
			new daum.Postcode({
				oncomplete: function(data) {
		            /* data = {'zonecode' : 12345, 'address' : '서울시 ...'} */
		            
		            $("#c_zipcode").val(data.zonecode);
		            $("#c_addrs").val(data.address);
		            
		            let zipcode = $("#c_zipcode").val();
	            	let addrs = $("#c_addrs").val();
	            	
					$(".c_addr").val(zipcode+" "+addrs);
					
		        }
		    }).open();
		});
		/* //주소검색 ============================= */
		
	});

	// /ins.do?c_name=&c_addr=&c_tel=&c_price=2000&c_park=%EA%B0%80%EB%8A%A5&c_time=&c_hday=&c_uri=&e_menu1=&e_menu2=&e_menu3=&e_menu4=&t_tag=&c_photo=&c_map=
	function cafe_update(f) {
	 	let c_name = $("#c_name").val().trim();
	 	let c_addrs = $("#c_addrs").val().trim();
	 	let c_tel = $("#c_tel").val().trim();
	 	let c_time = $("#c_time").val().trim();
	 	let c_hday = $("#c_hday").val().trim();
	 	let c_menu1 = $(".c_menu1").val().trim();
	 	let c_tag = $("#c_tag").val().trim();
	 	let c_map = $("#c_map").val().trim();
	 	let c_photo = $("#c_photo").val().trim();

		if ( c_name == "") {
			$(".c_name_text").text("가게명을 입력하세요.");
			
			$("#c_name").val("");
			$("#c_name").focus();
			
			return;
		}
		
		if ( c_addrs == "") {
			$(".c_addrs_text").text("주소를 입력하세요.");
			
			$("#c_addrs").val("");
			$("#c_addrs").focus();
			
			return;
		}

		if ( c_tel == "") {
			$(".c_tel_text").text("전화번호를 입력하세요.");
			
			$("#c_tel").val("");
			$("#c_tel").focus();
			
			return;
		}

		if ( c_time == "") {
			$(".c_time_text").text("영업시간을 입력하세요.");
			
			$("#c_time").val("");
			$("#c_time").focus();
			
			return;
		}

		if ( c_hday == "") {
			$(".c_hday_text").text("휴일을 입력하세요.");
			
			$("#c_hday").val("");
			$("#c_hday").focus();
			
			return;
		}

		if ( c_menu1 == "") {
			$(".c_menu1_text").text("메뉴를 입력하세요.");
			
			$(".c_menu1").val("");
			$(".c_menu1").focus();
			
			return;
		}

		if ( c_tag == "") {
			$(".c_tag_text").text("태그를 입력하세요.");
			
			$("#c_tag").val("");
			$("#c_tag").focus();
			
			return;
		}

		if ( c_map == "") {
			$(".c_map_text").text("위도 / 경도를 입력하세요.");
			
			$("#c_map").val("");
			$("#c_map").focus();
			
			return;
		}

		if (c_photo == "") {
			$(".c_photo_text").text("사진을 등록해주세요.");
			
			return;
		}
		
		//전송
		f.submit();
	}
</script>

</head>
<body>

	<header>
	 	<%@ include file="../header/header.jsp" %>
	</header>
	
	<div id="content" >
		<div class="inner">
			<div class="inner-in formBox">
			    <h3 class="linkBox">카페 수정 </h3>
			
			    <form action="cafe_update.do" method="post" enctype="multipart/form-data">
			        <table class="table">
			            <tr>
			                <th class="col-sm-1">
			                    <span class="group-addon">@</span>
			                </th>
			                <td class="col-sm-11">
			                	<input type="hidden" name="c_idx" value="${cafe_update.c_idx}">	
			                    <input type="text" name="c_name" id="c_name" class="form-control" placeholder="가게명" value="${cafe_update.c_name}">
			                    <p class="c_name_text"></p>
   			                </td>
			            </tr>
			
			            <tr>
			                <th rowspan="2" class="col-sm-1 rowspan">
			                	<span class="group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
			                </th>
			                <td class="col-sm-11">
			                    <input id="c_zipcode" type="text" class="form-control floatL" name="m_zipcode" placeholder="우편번호" value="${fn:substring(cafe_update.c_addr, 0, 4)}">
			                    <input type="button" class="btn floatR" value="검색" id="btn_find_addr"> 
			                </td>
			            </tr>
			            
			            <tr>
			            	<td class="col-sm-11">
			                	<input id="c_addrs" type="text" class="form-control" placeholder="주소" value="${fn:substring(cafe_update.c_addr, 6, -1)}">
			                	<input type="hidden" class="c_addr" name="c_addr" value="${cafe_update.c_addr}">
			                	<p class="c_addr_text"></p>
			                </td>
			            </tr>
			
			            <tr>
			                <th class="col-sm-1"><span class="group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span></th>
			                <td class="col-sm-11">
			                    <input type="text" name="c_tel" id="c_tel" class="form-control" placeholder="전화번호" value="${cafe_update.c_tel}">
			                    <p class="c_tel_text"></p>
			                </td>
			            </tr>
			
			            <tr>
			                <th class="col-sm-1"><span class="group-addon"><i class="glyphicon glyphicon-credit-card"></i></span></th>
			                <td class="col-sm-11">
			                    <select class="form-control" id="c_price" name="c_price">
			                        <option value="2000" class="c_prince1">2000원대</option>
			                        <option value="4000" class="c_prince2">4000원대</option>
			                        <option value="6000" class="c_prince3">6000원대</option>
			                        <option value="8000" class="c_prince4">8000원대</option>
			                        <option value="10000" class="c_prince5">10000원대</option>
			                        <option value="12000" class="c_prince6">12000원대</option>
			                    </select>
			                </td>
			            </tr>
			
			            <tr>
			                <th class="col-sm-1"><span class="group-addon"><i class="glyphicon glyphicon-road"></i></span></th>
			                <td class="col-sm-11">
			                    <label class="radio-inline">
			                        <input type="radio" name="c_park"  value="가능" id="radio_ok">가능
			                    </label>
			                    <label class="radio-inline">
			                        <input type="radio" name=c_park value="불가" id="radio_no">불가
			                    </label>
			                </td>
			            </tr>
			
			            <tr>
			                <th class="col-sm-1"><span class="group-addon"><i class="glyphicon glyphicon-time"></i></span></th>
			                <td class="col-sm-11">
			                    <input type="text" name="c_time" id="c_time" class="form-control" placeholder="영업시간" value="${cafe_update.c_time}">
			                    <p class="c_time_text"></p>
			                </td>
			            </tr>
			            
			            <tr>
			                <th class="col-sm-1"><span class="group-addon"><i class="glyphicon glyphicon-time"></i></span></th>
			                <td class="col-sm-11">
			                    <input type="text" name="c_hday" id="c_hday" class="form-control" placeholder="휴일" value="${cafe_update.c_hday}">
			                    <p class="c_hday_text"></p>
			                </td>
			            </tr>
			
			            <tr>
			                <th class="col-sm-1"><span class="group-addon"><i class="glyphicon glyphicon-globe"></i></span></th>
			                <td class="col-sm-11">
			                    <input type="text" name="c_uri" id="c_uri" class="form-control" placeholder="웹 사이트" value="${cafe_update.c_uri}">
			                </td>
			            </tr>
			            
			            <tr>
			                <th rowspan="4" class="col-sm-1 rowspan">
			                    <span class="group-addon"><i class="glyphicon glyphicon-glass"></i></span>
			                </th>
			                <td class="col-sm-11">
			                	<input type="text" name="c_menu1" class="c_menu1 form-control" placeholder="메뉴 및 가격" value="${cafe_update.c_menu1}">
			                	<p class="c_menu1_text"></p>
			                </td>
			            </tr>
			            <tr>
			                <td class="col-sm-11"><input type="text" name="c_menu2" class="c_menu2 form-control" placeholder="메뉴 및 가격" value="${cafe_update.c_menu2}"></td>
			            </tr>
			            <tr>
			                <td class="col-sm-11"><input type="text" name="c_menu3" class="c_menu3 form-control" placeholder="메뉴 및 가격" value="${cafe_update.c_menu3}"></td>
			            </tr>
			            <tr>
			                <td class="col-sm-11"><input type="text" name="c_menu4" class="c_menu4 form-control" placeholder="메뉴 및 가격" value="${cafe_update.c_menu4}"></td>
			            </tr>
			
			            <tr>
			                <th class="col-sm-1"><span class="group-addon">#</span></th>
			                <td class="col-sm-11">
			                    <input type="text" name="c_tag" id="c_tag" class="form-control" placeholder="태그" value="${cafe_update.c_tag}">
			                    <p class="c_tag_text"></p>
			                </td>
			            </tr>
			
			            <tr>
			                <th class="col-sm-1"><span class="group-addon"><i class="glyphicon glyphicon-duplicate"></i></span></th>
			                <td class="col-sm-11">
			                    <input multiple="multiple" type="file" name="c_photo" id="c_photo" class="form-control">
			                    <p class="c_photo_text"></p>
			                </td>
			            </tr>
			
			            <tr>
			                <th class="col-sm-1"><span class="group-addon"><i class="glyphicon glyphicon-globe"></i></span></th>
			                <td class="col-sm-11">
			                    <input type="text" name="c_map" id="c_map" class="form-control" placeholder="지도" value="${cafe_update.c_map}">
			                    <p class="c_map_text"></p>
			                </td>
			            </tr>
			        </table>
			
			        <div class="a-btn">
			            <div class="btn-group">
			                <input type="button" class="btn" value="수정" onclick="cafe_update(this.form);">
			                <input type="button" class="btn" value="목록" onclick="location.href='${pageContext.request.contextPath}/user_mypage.do'">
			            </div>
			        </div>
			    </form>
			</div>
		</div>
		
		<%@ include file="../etc/scrool.jsp" %>
	</div>
	
	<footer>
		<%@ include file="../footer/footer.jsp" %>
	</footer>

</body>
</html>