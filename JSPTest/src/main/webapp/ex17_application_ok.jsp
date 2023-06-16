<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String txt1 = request.getParameter("txt1");
	String txt2 = request.getParameter("txt2");
	
	session.setAttribute("txt1", txt1);		//전역변수, 개인변수
	application.setAttribute("txt2", txt2); //전역변수, 공용변수

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

	<h1>session vs application</h1>
	
	<a href="ex17_application_view.jsp">확인하러 이동하기</a>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>










