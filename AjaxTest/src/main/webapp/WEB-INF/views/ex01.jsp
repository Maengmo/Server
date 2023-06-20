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
	<h1>Ajax</h1>
	
	<div>
		<input type="button" value="확인" id="btn1">
		<hr>
		<div id="div1">${count}</div>
	</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	//사용자 행동 > DB 조작
	
	//버튼 클릭 > DB의 메모 개수를 가져와서 > 화면 출력
	$('#btn1').click(()=>) {
		
		//DB 조작을 하는 서블릿 호출하기
		location.href = '/ajax/ex01ok.do';
		
	});
	
</script>
</body>
</html>










