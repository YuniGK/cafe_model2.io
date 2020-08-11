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

<!-- masonry js -->
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

</head>
<body>
	<div class="cafeList">
		<div class="title"><h3>CAFE가 모였다</h3></div>
			
		<div class="list">
			<ul>
			
				<c:forEach items="${main_cafe_list}" var="mcl">
				<li>
					<a href="${pageContext.request.contextPath}/hit_insert.do?c_idx=${mcl.c_idx}" class="imgBox">
						<img src="${pageContext.request.contextPath}/upload/${mcl.c_photo}">
					</a>
					
					<h5>
						<a href="${pageContext.request.contextPath}/hit_insert.do?c_idx=${mcl.c_idx}">
							${mcl.c_name}
						</a>
					</h5>
					<p>${fn:substring(mcl.c_addr, 6, -1)}</p>
				</li>
				</c:forEach>
				
			</ul>
		</div>

		<div class="more">
			<div class="a-btn"><a href="${pageContext.request.contextPath}/cafe_list.do" class="btn btn-default">더보기</a></div>
		</div>
	</div>
		
	<script type="text/javascript">
		$('.cafeList .list ul').masonry({
		    // set itemSelector so .grid-sizer is not used in layout
		    itemSelector: '.cafeList .list ul li',
		    // use element for option
		    columnWidth: '.cafeList .list ul li',
		    percentPosition: true
		})
	</script>	
		
	</body>
</html>