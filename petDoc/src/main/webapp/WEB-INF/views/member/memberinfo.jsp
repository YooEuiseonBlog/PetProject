<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/memberinfo.css" type="text/css"/>
<script>
$(document).ready(function(){
	$("#UserInfo").click(function(){ 
		$("#info_Area>div").css('display','none');
		$("#UserInfoShow").css('display','block');
	 });
	$("#UserBoard").click(function(){ 
		$("#info_Area>div").css('display','none');
		$("#UserBoardShow").css('display','block');
	 });
	$("#UserReply").click(function(){ 
		$("#info_Area>div").css('display','none');
		$("#UserReplyShow").css('display','block');
	 });
});
</script>

<div class="info_container">
			<div class="info_button">
			 	<button id="UserInfo" class="info_button1">회원정보</button>
			 	<button id="UserBoard" class="info_button1">내가 쓴 글</button>
			 	<button id="UserReply" class="info_button1">내가 단 댓글</button>
			</div>
			<hr>
			<div id="info">
				<div id="info_Area">
					<div id="UserInfoShow"><%@ include file="/WEB-INF/views/member/userInfo.jsp" %></div>
					<div id="UserBoardShow"><%@ include file="/WEB-INF/views/member/userBoard.jsp" %></div>
					<div id="UserReplyShow"><%@ include file="/WEB-INF/views/member/userReply.jsp" %></div>
				</div>
				<div id="info_Area2">
					<img src="/upload/${vo.user_img}"/>
				</div>
			</div>
</div>
