<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function cafe_del(c_idx) {
		let admin_cafe_list_idx = c_idx;
		
		if (!confirm("삭제 하시겠습니까?"))			
			return;
		
		location.href = "mypage_cafe_delete.do?c_idx="+admin_cafe_list_idx;
	}
	
	/*
	cafe_moreList();
	
	function cafe_moreList() {
		$.ajax({
			
			url : "myPageCafeList.do",
			type : "post",
			dataType : "json",
			data : {"num" : 5},
			success : function(res_data){
				if (res_data.length < 5) {
					$(".cafeBox .a-btn .btn").remve();
				}else{
					var addListHtml = "";
					
					if (res_data.lenght > 0) {
						for (var i = 0; i < res_data.length; i++) {
							var idx = Number(5)+Number(i)+1;
							
							addListHtml += "<tr>";
							addListHtml += "<td>"+i+"</td>";
							addListHtml += "<td><a href=${pageContext.request.contextPath}/hit_insert.do?c_idx="+cafeList[i].c_idx+">"+cafeList[i].c_name+"</a></td>";
							addListHtml += "<td><a href=${pageContext.request.contextPath}/hit_insert.do?c_idx="+cafeList[i].c_idx+">"+cafeList[i].c_addr+"</a></td>";
							addListHtml += "<td><div class='btn-group'><a class='btn btn-default' href=${pageContext.request.contextPath}/cafe_updateForm.do?c_idx="+cafeList[i].c_idx+">수정</a><input type='button' class='btn btn-default' value='삭제' onclick='cafe_del("+cafeList[i].c_idx+");'></div></td>";
							addListHtml += "</tr>";
							
						}
					}
					
				}
			}//success
			
		});
	}
	*/
	
</script>

</head>
<body>

<div class="cafeBox">
    <h3 class="linkBox">카페 목록</h3>

	    <table class="table">
	        <tr>
	            <th class="col-sm-1">번호</th>
	            <th class="col-sm-3">카페명</th>
	            <th class="col-sm-5">주소</th>
	            <th class="col-sm-3"></th>
	        </tr>
			
			<c:if test="">
				<tr>
					<td colspan="1">아직 등록된 글이 없습니다.</td>
				</tr>
			</c:if>
	
	        <c:forEach items="${cafe_list}" var="cl" varStatus="i">
	        	<tr>
		            <td>${i.count}</td>
		            <td><a href="${pageContext.request.contextPath}/hit_insert.do?c_idx=${cl.c_idx}">${cl.c_name}</a></td>
		            <td><a href="${pageContext.request.contextPath}/hit_insert.do?c_idx=${cl.c_idx}">${cl.c_addr}</a></td>
		            <td>
		                <div class="btn-group">
		                    <input type="button" class="btn btn-default" value="수정" onclick="location.href='${pageContext.request.contextPath}/cafe_updateForm.do?c_idx=${cl.c_idx}'">
		                    <input type="button" class="btn btn-default" value="삭제" onclick="cafe_del(${cl.c_idx});">
		                </div>
		            </td>
		        </tr>
	        </c:forEach>
	    </table>
	</div>

    <div class="a-btn">
    	<input type="button" class="btn btn-default" onclick="cafe_moreList();" value="더보기">
   	</div>

</body>
</html>