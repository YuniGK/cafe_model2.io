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
  
	//정규식 체크
	let telID = /^\d{3}-\d{3,4}-\d{4}$/;
	
	let nameID = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	
	let pwdID = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	let emailID = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	
	/* jQuery 초기화 */
	$(document).ready(function() {
		/* 라디오 버튼 ========================== */
		if ('${member_update.m_gender}' == '남성') {
			$("#radio_man").attr("checked", true);
		}else{
			$("#radio_wonman").attr("checked", true);
		}
		
		/* 라디오 버튼 ========================== */
		if ('${member_update.m_grade}' == '일반') {
			$("#radio_general").attr("checked", true);
		}else{
			$("#radio_admin").attr("checked", true);
		}
		
		/* 전화번호 ========================== */
		let allTel = '${member_update.m_tel}';
		
		let telArray = allTel.split("-");

		if (telArray[0] == '010') {
			$("#radio_tel1").attr("checked", true);
		}else if (telArray[0] == '011') {
			$("#radio_tel2").attr("checked", true);
		}else if (telArray[0] == '016') {
			$("#radio_tel3").attr("checked", true);		
		}else{
			$("#radio_tel4").attr("checked", true);	
		}
		
		let m_phone2 = $("#m_phone2").val(telArray[1]); 
		let m_phone3 = $("#m_phone3").val(telArray[2]);
		
		
	});	
	
  //전송 ===================================================
  function send(f) {
	    let m_pwd = $("#userJoin #m_pwd").val().trim();
		let c_pwd = $("#userJoin #c_pwd").val().trim();
		
		let m_name = $("#m_name").val().trim();
				
		let m_phone1 = $("#m_phone1").val(); 
		let m_phone2 = $("#m_phone2").val(); 
		let m_phone3 = $("#m_phone3").val();
		
		let m_email = $("#m_email").val().trim();
  		  		
  		//비밀번호 체크
  		if (! pwdID.test(m_pwd)) {
			$(".m_pwd_text").text("비밀번호를 입력하세요.");
  			
  			$("#userJoin #m_pwd").val("");
  			$("#userJoin #m_pwd").focus();
  			
  			return;
		}
  		
  		if (! pwdID.test(c_pwd)) {
			$(".c_pwd_text").text("비밀번호를 입력하세요.");
  			
  			$("#userJoin #c_pwd").val("");
  			$("#userJoin #c_pwd").focus();
  			
  			return;
		}
  		
  		if (m_pwd != c_pwd) {
			$(".c_pwd_text").text("비밀번호가 일치하지 않습니다.");
  			
  			$("#userJoin #c_pwd").val("");
  			$("#userJoin #c_pwd").focus();
  			
  			return;
		}
  		
  		//이름 체크
  		if (! nameID.test(m_name)) {
			$(".m_name_text").text("이름을 입력하세요.");
  			
  			$("#m_name").val("");
  			$("#m_name").focus();
  			
  			return;
		}
  		
  		//전화번호 체크
  		let m_tel = m_phone1+"-"+m_phone2+"-"+m_phone3;
  		
  		if (! telID.test(m_tel)) {
			$(".m_tel_text").text("전화번호를 입력하세요.");
  			
  			$("#m_phone2").val("");
  			$("#m_phone3").val("");
  			
  			$("#m_phone2").focus();
  			
  			return;
		}
  		
  		$("#m_tel").val(m_tel);
  		
  		//이메일 체크
  		if (!emailID.test(m_email)) {
			$(".m_email_text").text("이메일을 입력하세요.");
  			
  			$("#m_email").val("");
  			$("#m_email").focus();
  			
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
			<div id="userJoin">
		        <div class="inner-in">
		
		            <div class="titleBox">
		                <h2>회원정보 페이지</h1>
		            </div>
		
		            <div class="profileplace">
		                <img class="img-responsive center-block" id="m_photo" src="${pageContext.request.contextPath}/img/mypage/user.jpg">
		            </div>
		
		            <form action="member_update.do" method="post" enctype="multipart/form-data">
		
		                <table class="table">
		                    <tr>
		                        <th class="col-sm-3">사용자 ID</th>
		                        <td class="col-sm-9">
	                                <input type="text" name="m_id" id="m_id" class="form-control" readonly="readonly" value="${member_update.m_id}">
		                        </td>
		                    </tr>
		
		                    <tr>
		                        <th class="col-sm-3">비밀번호</th>
		                        <td class="col-sm-9">
		                        	<input type="password" name="m_pwd" id="m_pwd" class="form-control" value="${member_update.m_pwd}">
		                        	<p class="m_pwd_text"></p>
	                        	</td>
		                    </tr>
		
		                    <tr>
		                        <th class="col-sm-3">비밀번호 확인</th>
		                        <td class="col-sm-9">
		                        	<input type="password" id="c_pwd" class="form-control" value="1106qwe!">
		                        	<p class="c_pwd_text"></p>
	                        	</td>
		                    </tr>
		
		                    <tr>
		                        <th class="col-sm-3">이름</th>
		                        <td class="col-sm-9">
		                        	<input type="text" name="m_name" id="m_name" class="form-control" value="${member_update.m_name}">
		                        	<p class="m_name_text"></p>	
	                        	</td>
		                    </tr>
		
		                    <tr>
		                        <th class="col-sm-3">성별</th>
		                        <td class="col-sm-9">
		                            <label class="radio-inline">
		                                <input type="radio" name="m_gender" id="radio_man" value="남성">남성
		                            </label>
		                            <label class="radio-inline">
		                                <input type="radio" name="m_gender" id="radio_wonman" value="여성">여성
		                            </label>
		                        </td>
		                    </tr>
		
		                    <tr>
		                        <th class="col-sm-3">전화번호</th>
		                        <td class="col-sm-9">
		                        	<input type="hidden" name="m_tel" id="m_tel">
		                            <div class="col-sm-4">
		                                <select class="form-control" id="m_phone1">
		                                    <option value="010" id="radio_tel1">010</option>
		                                    <option value="011" id="radio_tel2">011</option>
		                                    <option value="016" id="radio_tel3">016</option>
		                                    <option value="017" id="radio_tel4">017</option>
		                                </select>
		                            </div>
		
		                            <div class="col-sm-4">
		                                <input type="text" id="m_phone2" class="form-control">
		                            </div>
		
		                            <div class="col-sm-4">
		                                <input type="text" id="m_phone3" class="form-control">
		                            </div>
		                            
		                            <p class="m_tel_text"></p>	
		                        </td>
		                    </tr>
		
		                    <tr>
		                        <th class="col-sm-3">E-Mail</th>
		                        <td class="col-sm-9">
		                        	<input class="form-control" type="text" id="m_email" name="m_email" maxlength="30" value="${member_update.m_email}">
		                        	<p class="m_email_text"></p>	
	                        	</td>
		                    </tr>
		
		                    <tr>
		                        <th class="col-sm-3">Image</th>
		                        <td class="col-sm-9">
		                        	<input class="form-control" type="file" name="m_photo" maxlength="30">
		                        </td>
		                    </tr>
		
							<c:if test="${member_update.m_grade ne '일반'}">
						    	<tr>
			                        <th class="col-sm-3">등급</th>
			                        <td class="col-sm-9">
			                            <label class="radio-inline">
			                                <input type="radio" name="m_grade" id="radio_general" value="일반">일반
			                            </label>
			                            <label class="radio-inline">
			                                <input type="radio" name="m_grade" id="radio_admin" value="관리자">관리자
			                            </label>
			                        </td>
			                    </tr>
						    </c:if>
		
		                    <tr class="btnBox">
		                    	<td colspan="2">
		                    		<input id="com" type="button" class="btn btn-info" value="수정" onclick="send(this.form);">
		                    		<input type="button" class="btn" value="목록" onclick="location.href='${pageContext.request.contextPath}/user_mypage.do'">
	                    		</td>
		                    </tr>
		                </table>
		
		            </form>
		        </div>
		
		    </div>
		</div>
		
		<%@ include file="../etc/scrool.jsp" %>
	</div>

    <footer>
    	<%@ include file="../footer/footer.jsp" %>
    </footer>

</body>

</html>