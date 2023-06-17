<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//JSP > 쿠키 저장
	//Cookie cookie = new Cookie("color", "blue");

	//브라우저 저장
	//response.addCookie(cookie);
	
	Cookie[] list = request.getCookies();
	
	for (Cookie c : list) {
		System.out.println(c.getName() + ":" + c.getValue());
	}

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

	<h1>쿠키</h1>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>










