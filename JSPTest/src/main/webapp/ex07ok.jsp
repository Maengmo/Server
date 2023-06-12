<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
		//클라이언트(브라우저)가 전송한 데이터를 수신하기(가져오기)
		
		//1. GET :  데이터를 URL에 붙여서 전송 > 인코딩 규칙 > URL 규칙에 따름 > 톰캣을 통해서 전송 > 톰캣 현재 UTF-8을 사용
		//2. POST : 데이터를 패킷에 넣어서 전송 > 인코딩 규칙 > 인터넷 규칙에 따름
		
		//doGet(HttpServletRequest request, )
		
		//POST 방식으로 전달된 데이터를 UTF-8 방식으로 인코딩 처리해라
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
	
	%>
	
	<div>결과 : <%= name %></div>

</body>
</html>