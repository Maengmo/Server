<%@page import="com.test.my.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//1. 데이터 가져오기
	//2. DB 작업 > UPDATE
	//3. 피드백
	
	//1. 
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	String seq = request.getParameter("seq");
	
	//2. - webapp > WEB-INF > lib
	//데이터 베이스 연동
	
	Connection conn = null;
	PreparedStatement stat = null;
	
	conn = DBUtil.open();
	
// 	System.out.println(conn.isClosed());
	
	String sql = "update tblAddress set name = ?, age = ?, tel = ?, address = ? where seq = ?";
	
	stat = conn.prepareStatement(sql);
	
	stat.setString(1, name);
	stat.setString(2, age);	//**자바와 오라클의 자료형은 아무 관계 없다.
	stat.setString(3, tel);
	stat.setString(4, address);
	stat.setString(5, seq);
	
	int result = stat.executeUpdate();
	
	stat.close();
	conn.close();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address</title>
<%@ include file="inc/asset.jsp" %>
<style>

</style>
</head>
<body>
	<!-- template.jsp > addok.jsp -->
	 
	<%@ include file="inc/header.jsp" %>
	
	<div>
		 
	</div>



<script>

	<% if(result == 1) { %>
		//alert('추가했습니다.');
		location.href = 'list.jsp';
	<%} else { %>
		alert('실패했습니다.');
		//location.href = 'edit.jsp';
		history.back();
	<% } %>
</script>
</body>
</html>










