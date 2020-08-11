<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
	<body>
	<div class="cafeCategroy">
	
        <div class="title">
            <h3># 어디로 가볼까?</h3>
        </div>
	
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/cafe_list.do?page_num=0">
                    <img src="${pageContext.request.contextPath}/img/category/all.png" class="img-rounded" alt="Cinque Terre">
                    <h3>이번주 베스트 </h3>
                </a>
            </li>
            
            <li>
                <a href="${pageContext.request.contextPath}/cafe_list.do?addrs=서울&page_num=0">
                    <img src="${pageContext.request.contextPath}/img/category/c_01.jpg" class="img-rounded" alt="Cinque Terre">
                    <h3>서울은 여기로</h3>
                </a>
            </li>
            
            <li>
                <a href="${pageContext.request.contextPath}/cafe_list.do?addrs=경기&page_num=0">
                    <img src="${pageContext.request.contextPath}/img/category/c_02.jpg" class="img-rounded" alt="Cinque Terre">
                    <h3>경기는 여기로</h3>
                </a>
            </li>
            
            <li>
                <a href="${pageContext.request.contextPath}/cafe_list.do?addrs=인천&page_num=0">
                    <img src="${pageContext.request.contextPath}/img/category/c_03.jpg" class="img-rounded" alt="Cinque Terre">
                    <h3>인천은 여기로</h3>
                </a>
            </li>
            
            <li>
                <a href="${pageContext.request.contextPath}/cafe_list.do?addrs=강원&page_num=0">
                    <img src="${pageContext.request.contextPath}/img/category/c_04.jpg" class="img-rounded" alt="Cinque Terre">
                    <h3>강원은 여기로</h3>
                </a>
            </li>
            
            <li>
                <a href="${pageContext.request.contextPath}/cafe_list.do?addrs=부산&page_num=0">
                    <img src="./img/category/c_05.jpg" class="img-rounded" alt="Cinque Terre">
                    <h3>부산은 여기로</h3>
                </a>
            </li>
        </ul>
			
    </div>	
    
	</body>
</html>