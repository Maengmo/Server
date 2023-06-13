<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//상태 유지가 안된다.(Stateless)
	// 	int a = 1;
	// 	a = a + 1;
	
	//세션 객체의 활용 용도 > 상태 유지를 가능하게 한다.
	if(session.getAttribute("count")==null) {
		session.setAttribute("count", 1);
	}else {
		session.setAttribute("count", (int)session.getAttribute("count") + 1);
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

	<h1>세션</h1>
	
	<div>방문 카운트 : <%= session.getAttribute("count") %></div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>










