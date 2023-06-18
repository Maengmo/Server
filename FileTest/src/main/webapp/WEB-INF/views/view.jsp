<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>

	img {
		display : block;
		margin : 50px auto;
		max-width : 750px;
	}

</style>
</head>
<body>
	<h1>Image Viewer</h1>
	
	<table>
		<tr>
			<td colspan="2"><img src="/file/files/${dto.filename}"></td>
		</tr>
		<tr>
			<td>${dto.name}</td>
			<td>${dto.regdate}</td>
		</tr>
	</table>

	<div>
		<input type="button" value="돌아가기"
			onclick = "location.href='/file/list.do';">
		<input type="button" value="수정하기"
			onclick = "location.href='/file/edit.do?seq=${dto.seq}';">
		<input type="button" value="삭제하기"
			onclick = "location.href='/file/delok.do?seq=${dto.seq}';">
	</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>










