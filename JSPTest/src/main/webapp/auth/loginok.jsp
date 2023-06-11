<%@page import="com.test.my.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//1. 데이터 가져오기(id, pw)
	//2. DB 작업 > select
	//3. 확인 결과
	// 3.1 확인 O > ??
	//	- 인증 티켓 발급(*****) > 세션!! or 쿠키
	//		- 개인적(다른 유저의 티켓과는 독립적으로 관리가 가능)
	//		- 이동 자유(a.jsp > b.jsp)
	// 3.2 확인 X > 쫒아내기
	
	//1. 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//2. 
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	conn = DBUtil.open();
	
	//로그인 SQL
	String sql = "select * from tblUser where id = ? and pw = ?";
	
	stat = conn.prepareStatement(sql);
	
	stat.setString(1, id);
	stat.setString(2, pw);
	
	rs = stat.executeQuery();
	
	//로그인 성공 유무 확인
	if (rs.next()) {
		//로그인 성공
		//인증 티켓 발급
// 		session.setAttribute("num", 100); //여기서만!!
		session.setAttribute("id", id); //인증 티켓 > 식별자 저장
		
		//로그인 회원의 부가 정보
		session.setAttribute("name", rs.getString("name"));
		session.setAttribute("lv", rs.getString("lv"));
		
		
		
	} else {
		//로그인 실패
		
	}
	
	rs.close();
	stat.close();
	conn.close();
	
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



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	<% if(session.getAttribute("id") != null) { %>
		
		location.href = 'index.jsp';
	
	<% } else { %>
	
		alert('로그인 실패;;');
		history.back();
	
	<% } %>

</script>
</body>
</html>










