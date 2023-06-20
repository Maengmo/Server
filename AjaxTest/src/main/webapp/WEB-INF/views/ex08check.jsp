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

	<h1>아이디 중복검사</h1>
	
	<form method="GET" action="/ajax/ex08check.do">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="id" name="id" class="short" required value="${id}"></td>
				<td><input type="submit" value="중복검사"></td>
			</tr>
		</table>
		
	</form>
	<div id="result">
		<c:if test="${result == 1}">
		이미 사용중인 아이디입니다.
		</c:if>
		<c:if test="${result == 0}">
		사용 가능한 아이디입니다.
		</c:if>
	</div>
	
	<hr>
	
	<div>
		<input type="button" value="사용하기" id="btn1" disabled>
		<input type="button" value="창닫기" id="btn2">
	</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$('#btn1').click(()=> {
		
		opener.document.getElementById('id1').value = '${id}';
		window.close();
		
	});

	$('#btn2').click(()=> {
		window.close();
	});
	
	<c:if test="${result == 1}">
		$('#btn1').attr('disabled', true);
	</c:if>
	<c:if test="${result == 0}">
		$('#btn1').attr('disabled', false);
	</c:if>
	
</script>
</body>
</html>










