<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Document</title>
    
  <style type="text/css">
  	.inner-in{width: 800px !important; margin: 0 auto;}
  </style>  
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

    <header>
    	<%@ include file="../header/header.jsp" %>
    </header>

    <div id="content" >
    	<div class="jumbotron" id="main_text">
		    <h2>우리동네 #${param.c_tag} 카페</h2>      
		 </div>
		  
		<div class="inner-in">
			
			<div class="cafe_list">
				
			<div class="listBox">
				<ul class="list">
					<c:forEach items="${tag_cafe_list}" var="pcl" varStatus="i">
						<li>
							<div class="cafeListBox">
							    <div class="cafeInfoImg">
							      	<a href="${pageContext.request.contextPath}/hit_insert.do?c_idx=${pcl.c_idx}">
							      		<img src="${pageContext.request.contextPath}/upload/${pcl.c_photo}">
						      		</a>
							    </div>
							    <div class="cafeInfoBox">
							      <h4 class="cafeInfoTitle">${i.count}. ${pcl.c_name} ${pcl.r_one.avg}</h4>
							      
							      <c:if test="${pcl.r_one.r_cot eq ''}">
							      	<h3>Best review!</h3>
							      </c:if>
							      <h4>${pcl.r_one.r_cot}</h4>
							      
							      <a href="${pageContext.request.contextPath}/hit_insert.do?c_idx=${pcl.c_idx}" id="more">more</a>
							    </div>
						  </div>
						</li>
					</c:forEach>					
				</ul>
			</div>
	
			<div class="pageBox">
		        <ul class="pagination">
		            <li><a href="#">1</a></li>
		            <li><a href="#">2</a></li>
		            <li><a href="#">3</a></li>
		            <li><a href="#">4</a></li>
		            <li><a href="#">5</a></li>
		        </ul>
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