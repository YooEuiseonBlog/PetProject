<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/notice/noticeEdit.css" type="text/css">
<script src="/js/ckeditor/ckeditor.js"></script>
<title>공지사항 수정</title>

<div class="noticeEditContainer">
	<h1>공지사항 수정</h1>
	<form id="noticeForm" method="post" action="/board/boardEditOk" enctype="multipart/form-data">
		<input type="hidden" name="board_type_num" value="3">
		<input type="hidden" name="board_num" value="${vo.board_num}">
		<!-- 글 제목 -->
		<div class="noticeEditTitleContainer">
			<div class="col-lg-4 noticeEditTitle">글 제목&nbsp;</div>
			<div class="col-lg-8">
				<input type="text" class="noticeEditTitleBox" name="title" value="${vo.title}"/>
			</div>
		</div>
		<!-- ck에디터 -->
		<div class="noticeTextArea" id="noticeTextArea">
			<textarea class="notice_editor" id="notice_editor" name="content">${vo.content}</textarea>
		</div>
		<br /> <br /> <input type="submit" class="btn registBtn" value="등록하기">
	</form>
</div>