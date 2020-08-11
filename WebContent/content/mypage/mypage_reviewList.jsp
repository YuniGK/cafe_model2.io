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
		let review_list_idx = r_idx;
		
		if (!confirm("삭제 하시겠습니까?"))			
			return;
		
		location.href = "mypage_review_delete.do?r_idx="+review_list_idx;
	}
</script>

</head>
<body>

<div class="reviewBox">
     <h3 class="linkBox">리뷰</h3>

     <table class="table">
         <tr>
             <th class="col-sm-1">번호</th>
             <th class="col-sm-4">내용</th>
             <th class="col-sm-1">평점</th>
             <th class="col-sm-2">작성일</th>
             <th class="col-sm-3"></th>
         </tr>
         
         <c:if test="${empty my_review}">
			<tr>
				<td colspan="6">아직 작성한 글이 없습니다.</td>
			</tr>
		</c:if>	
			
		<c:forEach var="my" items="${my_review}" varStatus="i">	
         <tr>
             <td>${i.count}</td>
             <td><a href="cafe_detail.do?c_idx=${my.c_idx}">${my.r_cot}</a></td>
             <td>${my.r_grade}</td>
             <td>${fn:substring(my.r_regdate, 0, 10)}</td>
             <td>
             	 <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/mypage_review_update_form.do?r_idx=${my.r_idx}'">수정</button>
                 <button type="button" class="btn" onclick="review_del(${my.r_idx});">삭제</button>
             </td>
         </tr>
         </c:forEach>
     </table>

     <div class="a-btn"><a href="#" class="btn btn-default">더보기</a></div>
 </div>

</body>
</html>