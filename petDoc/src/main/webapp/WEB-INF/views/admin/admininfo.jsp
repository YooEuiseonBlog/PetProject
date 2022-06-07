<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admininfo.css" type="text/css"/>
<script>
$(document).ready(function(){
	
	switch('${type}'){
	case 'notice' : 
			  $("#noticeBoardShow").css('display','block');
			  break;
	case 'board' : 
		  	  $("#BoardMShow").css('display','block');
			  break;
	case 'user' : 
			 $("#userMShow").css('display','block');
			  break;
	}
	
	$("#noticeBoard").click(function(){ 
		$("#info_Area>div").css('display','none');
		$("#noticeBoardShow").css('display','block');
	 });
	$("#BoardM").click(function(){ 
		$("#info_Area>div").css('display','none');
		$("#BoardMShow").css('display','block');
	 });
	$("#userM").click(function(){ 
		$("#info_Area>div").css('display','none');
		$("#userMShow").css('display','block');
	 });
});
</script>

<div class="info_container">
			<div id="info_Area2">
						<img src="/img/logo_1.png"/>
			</div>
			<div>
				<div class="info_button">
				 	<button id="noticeBoard" class="info_button1">공지사항</button>
				 	<button id="BoardM" class="info_button1">작성글 관리</button>
				 	<button id="userM" class="info_button1">회원관리</button>
				</div>
				<hr>
				<div id="info">
					<div id="info_Area">
						<div id="noticeBoardShow"><%@ include file="/WEB-INF/views/admin/noticeBoard.jsp" %></div>
						<div id="BoardMShow"><%@ include file="/WEB-INF/views/admin/BoardM.jsp" %></div>
						<div id="userMShow"><%@ include file="/WEB-INF/views/admin/userM.jsp" %></div>
					</div>
				</div>
			</div>
</div>
