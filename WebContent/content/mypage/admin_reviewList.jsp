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
	function review_del(r_idx) {
		let admin_review_list_idx = r_idx;
		
		if (!confirm("삭제 하시겠습니까?"))			
			return;
		
		location.href = "mypage_review_delete.do?r_idx="+admin_review_list_idx+"&url="+location.href;
	}
	
	function review_update(r_idx) {
		let admin_review_list_idx = r_idx;
		
		location.href = "mypage_review_update_form.do?r_idx="+admin_review_list_idx+"&url="+location.href;
	}
</script>

</head>
<body>

<div class="reviewBox">
     <h3 class="linkBox">오늘 신규 리뷰 <span class="badge">${todayReview}</span></h3>

     <table class="table">
         <tr>
             <th class="col-sm-1">번호</th>
             <th class="col-sm-4">내용</th>
             <th class="col-sm-2">이름</th>
             <th class="col-sm-1">평점</th>
             <th class="col-sm-2">작성일</th>
             <th class="col-sm-3"></th>
         </tr>
			
		<c:if test="${empty review_list}">
			<tr>
				<td colspan="6">아직 작성한 글이 없습니다.</td>
			</tr>
		</c:if>	
			
		<c:forEach var="rl" items="${review_list}" varStatus="i">	
         <tr>
             <td>${i.count}</td>
             <td><a href="cafe_detail.do?c_idx=${rl.c_idx}">${rl.r_cot}</a></td>
             <td>${rl.m_name}</td>
             <td>${rl.r_grade}</td>
             <td>${fn:substring(rl.r_regdate, 0, 10)}</td>
             <td>
             	 <button type="button" class="btn" onclick="review_update(${rl.r_idx});">수정</button>
                 <button type="button" class="btn" onclick="review_del(${rl.r_idx});">삭제</button>
             </td>
         </tr>
         </c:forEach>
     </table>

     <div class="a-btn"><a href="#" class="btn btn-default">더보기</a></div>
 </div>

</body>
</html>