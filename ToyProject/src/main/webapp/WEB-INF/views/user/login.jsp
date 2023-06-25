<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Project</title>

<%@ include file="/WEB-INF/views/inc/asset.jsp" %>

<style>
	#login {width: 350px;}
	#login th {width: 120px;}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1>회원 <small>로그인</small></h1>
		
		<form method="POST" action="/toy/user/login.do">
		<table id="login" class="vertical">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="id" required class="short"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pw" id="pw" required class="short"></td>
			</tr>
		</table>
		<div>
			<button type="button" class=back"
				onclick="location.href='/toy/index.do';">돌아가기</button>
			<button type="submit" class="login primary">로그인</button>
		</div>
		</form>
		
		<hr>
		
		<div style="display: flex;">
		<form method="POST" action="/toy/user/login.do">
			<input type="hidden" name="id" value="minji">
			<input type="hidden" name="pw" value="1234">
			<input type="submit" value=" 리민지(minji) ">
		</form>
		
		<form method="POST" action="/toy/user/login.do">
			<input type="hidden" name="id" value="test">
			<input type="hidden" name="pw" value="1234">
			<input type="submit" value="테스트(test)">
		</form>
		
		<form method="POST" action="/toy/user/login.do">
			<input type="hidden" name="id" value="aaa">
			<input type="hidden" name="pw" value="1234">
			<input type="submit" value="에에이이(aaa)">
		</form>
		
		<form method="POST" action="/toy/user/login.do">
			<input type="hidden" name="id" value="admin">
			<input type="hidden" name="pw" value="1111">
			<input type="submit" value="관리자(admin)">
		</form>
		
		<form method="POST" action="/toy/user/login.do">
			<input type="hidden" name="id" value="dongjae">
			<input type="hidden" name="pw" value="1234">
			<input type="submit" value="리동재(dongjae)">
		</form>
		</div>
	</main>




<script>
</script>
</body>
</html>










