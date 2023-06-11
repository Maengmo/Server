<%@page import="com.test.my.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//1. 데이터 가져오기
	//2. DB 작업 > delete
	//3. 피드백
	
	//1. 
	request.setCharacterEncoding("UTF-8");
	
	String seq = request.getParameter("seq");
	
	//2. - webapp > WEB-INF > lib
	//데이터 베이스 연동
	
	Connection conn = null;
	PreparedStatement stat = null;
	
	conn = DBUtil.open();
	
// 	System.out.println(conn.isClosed());
	
	String sql = "delete from tblAddress where seq = ?";
	stat = conn.prepareStatement(sql);
	
	stat.setString(1, seq);
	
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










