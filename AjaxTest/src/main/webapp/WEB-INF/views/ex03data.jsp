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

</style>
</head>
<body>
	
	<input type="text">



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	//안쪽 문서 > 바깥쪽 문서
// 	top.document.getElementById('title').textContent = 'test';
	
	top.document.getElementById('question').textContent = '${dto.question}';

	<c:forEach var="i" begin="0" end="3">
	top.document.getElementsByClassName('item')[${i}].textContent = '${dto.item[i]}';	
	top.document.getElementsByClassName('cnt')[${i}].textContent = '${dto.cnt[i]}';	
	top.document.querySelectorAll('#chart > div')[${i}].style.width = '${dto.cnt[i] * 40}px';
	</c:forEach>
	
	setTimeout(function() {
		
		location.reload();
		
	}, 10000);
	
</script>
</body>
</html>










