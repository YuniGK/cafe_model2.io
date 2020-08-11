<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 슬라이드 css -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">	
<style type="text/css">
  	.swiper-container {
      width: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    
    .swiper-slide img{width: 100%;}
  </style> 
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  
</head>

<body>
  
    <div class="cafe_imgBox swiper-container">
   		<ul class="swiper-wrapper">
   			<li class="swiper-slide">
   				<img alt="cafe 이미지" src="img/mainSlider/01.jpg">
   			</li>
   			<li class="swiper-slide">
   				<img alt="cafe 이미지" src="img/mainSlider/02.jpg">
   			</li>
   			<li class="swiper-slide">
   				<img alt="cafe 이미지" src="img/mainSlider/03.jpg">
   			</li>
   			<li class="swiper-slide">
   				<img alt="cafe 이미지" src="img/mainSlider/04.jpg">
   			</li>
   			<li class="swiper-slide">
   				<img alt="cafe 이미지" src="img/mainSlider/05.jpg">
   			</li>
   		</ul>
   	</div>
    	
    <script>
			
		//슬라이드 ==================================================================
	    var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 1,
	      loop: true,
	      mousewheel: true,
	      autoplay: {
	          delay: 2500,
	          disableOnInteraction: false,
	        },
	    });
		
	</script>	
    	
</body>
</html>