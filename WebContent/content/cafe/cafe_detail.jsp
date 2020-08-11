<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- 슬라이드 css -->
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">	
	
  <title>Document</title>
  
  <style type="text/css">
  	.swiper-container {
      width: 100%;
      height: 350px;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    
    .swiper-slide img{width: 100%;}
  </style> 
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ec97f6b0a48a0b167ae396078de4108"></script>
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  
</head>

<body>

    <header>
    	<%@ include file="../header/header.jsp" %>
    </header>

    <div id="content" >
    	<div class="cafe_imgBox swiper-container">
    		<ul class="swiper-wrapper">
    			<c:forEach var="i" items="${cafe_detail.c_photo}">
    				<li class="swiper-slide">
	    				<img alt="cafe 이미지" src="${pageContext.request.contextPath}/upload/${i}">
	    			</li>
    			</c:forEach>
    		</ul>
    	</div>
    
		<div class="inner">
			<!-- 카페정보 -->
			
			<div class="cafeTitle">
				<h2>${cafe_detail.c_name}</h2>
				<p>
					<span class="glyphicon glyphicon-eye-open"></span> 
					<span> ${resVo.s_num} </span> 
					<span class="glyphicon glyphicon-pencil"></span> 
					<span> ${review_total.total} </span> 
				</p>
			</div>
			
			<div id="cafeInfo">
				<table class="table" >
		        <tr>
		            <th class="col-sm-2">주소</th>
		            <td class="col-sm-8">${cafe_detail.c_addr}
		            </td>
		        </tr>
		
		        <tr>
		            <th class="col-sm-2">전화번호</th>
		            <td class="col-sm-8"><a href="tel:${cafe_detail.c_tel}">${cafe_detail.c_tel}</a></td>
		        </tr>
		        
		        <tr>
		            <th class="col-sm-2">가격대</th>
		            <td class="col-sm-8">${cafe_detail.c_price}</td>
		          </tr>
		  
		          <tr>
		            <th class="col-sm-2">주차</th>
		            <td class="col-sm-8">${cafe_detail.c_park}</td>
		          </tr>
		
		          <tr>
		            <th class="col-sm-2">영업시간</th>
		            <td class="col-sm-8">${cafe_detail.c_time}</td>
		          </tr>
		  
		          <tr>
		            <th class="col-sm-2">휴일</th>
		            <td class="col-sm-8">${cafe_detail.c_hday}</td>
		          </tr>
		  		          
		          <tr>
		            <th class="col-sm-2">홈페이지</th>
		            <td class="col-sm-8"><a href="${cafe_detail.c_uri}" target="_blank">${cafe_detail.c_uri}</a></td>
		          </tr>
		          
		        <tr>
		        	<td colspan="2" class="tag">
		        		<ul>
		        			<c:set var="tags" value="${fn:split(cafe_detail.c_tag, ',')}" />
		        			<c:forEach var="i" begin="0" end="${fn:length(tags)-1}">
								<li>
			                        <input type="button" class="btn btn-info" value="${tags[i]}" onclick="location.href='${pageContext.request.contextPath}/tag_list.do?c_tag=${tags[i]}'">
			                    </li>		        			
		        			</c:forEach>
		        		</ul>
		        	</td>
		        </tr> 
		          
		        <tr>
		            <th class="col-sm-2">메뉴</th>
		            <td class="col-sm-8">
		                <ul id="memuList">
		                    <c:set var="memus" value="${fn:split(cafe_detail.c_menu1, ',')}" />
	                    	<li class="menu count0">
		                        <span class="menuName">${memus[0]}</span>
		                        <span class="menuPrice">
		                        	<fmt:formatNumber type="currency" value="${memus[1]}" />                   		
		                        </span>
		                    </li>
		                    
		                    <c:set var="memus" value="${fn:split(cafe_detail.c_menu2, ',')}" />
	                    	<li class="menu count1">
		                        <span class="menuName">${memus[0]}</span>
		                        <span class="menuPrice">
		                        	<fmt:formatNumber type="currency" value="${memus[1]}" />                   		
		                        </span>
		                    </li>
		                    
		                    <c:set var="memus" value="${fn:split(cafe_detail.c_menu3, ',')}" />
	                    	<li class="menu count2">
		                        <span class="menuName">${memus[0]}</span>
		                        <span class="menuPrice">
		                        	<fmt:formatNumber type="currency" value="${memus[1]}" />                   		
		                        </span>
		                    </li>
		                    
		                    <c:set var="memus" value="${fn:split(cafe_detail.c_menu4, ',')}" />
	                    	<li class="menu count3">
		                        <span class="menuName">${memus[0]}</span>
		                        <span class="menuPrice">
		                        	<fmt:formatNumber type="currency" value="${memus[1]}" />                   		
		                        </span>
		                    </li>
		                </ul>
		            </td>
		        </tr>
		        
		        <tr>
		        	<td colspan="2">
		        		<div id="cafeMap" style="width:100%;height:500px;"></div>
		        	</td>
		        </tr>
		    </table>
			</div>
		    
		    <!-- 리뷰 작성 -->
		    <c:if test="${not empty user}">
				<div class="reviewWriter">
				   <form action="review_insert.do" method="post">
				
				       <div class="panel panel-default">
				           <div class="panel-body">
				               <div class="contentBox">
				               	<input type="hidden" name="c_idx" value="${cafe_detail.c_idx}">
				               	<textarea class="form-control reviewContent r_cot" rows="5" name="r_cot" style="resize: none"></textarea>
				               </div>
				               
				               <div class="input-group review_grade">
				                    <span class="input-group-addon"><i class="glyphicon glyphicon-star-empty"></i></span>
				                    
				                    <div class="form-control">
				                    	<label class="radio-inline"><input type="radio" name="r_grade" value="1">1점</label>
					                    <label class="radio-inline"><input type="radio" name="r_grade" value="2">2점</label>
					                    <label class="radio-inline"><input type="radio" name="r_grade" value="3">3점</label>
					                    <label class="radio-inline"><input type="radio" name="r_grade" value="4">4점</label>
					                    <label class="radio-inline"><input type="radio" name="r_grade" value="5">5점</label>
				                    </div>
				                    
				                </div>
				               
				               <div class="well">
				                   <div class="input-group review_grade">
				                       <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				                       <input id="r_pwd" type="password" class="form-control" name="r_pwd" placeholder="Password">
				                   </div>
				                   
				                   <div class="btnBox">
				                   	<div class="btn-group">
				                   		<p class="reviw_alert_text"></p>
				                   		
				                        <input type="button" class="btn btn-default" onclick="review_writer(this.form);" value="등록">
				                        <input type="button" class="btn btn-default" onclick="review_cancel();" value="취소">
				                     </div>
				                   	</div>
				                </div>
				            </div>
				        </div>
				
				    </form>
				</div>
		    </c:if>
		    <!-- 리뷰목록 -->
		    <div class="reviewBox">
		    	<div class="reviewText">
		    		<div class="reviewL">리뷰</div>
		    		
		    		<div class="reviewR">
		    			<ul>
		    				<li>전체(${review_total.total})</li>
		    				<li>짱짱(${review_avg.god})</li>
		    				<li>굿굿(${review_avg.likes})</li>
		    				<li>쏘쏘(${review_avg.soso})</li>
		    				<li>별로(${review_avg.notBad})</li>
		    				<li>최악(${review_avg.bad})</li>
	    				</ul>
		    		</div>
		    	</div>
		    	
		    	<ul class="reviewUser">
		    		<c:if test="${empty review_detail}">
		    			<li>아직등록된 리뷰가 없습니다. 첫 리뷰를 등록해주세요!</li>
		    		</c:if>
		    	
		    		<c:forEach items="${review_detail}" var="rd">
			    		<li>
			    			<div class="cafeReview">
							    <div class="userImg">
							      	<img src="${pageContext.request.contextPath}/upload/${rd.m_photo}">
							      	<span>${rd.m_name}</span>
							    </div>
							    <div class="review">
							      <span class="point"><img src="${pageContext.request.contextPath}/img/icon/${rd.gender_img}.png" alt="${rd.gender_img}"></span>	
							      <span>${fn:substring(rd.r_regdate, 0, 10)}</span>
							      <p>${rd.r_cot}</p>
							    	
							    	<c:if test="${user.m_idx == rd.m_idx}">
								      	<div class="btn_box">
								      		<button type="button" class="btn" onclick="review_update(${rd.r_idx});">수정</button>
		                 					<button type="button" class="btn" onclick="review_detail_del(${rd.r_idx});">삭제</button>
								      	</div>
	                 				</c:if>	
							    </div>
						  </div>
			    		</li>
		    		</c:forEach>
		    	</ul>
		    </div>
		    
		</div>
		
		<%@ include file="../etc/scrool.jsp" %>
	</div>

    <footer>
    	<%@ include file="../footer/footer.jsp" %>
    </footer>
    
	<script>
	
		//리뷰 삭제 
		function review_detail_del(r_idx) {
			let cafe_review_list_idx = r_idx;
			
			if (!confirm("삭제 하시겠습니까?"))			
				return;
			
			location.href = "mypage_review_delete.do?r_idx="+cafe_review_list_idx+"&url="+location.href;
		}
		
		function review_update(r_idx) {
			let cafe_idx = r_idx;
						
			location.href = "mypage_review_update_form.do?r_idx="+cafe_idx+"&url="+location.href;
		}
	
		//리뷰 등록 =================================================================
		function review_writer(f) {
			var r_cot = $(".reviewWriter .r_cot").val().trim();
			var r_pwd = $(".reviewWriter #r_pwd").val().trim();
			
			if (r_cot == "") {
				
				$(".reviw_alert_text").text("내용을 입력해주세요.");
				
				$(".reviewWriter .r_cot").val("");
				$(".reviewWriter .r_cot").focus();
				
				return;
			}	
			
			if (r_pwd == "") {
				
				$(".reviw_alert_text").text("비밀번호를 입력해주세요.");
				
				$(".reviewWriter #r_pwd").val("");
				$(".reviewWriter #r_pwd").focus();
				
				return;
			}	
			
			//전송
			f.submit();
			
		}
			
		//리뷰 등록 취소 ============================================================
		function review_cancel() {
			$(".reviewWriter .r_cot").val("");
			$(".reviewWriter #r_pwd").val("");
			
			$(".reviewWriter .radio-inline input").removeAttr('checked');
		}
			
		//슬라이드 ==================================================================
	    var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 3,
	      loop: true,
	      mousewheel: true,
	      autoplay: {
	          delay: 2500,
	          disableOnInteraction: false,
	        },
	    });
	      		
  		//지도 ======================================================================
  		var cafe_map = '${cafe_detail.c_map}';
  		var c_map = cafe_map.split(",");
  		
  		var mapContainer = document.getElementById('cafeMap'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(c_map[0], c_map[1]), // 지도의 중심좌표
	        level: 3, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    };  

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	  	 
		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(c_map[0], c_map[1]), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
		
	</script>

</body>

</html>