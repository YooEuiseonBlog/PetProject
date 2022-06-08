<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/admin.css" type="text/css"/>

<div class="containerB">
	<div class="Menu_Bar_A">
		<h1 class="Menu_title">작성글 관리</h1>
	</div>
	<div class="Menu_container">
		<ul class="List_menu_B" id="List_menu_B">
			<li>번호</li>
			<li>제목</li>
			<li>작성일</li>
			<li>조회</li>
			<li>비고</li>

		</ul><!-- 게시물 -->
		
		 <div class="pagingB">
           <b id="prevViewB">  </b>
           <b id="pViewB"></b>
           <b id="nextViewB" > > </b>
            
        </div>
    
		<br/><br/><br/>
		<div class="Share_searchB">
			 <form action="/admin/boardSearch?type=board" id="searchFrmB">
				<select name="searchKey" id="SKey">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchWord" id="searchWordB"/>
				<input type="hidden" name="type" value="board"/>
				<input type="submit" value="검색"/>
			</form>
		</div>
	</div>
</div>

<script>

$("#searchFrmB").submit(function() {
   if ($("#searchWordB").val() == "") {
      alert("검색어를 입력하세요");
      return false;
   }
   
});
	
$(document).ready(function(){
		var startNum = 0; 
		var addListHtmlBo = "";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'))
		if(pn=='boardSearch'){
			url = '/admin/boardSearchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn=='admininfo'){
			url = '/admin/boardList';
			param = {
				"startNum" : startNum 
			};
		}else if(pn2 =='Search'){
			url = '/admin/boardList';
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
					addListHtmlBo += "<li>"+data[i].board_num+"</li>";
					addListHtmlBo += "<li><a href='#"+data[i].board_num+"' style='color:black;'>"+data[i].title;
					addListHtmlBo += "</a></li>";
					addListHtmlBo += "<li>"+data[i].writedate+"</li>";
					addListHtmlBo += "<li>"+data[i].hit+"</li>";
					addListHtmlBo += "<li><a href='' class='modiB'>수정</a> <a href='/board/boardDelete?board_num="+data[i].board_num+"' class='delB'>삭제</a></li>";
				}
				if(data.length<8){
					$("#nextViewB").empty();
				} 
				if(startNum=1){
					$("#prevViewB").empty();
				} 
				$("#List_menu_B").append(addListHtmlBo);
				$("#pViewB").append(startNum);
			}
		});
});

$('#nextViewB').click(function(){
		var startNum = parseInt($("#pViewB").text());
		var addListHtmlBo = "";
					addListHtmlBo += "<li>번호</li>";
					addListHtmlBo += "<li>제목</li>";
					addListHtmlBo += "<li>작성일</li>";
					addListHtmlBo += "<li>조회</li>";
					addListHtmlBo += "<li>비고</li>";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'))
		if(pn=='boardSearch'){
			url = '/admin/boardSearchLists';
			param = {
				"startNum" : startNum*8 ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn=='admininfo'){
			url = '/admin/boardList';
			param = {
				"startNum" : startNum*8
			};
		}else if(pn2 =='Search'){
			url = '/admin/boardList';
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
					addListHtmlBo += "<li>"+data[i].board_num+"</li>";
					addListHtmlBo += "<li><a href='#"+data[i].board_num+"' style='color:black;'>"+data[i].title;
					addListHtmlBo += "</a></li>";
					addListHtmlBo += "<li>"+data[i].writedate+"</li>";
					addListHtmlBo += "<li>"+data[i].hit+"</li>";
					addListHtmlBo += "<li><a href='' class='modiB'>수정</a> <a href='/board/boardDelete?board_num="+data[i].board_num+"' class='delB'>삭제</a></li>";
				}
				if(data.length<8){
					$("#nextView").empty();
				} 
				$("#prevViewB").empty();
				$("#List_menu_B").empty();
				$("#List_menu_B").append(addListHtmlBo);
				$("#pViewB").empty();
				$("#pViewB").append(startNum+1);
				$("#prevViewB").append("<");
			}
		});
	   
		
	});
	
$('#prevViewB').click(function(){
	var startNum = parseInt($("#pViewB").text()); // 시작지점
	var addListHtmlBo = "";
				addListHtmlBo += "<li>번호</li>";
				addListHtmlBo += "<li>제목</li>";
				addListHtmlBo += "<li>작성일</li>";
				addListHtmlBo += "<li>조회</li>";
				addListHtmlBo += "<li>비고</li>";
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWord');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	var pn2 = pn.substring(pn.lastIndexOf('Search'))
	if(pn=='boardSearch'){
		url = '/admin/boardSearchLists';
		param = {
			"startNum" : (startNum-1)*8-8 ,
			"searchKey" : key,
			"searchWord" : word
		};
	}else if(pn=='admininfo'){
		url = '/admin/boardList';
		param = {
			"startNum" : (startNum-1)*8-8
		};
	}else if(pn2 =='Search'){
		url = '/admin/boardList';
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
				addListHtmlBo += "<li>"+data[i].board_num+"</li>";
				addListHtmlBo += "<li><a href='#"+data[i].board_num+"' style='color:black;'>"+data[i].title;
				addListHtmlBo += "</a></li>";
				addListHtmlBo += "<li>"+data[i].writedate+"</li>";
				addListHtmlBo += "<li>"+data[i].hit+"</li>";
				addListHtmlBo += "<li><a href='' class='modiB'>수정</a> <a href='/board/boardDelete?board_num="+data[i].board_num+"' class='delB'>삭제</a></li>";
			}
			$("#nextViewB").empty();
			$("#nextViewB").append(">");
			$("#List_menu_B").empty();
			$("#List_menu_B").append(addListHtmlBo);
			$("#pViewB").empty();
			$("#pViewB").append(startNum-1);
			
			if(parseInt($("#pViewB").text())==1){
				$("#prevViewB").empty();
			} 
		}
	});
});
</script>