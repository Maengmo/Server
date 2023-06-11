<%@page import="com.test.my.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. DB 작업 > select
	//2. ResultSet > HTML 테이블 출력
	
	//1.
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;
	
	conn = DBUtil.open();
	
	String sql = "select * from tblAddress order by seq desc";
	
	stat = conn.createStatement();
	rs = stat.executeQuery(sql);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address</title>
<%@ include file="inc/asset.jsp" %>
<style>

	table th:nth-child(1) {width : 50px;}
	table th:nth-child(2) {width : 70px;}
	table th:nth-child(3) {width : 50px;}
	table th:nth-child(4) {width : 130px;}
	table th:nth-child(5) {width : auto;}

	table td {text-align : center;}
	table td:nth-child(5) { text-align : left; }
	table td:nth-child(5) span { float : right; margin-top: 4px;}
	
</style>
</head>
<body>
	<!-- template.jsp > list.jsp -->
	 
	<%@ include file="inc/header.jsp" %>
	
	<div>
		<h3>목록보기</h3>
		
		<table class="horizontal">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>전화</th>
				<th>주소</th>
			</tr>
			<% while (rs.next()) { %>
			<tr>
				<td><%= rs.getString("seq") %></td>
				<td><%= rs.getString("name") %></td>
				<td><%= rs.getString("age") %></td>
				<td><%= rs.getString("tel") %></td>
				<td>
					<%= rs.getString("address") %>
					<span><a href="edit.jsp?seq=<%= rs.getString("seq")%>">[edit]</a></span>
					<span><a href="del.jsp?seq=<%= rs.getString("seq")%>">[delete]</a></span>
				</td>
			</tr>
			<% } %>
		</table>
	</div>
	<div>
		<button type="button" onclick="location.href='add.jsp'">
			<span class="material-symbols-outlined">edit_note</span>
			추가하기
		</button>
	</div>
	


<script>
</script>
</body>
</html>
<%
	rs.close();
	stat.close();
	conn.close();
%>









