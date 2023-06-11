<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	if (session.getAttribute("id")==null
				|| !session.getAttribute("lv").toString().equals("2")) {
	
	//미인증 유저!!
	//렌더링을 중단하고 출력 버퍼안에 내용을 클라이언트에게 반환한다.
	
	out.println("<html>");
	out.println("<head>");
	out.println("<meta charset='UTF=8'>");
	out.println("</head>");
	out.println("<body>");
	out.println("<script>alert('관리자만 접근이 가능합니다.'); location.href='index.jsp';</script>");
	out.println("</body>");
	out.println("</html>");
	
	out.close(); 
	
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

	<h1>관리자 전용 페이지</h1>
	
	<p>관리자만 접근이 가능합니다.</p>
	<p>로그인한 사용자라도, 관리자 권한이 없으면 접근이 불가능합니다.</p>

	<a href="index.jsp">시작 페이지로 돌아가기</a>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>










