<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<!-- login.jsp -->
	
	<h1>로그인</h1>
	
	<form method="POST" action="loginok.jsp">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" required class="short"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pw" required class="short"></td>
		</tr>
	</table>
	
	<div>
		<input type="button" value="돌아가기" onclick="location.href='index.jsp';">
		<input type="submit" value="로그인">
	</div>
	</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>










