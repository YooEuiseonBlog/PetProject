<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/admin.css" type="text/css"/>

<div class="containerN">
	<div class="Menu_Bar_A">
		<h1 class="Menu_title">공지사항</h1>
	</div>
	<div class="Menu_container">
		<ul class="List_menu_F" id="List_menu_F">
			<li>번호</li>
			<li>제목</li>
			<li>작성일</li>
			<li>조회</li>
			<li>비고</li>

		</ul><!-- 게시물 -->
		
		 <div class="paging">
           <b id="prevView">  </b>
           <b id="pView"></b>
           <b id="nextView" > > </b>
            
        </div>
    
		<br/><br/><br/>
		<div class="Share_search">
			 <form action="/admin/noticeSearch?type=notice" id="searchFrm">
				<select name="searchKey" id="SKey">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="hidden" name="type" value="notice"/>
				<input type="submit" value="검색"/>
			</form>
		</div>
	</div>
	<a href="/notice/noticeWrite" class="info_button2">공지사항 등록</a>
</div>

<script>

$("#searchFrm").submit(function() {
   if ($("#searchWord").val() == "") {
      alert("검색어를 입력하세요");
      return false;
   }
   
});
	
$(document).ready(function(){
		var startNum = 0; 
		var addListHtml = "";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'))
		if(pn=='noticeSearch'){
			url = '/admin/noticeSearchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn=='admininfo'){
			url = '/admin/noticeList';
			param = {
				"startNum" : startNum 
			};
		}else if(pn2 =='Search'){
			url = '/admin/noticeList';
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
					addListHtml += "<li>"+data[i].board_num+"</li>";
					addListHtml += "<li><a href='#"+data[i].board_num+"' style='color:black;'>"+data[i].title;
					addListHtml += "</a></li>";
					addListHtml += "<li>"+data[i].writedate+"</li>";
					addListHtml += "<li>"+data[i].hit+"</li>";
					addListHtml += "<li><a href='' class='modiB'>수정</a> <a href='/board/boardDelete?board_num="+data[i].board_num+"' class='delB'>삭제</a></li>";
				}
				if(data.length<8){
					$("#nextView").empty();
				} 
				if(startNum=1){
					$("#prevView").empty();
				} 
				$("#List_menu_F").append(addListHtml);
				$("#pView").append(startNum);
			}
		});
});

$('#nextView').click(function(){
		var startNum = parseInt($("#pView").text());
		var addListHtml = "";
		var addListHtmlpo = "";
					addListHtmlpo += "<li>번호</li>";
					addListHtmlpo += "<li>제목</li>";
					addListHtmlpo += "<li>작성일</li>";
					addListHtmlpo += "<li>조회</li>";
					addListHtmlpo += "<li>비고</li>";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'))
		if(pn=='noticeSearch'){
			url = '/admin/noticeSearchLists';
			param = {
				"startNum" : startNum*8 ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn=='admininfo'){
			url = '/admin/noticeList';
			param = {
				"startNum" : startNum*8
			};
		}else if(pn2 =='Search'){
			url = '/admin/noticeList';
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
					addListHtml += "<li>"+data[i].board_num+"</li>";
					addListHtml += "<li><a href='#"+data[i].board_num+"' style='color:black;'>"+data[i].title;
					addListHtml += "</a></li>";
					addListHtml += "<li>"+data[i].writedate+"</li>";
					addListHtml += "<li>"+data[i].hit+"</li>";
					addListHtml += "<li><a href='' class='modiB'>수정</a> <a href='/board/boardDelete?board_num="+data[i].board_num+"' class='delB'>삭제</a></li>";
				}
				if(data.length<8){
					$("#nextView").empty();
				} 
				$("#prevView").empty();
				$("#List_menu_F").empty();
				$("#List_menu_F").append(addListHtmlpo);
				$("#List_menu_F").append(addListHtml);
				$("#pView").empty();
				$("#pView").append(startNum+1);
				$("#prevView").append("<");
			}
		});
	   
		
	});
	
$('#prevView').click(function(){
	var startNum = parseInt($("#pView").text()); // 시작지점
	var addListHtml = "";
	var addListHtmlpo = "";
				addListHtmlpo += "<li>번호</li>";
				addListHtmlpo += "<li>제목</li>";
				addListHtmlpo += "<li>작성일</li>";
				addListHtmlpo += "<li>조회</li>";
				addListHtmlpo += "<li>비고</li>";
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWord');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	var pn2 = pn.substring(pn.lastIndexOf('Search'))
	if(pn=='noticeSearch'){
		url = '/admin/noticeSearchLists';
		param = {
			"startNum" : (startNum-1)*8-8 ,
			"searchKey" : key,
			"searchWord" : word
		};
	}else if(pn=='admininfo'){
		url = '/admin/noticeList';
		param = {
			"startNum" : (startNum-1)*8-8
		};
	}else if(pn2 =='Search'){
		url = '/admin/noticeList';
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
				addListHtml += "<li>"+data[i].board_num+"</li>";
				addListHtml += "<li><a href='#"+data[i].board_num+"' style='color:black;'>"+data[i].title;
				addListHtml += "</a></li>";
				addListHtml += "<li>"+data[i].writedate+"</li>";
				addListHtml += "<li>"+data[i].hit+"</li>";
				addListHtml += "<li><a href='' class='modiB'>수정</a> <a href='/board/boardDelete?board_num="+data[i].board_num+"' class='delB'>삭제</a></li>";
			}
			$("#nextView").empty();
			$("#nextView").append(">");
			$("#List_menu_F").empty();
			$("#List_menu_F").append(addListHtmlpo);
			$("#List_menu_F").append(addListHtml);
			$("#pView").empty();
			$("#pView").append(startNum-1);
			
			if(parseInt($("#pView").text())==1){
				$("#prevView").empty();
			} 
		}
	});
});
</script>