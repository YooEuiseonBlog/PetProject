<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/join.css" type="text/css"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="join_container">
	<form>
		<div class="join_page" id="page1">
		<h2>회원 가입</h2>
			<div class="input_box">
			<input type="text" name="user_id" id="user_id" class="input02" placeholder="아이디 입력"/>
			<p id="alert_1"></p>
			</div>
			<div class="input_box">
			<input type="password" name="user_pwd" id="user_pwd" class="input02" placeholder="비밀번호 입력"/>
			</div>
			<p id="alert_2"></p>
			<div class="input_box">
			<input type="password" id="user_pwdchk" class="input02" placeholder="비밀번호 확인"/>
			<p id="alert_3"></p>
			</div>
			<div class="input_box">
			<input type="text" name="user_name" id="user_name" class="input02"placeholder="닉네임 입력"/>
			<p id="alert_4"></p>
			</div>
			
			<div class="input_box">
			<input type="text" id="sample4_postcode" placeholder="우편번호">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소" size="60" ><br>
			<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" placeholder="상세주소"  size="60"><br>
			<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
			<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br>
			</div>
			
		</div>
		<div class="join_page" id="page2">
		
		</div>
	</form>
</div>

<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script>