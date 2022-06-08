<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <style>
	.Top_container {display:none}
	.bottom_container {display:none}
	/*body{background-color: white}*/
	
	 body{
	 cursor: url("../img/cursor.cur"), auto;
     position:absolute;
     width:100%;
  	 height:100%;
 	 overflow: hidden;
  	 color: linear-gradient(
     to right,#fbcac9, #8ca6ce
  );
}
</style>
<div class="container">
       <ion-icon name="search-outline" class="slide-bar" id="slidebar">
        </ion-icon>
        <div class="text-block" id="textone">
            <h1>PetDoc</h1>
        </div>
        <div class="text-block" id="texttwo">
            <h1>동물병원찾기</h1>
        </div>
    </div>
    <!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
        		<img class="S_img1" src="/img/Map/M1.png">
        		<img class="S_img2" src="/img/Map/M2.png">
        		<img class="S_img3" src="/img/Map/M3.png">
        		<img class="S_img4" src="/img/Map/M4.png">
        	<div class="slide1">
        		<h1 style="margin-bottom:5vh;">병원 검색</h1>
        		<h4 style="margin-bottom:8vh;">사용자의 아이디에 저장된 주소를 기반으로 <br>주변 병원을 검색할 수 있습니다</h4>
        			<a href="/map" class="View_a">VIEW MORE <b class="View_a2">></b></a>
        	</div>
        </div>
        <div class="swiper-slide">
        		<img class="S_img1" src="/img/Noti/N1.png">
        		<img class="S_img2" src="/img/Noti/N2.png">
        		<img class="S_img3" src="/img/Noti/N3.png">
        		<img class="S_img4" src="/img/Noti/N4.png">
        	<div class="slide1">
        		<h1 style="margin-bottom:5vh;">공지사항</h1>
        		<h4 style="margin-bottom:8vh;">사이트를 이용하기 위한 수칙입니다<br>사용전 필수적으로 읽어주세요</h4>
        			<a href="/notice/noticeList" class="View_a">VIEW MORE <b class="View_a2">></b></a>
        	</div>
        </div>
        <div class="swiper-slide">
        		<img class="S_img1" src="/img/Board/B1.png">
        		<img class="S_img2" src="/img/Board/B2.png">
        		<img class="S_img3" src="/img/Board/B3.png">
        		<img class="S_img4" src="/img/Board/B4.png">
        	<div class="slide1">
        		<h1 style="margin-bottom:5vh;">자유게시판</h1>
        		<h4 style="margin-bottom:8vh;">사용자들끼리 자유롭게 소통할 수 있는 공간입니다.<br>주로 병원에 대한 후길를 남기는 곳입니다</h4>
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
    
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/gsap-latest-beta.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/CustomEase3.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/DrawSVGPlugin3.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/ScrambleTextPlugin3.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/SplitText3.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/MorphSVGPlugin3.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/CustomBounce3.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/CustomWiggle3.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/InertiaPlugin.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/Draggable3.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/EasePack3.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/Flip.min.js'></script><script  src="/js/script.js"></script>