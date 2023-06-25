<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Project</title>

<%@ include file="/WEB-INF/views/inc/asset.jsp" %>

<style>

</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1 class="page">게시판 
		
		<c:if test="${mode == 'new'}">
			<small>글쓰기</small>
		</c:if>
		<c:if test="${mode == 'reply'}">
			<small>답변쓰기</small>
		</c:if>
		</h1>
		
		<form method="POST" action="/toy/board/add.do">
		<table class="vertical">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" id="subject" required class="full"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" required class="full"></textarea></td>
			</tr>
		</table>
		<div>
			<button type="button" class=back"
				onclick="location.href='/toy/board/board.do';">돌아가기</button>
			<button type="submit" class="add primary">글쓰기</button>
		</div>
		<input type="hidden" name="mode" value="${mode}">
		<input type="hidden" name="thread" value="${thread}">
		<input type="hidden" name="depth" value="${depth}">
		</form>
		
	</main>




<script>
</script>
</body>
</html>










