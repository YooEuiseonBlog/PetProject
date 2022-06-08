<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/join.css" type="text/css"/>
<script>
//아이디 중복검사
function idCheckInit(){
	var error = document.querySelectorAll('.error_alert');
	error[0].style.display = "none";
	if($("#idCheckResult").val()=="1") {
		$("#idCheckResult").val("0");
	}
}
function idCheck(){
	var error = document.querySelectorAll('.error_alert');
	var reg = /^[a-z0-9]{5,20}$/;
	var url = '/member/idCheck';
	$.ajax({
		type: 'get',
		dataType: 'text',
		url: url,
		data: {
			'id':$("#user_id").val()
		},
		success: function(result){
			
			if($("#user_id").val()==''){
				error[0].innerHTML = "아이디를 입력해주세요.";
				error[0].style.display = "block";
				error[0].style.color = "red";
				$("#user_id").focus();
			}else if(!reg.test($("#user_id").val())){
				error[0].innerHTML = "5~20자의 영문 소문자, 숫자만 사용 가능합니다."
			   	error[0].style.display = "block";
				error[0].style.color = "red";
			    $("#user_id").focus();
			}else if(result>=1){
				error[0].innerHTML = "중복된 아이디입니다.";
				error[0].style.display = "block";
				error[0].style.color = "red";
				$("#idCheckResult").val("0");
			}else{
				if(!$("#user_id").val()==''){
					error[0].innerHTML = "사용가능한 아이디입니다.";
					error[0].style.display = "block";
					error[0].style.color = "green";
					$("#idCheckResult").val("1");
				}
			}
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
}

// 닉네임 중복검사
function nameCheckInit(){
	var error = document.querySelectorAll('.error_alert');
	error[3].style.display = "none";
	if($("#nameCheckResult").val()=="1") {
		$("#nameCheckResult").val("0");
	}
}
function nameCheck(){
	var error = document.querySelectorAll('.error_alert');
	var reg = /^[가-힣a-zA-Z0-9]{2,16}$/;
	var url = '/member/nameCheck';
	$.ajax({
		type: 'get',
		dataType: 'text',
		url: url,
		data: {
			'name':$("#user_name").val()
		},
		success: function(result){
			if($("#user_name").val()==''){
				error[3].innerHTML = "닉네임을 입력해주세요.";
				error[3].style.display = "block";
				error[3].style.color = "red";
				$("#user_name").focus();
			}else if(!reg.test($("#user_name").val())){
				error[3].innerHTML = "2~16자 한글과 영문 대 소문자를 사용하세요.";
				error[3].style.display = "block";
				error[3].style.color = "red";
				$("#user_name").focus();
			}else if(result>=1){
				error[3].innerHTML = "중복된 닉네임 입니다.";
				error[3].style.display = "block";
				error[3].style.color = "red";
				$("#nameCheckResult").val("0");
			}else{
				if(!$("#user_name").val()==''){
					error[3].innerHTML = "사용가능한 닉네임입니다.";
					error[3].style.display = "block";
					error[3].style.color = "green";
					$("#nameCheckResult").val("1");
				}
			}
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
}

//유효성 검사
$(()=>{
	
	var error = document.querySelectorAll('.error_alert');
	$("#join_frm").submit(function(){
		//아이디 유효성검사
		var reg = /^[a-z0-9]{5,20}$/;
		if($("#user_id").val()==''){
			error[0].innerHTML = "아이디를 입력하세요.";
			error[0].style.display = "block";
			error[0].style.color = "red";
			$("#user_id").focus();
			return false;
		}else if(!reg.test($("#user_id").val())){
			error[0].innerHTML = "5~20자의 영문 소문자, 숫자만 사용 가능합니다."
		   	error[0].style.display = "block";
			error[0].style.color = "red";
		    $("#userid").focus();
		    return false;
		}else{
			error[0].style.display = "none";
		}
		
		if($("#idCheckResult").val()=="0"){
			alert("아이디 중복검사를 해주세요.");
			return false;
		}
		// 비밀번호 유효성검사
		reg = /^[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}$/;
		if($("#user_pwd").val()==''){
			error[1].innerHTML = "비밀번호를 입력하세요.";
	        error[1].style.display = "block";
	        error[1].style.color = "red";
	        $("#user_pwd").focus();
	        return false;
		}else if(!reg.test($("#user_pwd").val())){
			error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
			error[1].style.display = "block";
			error[1].style.color = "red";
	        $("#user_pwd").focus();
	        return false;
		}else{
			error[1].style.display = "none";
		}
		
		// 비밀번호 확인 유효성검사
		if($("#user_pwd").val() != $("#user_pwdchk").val()){
			error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
			error[2].style.display = "block";
			error[2].style.color = "red";
			return false;
		}else{
			error[2].style.display = "none";
		}
		
		// 닉네임 유효성검사
		reg = /^[가-힣a-zA-Z0-9]{2,16}$/;
		if($("#user_name").val()==''){
			error[3].innerHTML = "닉네임을 입력하세요.";
			error[3].style.display = "block";
			error[3].style.color = "red";
			$("#user_name").focus();
			return false;
		}else if(!reg.test($("#user_name").val())){
			error[3].innerHTML = "2~16자 한글과 영문 대 소문자를 사용하세요.";
			error[3].style.display = "block";
			error[3].style.color = "red";
			$("#user_name").focus();
			return false;
		} else{
			error[3].style.display = "none";
		}
		
		if($("#nameCheckResult").val()=="0"){
			alert("닉네임 중복검사를 해주세요.");
			return false;
		}
		
		// 주소 유효 검사
		if($("#address").val()==''){
			error[4].innerHTML = "주소를 확인해주세요.";
	        error[4].style.display = "block";
	        error[4].style.color = "red";
	        return false;
		}else{
			error[4].style.display = "none";
		}
		
		return true;
	})
})
</script>

<div class="join_container">
	<form id="join_frm" method="post" action="/member/joinUpOk">
		<div class="join_page" id="page1">
		<br>
		<h2>회원 가입</h2>
		<br>
			<div class="input_box">
			<input type="text" name="user_id" id="user_id" class="input02" onkeyup="idCheckInit()" placeholder="아이디 입력"/>
			<input type="button" onclick="idCheck()" class="button03" value="중복 검사">
			<input type="hidden" id="idCheckResult" value="0"/>
			<p class="error_alert"></p>
			</div>
			<div class="input_box">
			<input type="password" name="user_pwd" id="user_pwd" class="input02" placeholder="비밀번호 입력"/>
			<p class="error_alert"></p>
			</div>
			
			<div class="input_box">
			<input type="password" id="user_pwdchk" class="input02" placeholder="비밀번호 확인"/>
			<p class="error_alert"></p>
			</div>
			<div class="input_box">
			<input type="text" name="user_name" id="user_name" class="input02" onkeyup="nameCheckInit()" placeholder="닉네임 입력"/>
			<input type="button" onclick="nameCheck()" class="button03" value="중복 검사">
			<input type="hidden" id="nameCheckResult" value="0"/>
			<p class="error_alert"></p>
			</div>
			
			<div class="input_box2">
				<input type="text" id="postcode" class="input02" placeholder="우편번호" disabled>
				<input type="button" onclick="execDaumPostcode()" class="button03" value="우편번호 찾기"><br>
				<input type="text" id="address" class="input03" name="user_addr" placeholder="주소">
				<input type="text" id="detailAddress" class="input03" placeholder="상세주소"><br>
				<input type="text" id="extraAddress" class="input02" placeholder="참고항목" disabled>
				<p class="error_alert"></p>
			</div>
			
			<input type="hidden" id="user_img" name="user_img" value="logo_1.png"/>
			
			<input type="submit" class="button04" value="등록"/>
			
		</div>
		<img src="/img/center.png" id="page_center1"/>
		<img src="/img/center.png" id="page_center2"/>
		<div class="join_page" id="page2">
			<div id="addr_wrap">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" onclick="foldDaumPostcode()" alt="접기 버튼">
			</div>
		</div>
	</form>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('addr_wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height: '100%',
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }    
</script>