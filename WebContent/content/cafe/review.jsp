<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<title>Document</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		if ('${mypage_review_list.r_grade}' == 1) {
			$(".val1").attr("checked", true);
		}else if ('${mypage_review_list.r_grade}' == 2) {
			$(".val2").attr("checked", true);
		}else if ('${mypage_review_list.r_grade}' == 3) {
			$(".val3").attr("checked", true);
		}else if ('${mypage_review_list.r_grade}' == 4) {
			$(".val4").attr("checked", true);
		}else if ('${mypage_review_list.r_grade}' == 5) {
			$(".val5").attr("checked", true);
		}
	});
	
	//리뷰 등록 =================================================================
	function review_update(f) {
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
	
	//이전페이지로 이동 ============================================================
	function goBack() {
		window.history.back();
	}
	
</script>

<style type="text/css">
	#content .inner-in{margin: 120px auto 0;}
</style>

</head>
<body>

	<header>
		<%-- ${pageContext.request.contextPath} --%>
		<%@ include file="/content/header/header.jsp" %>
	</header>

	<div id="content">
		<div class="inner-in">
			<!-- 리뷰 작성 -->
			<div class="reviewWriter">
			   <form action="mypage_review_update.do" method="post">
			       <input type="hidden" name="url"  value="${ param.url }">
			       <div class="panel panel-default">
			           <div class="panel-body">
			               <div class="contentBox">
			               	<input type="hidden" name="c_idx" value="${mypage_review_list.c_idx}">
			               	<input type="hidden" name="r_idx" value="${mypage_review_list.r_idx}">
			            	<textarea class="form-control reviewContent r_cot" rows="5" name="r_cot" style="resize: none">${mypage_review_list.r_cot}</textarea>
			            </div>
			            
			            <div class="input-group review_grade">
			                 <span class="input-group-addon"><i class="glyphicon glyphicon-star-empty"></i></span>
			                 
			                 <div class="form-control">
			                 	<label class="radio-inline"><input type="radio" class="val1" name="r_grade" value="1">1점</label>
			                  <label class="radio-inline"><input type="radio" class="val2" name="r_grade" value="2">2점</label>
			                  <label class="radio-inline"><input type="radio" class="val3" name="r_grade" value="3">3점</label>
			                  <label class="radio-inline"><input type="radio" class="val4" name="r_grade" value="4">4점</label>
			                  <label class="radio-inline"><input type="radio" class="val5" name="r_grade" value="5">5점</label>
			                 </div>
			                 
			             </div>
			            
			            <div class="well">
			                <div class="input-group review_grade">
			                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
			                    <input id="r_pwd" type="password" class="form-control" name="r_pwd" placeholder="Password" value="${mypage_review_list.r_pwd}">
			                </div>
			                
			                <div class="btnBox">
			                	<div class="btn-group">
			                		<p class="reviw_alert_text"></p>
			                		
			                     <input type="button" class="btn btn-default" onclick="review_update(this.form);" value="수정">
			                     <input type="button" class="btn btn-default" onclick="goBack();" value="이전페이지">
			                     </div>
			                   	</div>
			                </div>
			            </div>
			        </div>
			
			    </form>
			</div>
			<!-- 리뷰목록 -->
			
			<%@ include file="/content/etc/scrool.jsp" %>
		</div>	
	</div>

	<footer>
    	<%@ include file="/content/footer/footer.jsp" %>
    </footer>
</body>
</html>