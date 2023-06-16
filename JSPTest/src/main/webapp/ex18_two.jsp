<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<h1>두번째 페이지</h1>
	
<%-- 	<div>a: <%= a %></div> --%>
<%-- 	<div>b: <%= b %></div> --%>
	<div>c: <%= pageContext.getAttribute("c") %></div>
	<div>d: <%= request.getAttribute("d") %></div>
	<div>e: <%= session.getAttribute("e") %></div>
	<div>f: <%= application.getAttribute("f") %></div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>










