<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/notice/noticeList.css" type="text/css">

<title>공지사항</title>
<style>
	.noticeContainer{
	width:100%;
	height:855px;
	position:relative;
	text-align:center;
}
.noticeBtn{
	width:140px;
	height:40px;
	background-color:#92B4EC;
	font-size:16px;
	font-weight:700;
	border-radius:8px;
}

.noticeBoard{
	margin:0 auto;
	width:1200px;
	height:650px;
	position:relative;
}
.noticeListTop li{
	border-bottom:1px solid #92B4EC;
	width:15%;
	height:50px;
	line-height:50px;
	float:left;
	font-size:1.5em;
}
.noticeList li{
	width:15%;
	height:60px;
	line-height:60px;
	float:left;
}
.noticeModalBtn{
	width:140px ;
	height:40px ;
	background-color:#92B4EC;
	font-size:16px;
	font-weight:700;
	border-radius:8px;
	letter-spacing:1px;
}

/*======모달=======*/
.modal-content {
height: 100%;
overflow:auto;
}
.modalHeader{
	height:50px;
}
.modalBody{
	font-size:1.7em;
	padding:10px;
	height:300px;
	overflow:auto;
	overflow-x: hidden;
}
.noticeBottom{
	margin:20px 0px;
}
.noticeModalBtn{
	width:140px !important;
	height:40px !important;
	background-color:#92B4EC;
	font-size:16px;
	font-weight:700;
	border-radius:8px;
	letter-spacing:1px;
}
.modalFooter{
	float:left;
	height:70px;
}
.modalClose{
	font-size:1.7em;
}
</style>
<div class="noticeContainer">
	<h1>공지사항</h1>
	<button class="noticeBtn" onclick="">공지사항 등록</button>
	<br/>
	
	<div class="noticeBoard">
		<ul class="noticeListTop">
			<li>번호</li>
			<li>제목</li>
			<li>날짜</li>
			<li>조회수</li>
			<c:forEach var="vo" items="${noticeList}">
				<ul class="noticeList">
					<li>${vo.board_num}</li>
					<button class="titleBtn" onclick="">제목</button>
					<div class="modal">
						<div class="modal_content">
							<div class="modalHeader">
								<h3 class="modal_title" id="modalTitle"></h3>
							</div>
							<div class="modal_body" id="modalBody"></div>
							<div class="noticeBottom">
								<button class="noticeModalBtn" id="modalNoticeEdit">수정</button>
								&nbsp;&nbsp;&nbsp;
								<button class="noticeModalBtn" id="modalNoticeDel">삭제</button>
							</div>
							<div class="modalFooter">
								<button type="button" class="modalClose">닫기</button>
							</div>
						</div>
					</div>
					<li>작성일</li>
					<li>조회수</li>
				</ul>
			</c:forEach>
		</ul>
	</div>
</div>