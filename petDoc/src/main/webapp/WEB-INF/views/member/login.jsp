<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/login.css" type="text/css"/>

<div class="login_box">
	<div class="login_img"><img id="login_img" src="/img/logo_1.png"/></div>
	<p id="login_alert">경고문 들어갈 곳</p>
	<form>
			<input type="text" name="user_id" id="login_id" class="input01" placeholder="아이디"/>
			<br/>
			<input type="password" name="user_pwd" id="login_pwd" class="input01" placeholder="비밀번호"/>
			<br/>
			<a href="/member/join"><small>회원가입</small></a> 
			<a href="#"><small>아이디/비밀번호찾기</small></a>
			<input type="button" id="login_btn" value="로그인"/>
	</form>
</div>


