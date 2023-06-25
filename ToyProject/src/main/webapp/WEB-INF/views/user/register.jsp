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

</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1>회원 <small>가입하기</small></h1>
		
		<form method="POST" action="/toy/user/register.do" enctype="multipart/form-data">
		
			<table class="vertical">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" id="id" required class="short"></td>
				</tr>
				<tr>
					<th>암호</th>
					<td><input type="password" name="pw" id="pw" required class="short"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="name" required class="short"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" id="email" required class="long"></td>
				</tr>
				<tr>
					<th>프로필 사진</th>
					<td><input type="file" name="pic" id="pic" class="long"></td>
				</tr>
				<tr>
					<th>프로필 내용</th>
					<td>
						<textarea name="profile" id="profile" class="long"></textarea>
					</td>
				</tr>
			</table>
			
			<div>
				<button type="button" class=back"
					onclick="location.href='/toy/index.do';">돌아가기</button>
				<button type="submit" class="add primary">가입하기</button>
				
			</div>
		</form>
		
	</main>




<script>
</script>
</body>
</html>










