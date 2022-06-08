<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/notice/noticeList.css" type="text/css">
<script src="/js/notice/noticeList.js"></script>

<title>공지사항</title>

<div class="noticeContainer">
	<h1 class="noticeTitle">공지사항</h1>
	<c:if test="${logLevel==1}">
	<div class="noticeBtnArea">
		<button class="noticeBtn" onclick="window.location.href='/notice/noticeWrite'">공지사항 등록</button>
	</div>
	</c:if>
	<br/>
	
	<div class="noticeBoard">
		<ul class="noticeListTop">
			<li>번호</li>
			<li>제목</li>
			<li>날짜</li>
			<li>조회수</li>
			<hr/>
			<c:forEach var="list" items="${list}">
				<ul class="noticeList">
					<li>${list.board_num}</li>
					<li data-toggle="modal" data-target="#noticeModal">${list.title}</li>
					<li>${list.writedate}</li>
					<li>${list.hit}</li>
				</ul>
				<div class="modal" id="noticeModal"> 
					<div class="modal-dialog">
						<div class="modal_content">
							<div class="modalHeader">
								<h3 class="modal_title" id="modalTitle"></h3>
							</div>
							<div class="modal_body" id="modalBody"></div>
							<div class="noticeBotton">
								<c:if test="${Loglevel==1}">
									<button class="noticeModalBtn" id="modalNoticeEdit">수정</button>
									&nbsp;&nbsp;&nbsp;
									<button class="noticeModalBtn" id="modalNoticeDel">삭제</button>
								</c:if>
							</div>
							<!-- <div class="modalFooter">
								<button type="button" class="modalClose" data-dismiss="modal">닫기</button>
							</div> -->
						</div>
					</div>
				</div>
			</c:forEach>
		</ul>
	</div>
	<div class="pagingContainer">
		<ul class="pagination justify-content-center" id="paging">
			<c:if test="${pvo.pageNum==1}">
				<li class="page-item disabled"><a class="page-link"
					id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
			</c:if>
			<c:if test="${pvo.pageNum>1}">
				<li class="page-item"><a class="page-link"
					href="/notice/noticeList?pageNum=${pvo.pageNum-1}" id="prevBtn"><i
						class="fa fa-angle-left"></i></a></li>
			</c:if>
			<c:forEach var="p" begin="${pvo.startPage}" end="${pvo.totalPage}">
				<c:if test="${p<=pvo.totalPage}">
					<c:choose>
						<c:when test="${p==pvo.pageNum}">
							<li class="page-item disabled"><a class="page-link">${p}</a></li>
						</c:when>
						<c:when test="${p!=pvo.pageNum}">
							<li class="page-item"><a class="page-link"
								href="/notice/noticeList?pageNum=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:if>
			</c:forEach>
			<c:if test="${pvo.pageNum==pvo.totalPage}">
				<li class="page-item disabled"><a class="page-link"
					id="nextBtn"><i class="fa fa-angle-right"></i></a></li>
			</c:if>
			<c:if test="${pvo.pageNum<pvo.totalPage}">
				<li class="page-item"><a class="page-link"
					href="/notice/noticeList?pageNum=${pvo.pageNum+1}" id="nextBtn"><i
						class="fa fa-angle-right"></i></a></li>
			</c:if>
		</ul>
	</div>
</div>