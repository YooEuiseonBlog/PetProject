<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/user.css" type="text/css"/>
<script>
function delcon(){
	var del = confirm('탈퇴하시겠습니까?');
	if(del){
		location.href="/member/memberDelete";
	}else{
		return false;
	}
}
</script>
<div> 아이디 :
	<input type="text" class="input01" value="${vo.user_id}"disabled><br>
</div>
<div> 닉네임 : 
	<input type="text" class="input01" value="${vo.user_name}" disabled><br>
</div>
<div> 주소 :&nbsp &nbsp
	<input type="text" class="input01" value="${vo.user_addr}" disabled><br>
</div>

<div id="button_area">
<a href="/member/memberEdit"><button class="button_01">회원정보수정</button></a> <button class="button_01" onclick="delcon()">회원탈퇴</button>
</div>