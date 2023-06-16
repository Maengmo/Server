<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//상태 유지를 하고 싶다!!
	//one.jsp > (이동) > two.jsp

	//1. 지역 변수 : 다른 페이지에서 쓸 수 없음.
	int a = 10;

	//3. pageContext : 매번 새로 만들어져서 페이지가 바뀌면 null
	pageContext.setAttribute("c", 30);
	
	//4. request : 이동할 때, forward 메소드만 유지되서 null
	request.setAttribute("d", 40);
	
	//5. session : 접속을 종료하지 않았으므로, 유지
	session.setAttribute("e", 50);
	
	//6. application : 유지!
	application.setAttribute("f", 60);
	
	//이렇게 forward를 사용하면, request가 유지됨.
	pageContext.forward("ex18_two.jsp");

%>
<%!

	//2. 멤버 변수 : 다른 페이지에서 쓸 수 없음.
	int b = 20;

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
	
	<a href="ex18_two.jsp">이동하기</a>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>










