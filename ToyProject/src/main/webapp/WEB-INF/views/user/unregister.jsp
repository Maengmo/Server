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
		<h1 class="sub">회원<small>탈퇴하기</small></h1>
		
		<form method="POST" action="/toy/user/unregister.do">
		<div>
			<button type="button" class=back"
				onclick="location.href='/toy/index.do';">돌아가기</button>
			<button type="submit" class="out primary">탈퇴하기</button>
		</div>
		</form>
		
	</main>




<script>
</script>
</body>
</html>










