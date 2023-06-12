<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//페이지 이동
	//1. HTML
	// - <a>
	// - 사람이 직접 링크 클릭
	
	//2. JavaScript
	// - location.href
	// - 프로그램 제어가 가능 
	
	//3. Servlet.JSP
	// - response.sendRedirect()
	// - 프로그램 제어가 가능
	
	response.sendRedirect("ex11_response_two.jsp");

%>
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

	<h1>첫번째 페이지</h1>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	location.href = "ex11_response_two.jsp"
</script>
</body>
</html>










