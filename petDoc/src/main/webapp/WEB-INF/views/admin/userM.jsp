<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/admin.css" type="text/css"/>

<div class="container">
	<div class="Menu_Bar_A">
		<h1 class="Menu_title">회원관리</h1>
	</div>
	<div class="Menu_container">
		<ul class="List_menu_U" id="List_menu_U">
			<li>아이디</li>
			<li>닉네임</li>
			<li>주소</li>
			<li>등급</li>
			<li>비고</li>

		</ul><!-- 게시물 -->
		
		 <div class="pagingU">
           <b id="prevViewU">  </b>
           <b id="pViewU"></b>
           <b id="nextViewU" > > </b>
            
        </div>
    
		<br/><br/><br/>
		<div class="Share_searchU">
			 <form action="/admin/userSearch?type=user" id="searchFrmU">
				<select name="searchKey" id="SKey">
					<option value="title">아이디</option>
					<option value="content">닉네임</option>
				</select>
				<input type="text" name="searchWord" id="searchWordU"/>
				<input type="submit" value="검색"/>
			</form>
		</div>
	</div>
</div>

<script>

$("#searchFrmU").submit(function() {
   if ($("#searchWordU").val() == "") {
      alert("검색어를 입력하세요");
      return false;
   }
   
});
	
$(document).ready(function(){
		var startNum = 0; 
		var addListHtmlU = "";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'))
		if(pn=='userSearch'){
			url = '/admin/noticeSearchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn=='admininfo'){
			url = '/admin/userList';
			param = {
				"startNum" : startNum 
			};
		}else if(pn2 =='Search'){
			url = '/admin/userList';
			param = {
				"startNum" : startNum 
			};
		}
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){			
				for (var i = 0; i < data.length; i++) {
					addListHtmlU += "<li>"+data[i].user_id+"</li>";
					addListHtmlU += "<li>"+data[i].user_name+"</li>";
					addListHtmlU += "<li>"+data[i].user_addr+"</li>";
					if(data[i].user_level==1){
					addListHtmlU += "<li>관리자</li>";
					}else if(data[i].user_level==2){
					addListHtmlU += "<li>정지</li>";
					}else{
					addListHtmlU += "<li>일반</li>";
					}
					addListHtmlU += "<li><a href='' class='modiB'>수정</a> <a href='' class='delB'>탈퇴</a></li>";
				}
				if(data.length<8){
					$("#nextViewU").empty();
				} 
				if(startNum=1){
					$("#prevViewU").empty();
				} 
				$("#List_menu_U").append(addListHtmlU);
				$("#pViewU").append(startNum);
			}
		});
});

$('#nextViewU').click(function(){
		var startNum = parseInt($("#pViewU").text());
		var addListHtmlU = "";
					addListHtmlU += "<li>아이디</li>";
					addListHtmlU += "<li>닉네임</li>";
					addListHtmlU += "<li>주소</li>";
					addListHtmlU += "<li>등급</li>";
					addListHtmlU += "<li>비고</li>";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'))
		if(pn=='userSearch'){
			url = '/admin/noticeSearchLists';
			param = {
				"startNum" : startNum*8 ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn=='admininfo'){
			url = '/admin/userList';
			param = {
				"startNum" : startNum*8
			};
		}else if(pn2 =='Search'){
			url = '/admin/userList';
			param = {
				"startNum" : startNum*8
			};
		}
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					addListHtmlU += "<li>"+data[i].user_id+"</li>";
					addListHtmlU += "<li>"+data[i].user_name+"</li>";
					addListHtmlU += "<li>"+data[i].user_addr+"</li>";
					if(data[i].user_level==1){
					addListHtmlU += "<li>관리자</li>";
					}else if(data[i].user_level==2){
					addListHtmlU += "<li>정지</li>";
					}else{
					addListHtmlU += "<li>일반</li>";
					}
					addListHtmlU += "<li><a href='' class='modiB'>수정</a> <a href='' class='delB'>탈퇴</a></li>";
				}
				if(data.length<8){
					$("#nextViewU").empty();
				} 
				$("#prevViewU").empty();
				$("#List_menu_U").empty();
				$("#List_menu_U").append(addListHtmlU);
				$("#pViewU").empty();
				$("#pViewU").append(startNum+1);
				$("#prevViewU").append("<");
			}
		});
	   
		
	});
	
$('#prevViewU').click(function(){
	var startNum = parseInt($("#pViewU").text()); // 시작지점
	var addListHtmlU = "";
					addListHtmlU += "<li>아이디</li>";
					addListHtmlU += "<li>닉네임</li>";
					addListHtmlU += "<li>주소</li>";
					addListHtmlU += "<li>등급</li>";
					addListHtmlU += "<li>비고</li>";
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWord');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	var pn2 = pn.substring(pn.lastIndexOf('Search'))
	if(pn=='userSearch'){
		url = '/admin/noticeSearchLists';
		param = {
			"startNum" : (startNum-1)*8-8 ,
			"searchKey" : key,
			"searchWord" : word
		};
	}else if(pn=='admininfo'){
		url = '/admin/userList';
		param = {
			"startNum" : (startNum-1)*8-8
		};
	}else if(pn2 =='Search'){
		url = '/admin/userList';
		param = {
			"startNum" : (startNum-1)*8-8
		};
	}
	$.ajax({
		url : url,
		type : 'POST',
		dataType : 'json',
		data :param,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtmlU += "<li>"+data[i].user_id+"</li>";
				addListHtmlU += "<li>"+data[i].user_name+"</li>";
				addListHtmlU += "<li>"+data[i].user_addr+"</li>";
				if(data[i].user_level==1){
				addListHtmlU += "<li>관리자</li>";
				}else if(data[i].user_level==2){
				addListHtmlU += "<li>정지</li>";
				}else{
				addListHtmlU += "<li>일반</li>";
				}
				addListHtmlU += "<li><a href='' class='modiB'>수정</a> <a href='' class='delB'>탈퇴</a></li>";
			}
			$("#nextViewU").empty();
			$("#nextViewU").append(">");
			$("#List_menu_U").empty();
			$("#List_menu_U").append(addListHtmlU);
			$("#pViewU").empty();
			$("#pViewU").append(startNum-1);
			
			if(parseInt($("#pViewU").text())==1){
				$("#prevViewU").empty();
			} 
		}
	});
});
</script>