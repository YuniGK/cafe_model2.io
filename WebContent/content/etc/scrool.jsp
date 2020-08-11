<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="scroll">
	<a class="up-btn">
    	<span class="glyphicon glyphicon-arrow-up"></span>
  	</a>
  	
  	<a class="bottom-btn">
    	<span class="glyphicon glyphicon-arrow-down"></span>
  	</a>
</div>

<script>
   $(function() {
       $(window).scroll(function() {
           if ($(this).scrollTop() > 500) {
               $('.scroll').fadeIn();
           } else {
               $('.scroll').fadeOut();
           }
       });
       
       $(".up-btn").click(function() {
           $('html, body').animate({
               scrollTop : 0
           }, 400);
           return false;
       });
       
       $(".bottom-btn").click(function() {
           $('html, body').animate({
               scrollTop : $(document).height()
           }, 400);
           return false;
       });
   });
</script>

</body>
</html>