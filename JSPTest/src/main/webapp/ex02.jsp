<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	//스크립틀릿 영역 > 자바 영역
	Random rnd = new Random();
	
	int dan = rnd.nextInt(8) + 2;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	div {
		margin : 3px 10px;
	}

</style>
</head>
<body>

	<h1>구구단 <%= dan %>단</h1>
	
	<% 
		for (int i=1; i<=9; i++) {
	%>	
			<div><%= dan %> x <%= i %> = <%= dan*i %></div>
	<%		
		} 
	%>
	

</body>
</html>