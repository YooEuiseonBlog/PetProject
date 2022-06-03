<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">


<link rel="stylesheet" href="/css/notice/noticeList.css" type="text/css">

<title>공지사항</title>

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
					<li>1</li>
					<button>제목</button>
					<div class="modal">
						<div class="modal_content">
							<div class="modalHeader">
								<h3 class="modal_title" id="modalTitle"></h3>
							</div>
							<div class="modal_body" id="modalBody"></div>
							<div class="noticeBottonArea">
								<button class="noticeModalBtn" id="modalNoticeEdit">수정</button>
								&nbsp;&nbsp;&nbsp;
								<button class="noticeModalBtn" id="modalNoticeDel">삭제</button>
							</div>
							<div class="modalFooter">
								<button type="button" class="btnmodalclose">닫기</button>
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