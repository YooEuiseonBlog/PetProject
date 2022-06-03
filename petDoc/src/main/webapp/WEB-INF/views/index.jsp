<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <style>
	.Top_container {display:none}
	.bottom_container {display:none}
	/*body{background-color: white}*/
</style>
    <!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
        		<img class="S_img1" src="/img/logo_1.png">
        		<img class="S_img2" src="/img/logo_1.png">
        		<img class="S_img3" src="/img/logo_1.png">
        		<img class="S_img4" src="/img/logo_1.png">
        	<div class="slide1">
        		<h1 style="margin-bottom:5vh;">병원 검색</h1>
        		<h4 style="margin-bottom:8vh;">주변의 병원 을 검색해보세요!</h4>
        			<a href="/map" class="View_a">VIEW MORE <b class="View_a2">></b></a>
        	</div>
        </div>
        <div class="swiper-slide">
        		<img class="S_img1" src="/img/logo_1.png">
        		<img class="S_img2" src="/img/logo_1.png">
        		<img class="S_img3" src="/img/logo_1.png">
        		<img class="S_img4" src="/img/logo_1.png">
        	<div class="slide1">
        		<h1 style="margin-bottom:5vh;">공지사항</h1>
        		<h4 style="margin-bottom:8vh;">사이트를 이용하기 위한 수칙입니다</h4>
        			<a href="#" class="View_a">VIEW MORE <b class="View_a2">></b></a>
        	</div>
        </div>
        <div class="swiper-slide">
        		<img class="S_img1" src="/img/logo_1.png">
        		<img class="S_img2" src="/img/logo_1.png">
        		<img class="S_img3" src="/img/logo_1.png">
        		<img class="S_img4" src="/img/logo_1.png">
        	<div class="slide1">
        		<h1 style="margin-bottom:5vh;">자유게시판</h1>
        		<h4 style="margin-bottom:8vh;">사용자들끼리 자유롭게 소통할 수 있는 공간입니다</h4>
        			<a href="#" class="View_a">VIEW MORE <b class="View_a2">></b></a>
        	</div>
        </div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        centeredSlides: true,
        //autoplay: {
         // delay: 5500,
          //disableOnInteraction: false,
       // },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });

    </script>