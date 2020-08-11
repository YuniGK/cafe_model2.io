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
<script type="text/javascript">
	function member_del(m_idx) {
		let admin_member_list_idx = m_idx;
		
		if (!confirm("삭제 하시겠습니까?"))			
			return;
		
		location.href = "member_delete.do?m_idx="+admin_member_list_idx;
	}
	
</script>
	
</head>
<body>

<div class="memberBox">
     <h3 class="linkBox">오늘 신규 가입자 <span class="badge">${todayMember}</span></h3>

     <div class="inner-in">
         <table class="table">
             <tr>
                 <th>번호</th>
                 <th>아이디</th>
                 <th>이름</th>
                 <th>성별</th>
                 <th>가입일자</th>
                 <th></th>
             </tr>

			<c:if test="${empty userList}">
				<tr>
					<td colspan="6">아직 가입한 회원이 없습니다.</td>
				</tr>	
			</c:if>

			<c:forEach items="${userList}" var="member" varStatus="i">
	             <tr>
	                 <td>${i.count}</td>
	                 <td>${member.m_id}</td>
	                 <td>${member.m_name}</td>
	                 <td>${member.m_gender}</td>
	                 <td>${fn:substring(member.m_regdate, 0, 10)}</td>
	                 <td>
	                 	 <button type="button" class="btn" onclick="location.href = '${pageContext.request.contextPath}/member_updateForm.do?m_idx=${member.m_idx}'">수정</button>
	                     <button type="button" class="btn" onclick="member_del(${member.m_idx});">삭제</button>
	                 </td>
	             </tr>
             </c:forEach>
         </table>

     </div>

     <div class="a-btn"><a href="#" class="btn btn-default">더보기</a></div>
 </div>

</body>
</html>