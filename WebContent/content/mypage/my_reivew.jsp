<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Document</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		function review_del(r_idx) {
			let admin_review_list_idx = r_idx;
			
			if (!confirm("삭제 하시겠습니까?"))			
				return;
			
			location.href = "mypage_review_delete.do?r_idx="+admin_review_list_idx;
		}
	</script>
</head>

<body>

    <header>
    	<%@ include file="../header/header.jsp" %>
    </header>

    <div class="bgBox">
        <div class="bg"></div>
    </div>

    <section id="content">
        <div class="topMypage jumbotron">
            <div class="inner">
                <h2>MyPage</h2>

                <div class="imgBox">
                    <div class="row">
                        <a href="" class="col-sm-3">
                            <img src="${pageContext.request.contextPath}/upload/${user.m_photo}" class="img-circle" alt="프로필 이미지">
                        </a>
                        <div class="textBox col-sm-9">
                            <h3>Hello ${user.m_name}</h3>
		
                            <div class="linkBox">
                                <a href="${pageContext.request.contextPath}/my_write.do?m_idx=${user.m_idx}">내가 쓴 글 <span class="badge">${myReview}</span></a>
                                <a href="${pageContext.request.contextPath}/member_updateForm.do?m_idx=${user.m_idx}">회원정보 수정</a> 
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        
        
        <div class="bottomMypage">
            <div class="inner">
				
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
										
            </div>
        </div>
        
        
        <%@ include file="../etc/scrool.jsp" %>
    </section>

    <footer>
    	<%@ include file="../footer/footer.jsp" %>
    </footer>

</body>

</html>