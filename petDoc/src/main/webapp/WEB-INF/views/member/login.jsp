<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/login.css" type="text/css"/>

<script type="text/javascript">
	$(function() {
	    cookieCheck();
	});
	
	function formInit(){
		var alert_msg = document.getElementById("login_alert");
		alert_msg.innerHTML = "&nbsp";
	}
	function formcheck() {
		var userid = document.getElementById("login_id");
		var alert_msg = document.getElementById("login_alert");
		if (userid.value == "") {
			alert_msg.innerHTML = "아이디 입력이 필요합니다.";
			alert_msg.style.display = "block";
			alert_msg.style.color = "red";
			userid.focus();
			return false;
		}
		
		var userpwd = document.getElementById("login_pwd");
		if (userpwd.value == "") {
			alert_msg.innerHTML = "비밀번호 입력이 필요합니다.";
			alert_msg.style.display = "block";
			alert_msg.style.color = "red";
			userpwd.focus();
			return false;
		}
		saveid();
		return true;
		
	}
	function saveid(){
		//체크박스가 체크상태일 때 쿠키를 저장
		if(document.getElementById("rememberId").checked){//체크값이 true인경우
			//변수=값;path=/;expires=날짜;
			var now = new Date();
			now.setDate(now.getDate()+365);
			var cookieData = "login_id="+user_id.value+";path=/;expires="+now+";";
			document.cookie =cookieData;
			document.cookie = "rememberId=on;path=/;expires="+now+";";
		}else{
			var now = new Date();
			now.setDate(now.getDate()-365);
			var cookieData = "login_id="+user_id.value+";path=/;expires="+now+";";
			document.cookie =cookieData;
			document.cookie = "rememberId=on;path=/;expires="+now+";";
		}
	}
	function cookieCheck(){
		var cookieid = getCookie("#login_id");
        if(cookieid !=""){
        	$("input:checkbox[id='rememberId']").prop("checked", true);
            $('#login_id').val(cookieid);
        }
	}
	
    function getCookie(Name) {
        var search = Name + "=";
        
        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
            offset = document.cookie.indexOf(search);
            if (offset != -1) { // 쿠키가 존재하면 
                offset += search.length;
                end = document.cookie.indexOf(";", offset);
                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                if (end == -1){
                	end = document.cookie.length;
                }  
                return unescape(document.cookie.substring(offset, end));
            }
        }
        return "";
    }
</script>

<div class="login_box">
	<div class="login_img"><img id="login_img" src="/img/logo_1.png"/></div>
	<p id="login_alert"></p>
	<form id="login_form" method="post" action="${url}/member/loginOk" onsubmit="return formcheck()">
			<input type="text" name="user_id" id="login_id" class="input01" onkeyup="formInit()" placeholder="아이디"/>
			<br/>
			<input type="password" name="user_pwd" id="login_pwd" class="input01" onkeyup="formInit()" placeholder="비밀번호"/>
			<br/>
			<div id="saveid">
				<input type="checkbox" value="rememberId" id="rememberId"/> 
				<label id="rememberId2"> 아이디 저장</label>
			</div>
			<br>
			<a href="/member/join"><small>회원가입</small></a> 
			<a href="#"><small>아이디/비밀번호찾기</small></a>
			<input type="submit" id="login_btn" value="로그인"/>
	</form>
</div>


