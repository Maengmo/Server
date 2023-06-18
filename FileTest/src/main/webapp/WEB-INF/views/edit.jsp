<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ImageViewer</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>

</style>
</head>
<body>

	<h1>Image Viewer</h1>
	
	<form method="POST" action="/file/editok.do" enctype="multipart/form-data">
	<table>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="name" class="short" required value="${dto.name}"></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td>
				<input type="file" name="attach">
				<span>${dto.filename}</span>
			</td>
		</tr>
	</table>

	<div>
		<input type="button" value="돌아가기" onclick="history.back();">
		<input type="submit" value="수정하기">
	</div>
	
	<input type="hidden" name="seq" value="${dto.seq}">
	</form>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$('input[name=attach]').change(function() {
		
		if ($(this).val() != '') {
			
			$(this).next().css('text-decoration', 'line-through');
		}else {
			$(this).next().css('text-decoration', 'none');
		}
		
	});
	
</script>
</body>
</html>










