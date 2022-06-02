<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<div class="noticeBtnArea">
	<button class="noticeBtn btn" onclick="">공지사항 등록</button>
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
				<li>1</li>
				<li data-toggle="modal" data-target="#noticeModal">제목</li>
				<li>작성일</li>
				<li>조회수</li>
			</ul>
			<!-- 모달창 -->
			<div class="modal" id="noticeModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- 모달 헤더 -->
						<div class="modal-header">
						<h3 class="modal-title" id="modalTitle"></h3>
					</div>
				<!-- 모달 바디 -->
				<div class="modal-body" id="modalContent"></div>
				<div class="noticeBottonArea">
					<button class="noticeModalBtn btn" id="modalNoticeEdit" >공지사항 수정</button>
					&nbsp;&nbsp;&nbsp;
					<button class="noticeModalBtn btn" id="modalNoticeDel">공지사항 삭제</button>
				</div>
				<!-- 모달 푸터 -->
				<div class="modal-footer">
					<button type="button" class="btn modalclose" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
		</c:forEach>
	</ul>
</div>