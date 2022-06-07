<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/notice/noticeList.css" type="text/css">
<script src="/js/notice/noticeList.js"></script>

<title>공지사항</title>

<div class="noticeContainer">
	<h1 class="noticeTitle">공지사항</h1>
	<div class="noticeBtnArea">
		<button class="noticeBtn" onclick="window.location.href='/notice/noticeWrite'">공지사항 등록</button>
		<br/>
	</div>
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
					<li data-toggle="modal" data-target="#noticeModal">${vo.title}</li>
					<li>${vo.write_date}</li>
					<li>${vo.hit}</li>
				</ul>
				<div class="modal" id="noticeModal"> 
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
							<button type="button" class="modalClose" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</ul>
	</div>
</div>