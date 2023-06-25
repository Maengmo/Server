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
	#list {
		display: flex;
		margin: 1rem;
		flex-wrap: wrap;
	/* 	justify-content: center; */
		cursor: pointer;
	}
	
	#list .item {
		border: 1px solid #CCC;
		margin: 15px 5px;
	}
	
	#list .item img {
		width: 165px;
		height: 165px;
		border: 1px solid #CCC;
		padding: 2px;
		object-fit: cover;
	}
	
	#list .item div:nth-child(2) {
		padding: 5px;
	}
	
	#list .item div:nth-child(3) {
		padding: 5px;
		font-size: 14px;
		color: #777;
	}

</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1 class="sub">장소 <small>목록</small></h1>
		
		<div id="list">
			<c:forEach items="${list}" var="dto">
			<div class="item" onclick="location.href='/toy/place/view.do?seq=${dto.seq}';">
				<img src="/toy/asset/place/${dto.pic}">
				<div>${dto.name}</div>
				<div>${dto.uname}(${dto.id})</div>
			</div>
			</c:forEach>
		</div>
		
		<div>
			<button class="add primary" onclick="location.href='/toy/place/addplace.do';">
			등록하기
			</button>
		</div>
		
	</main>




<script>
</script>
</body>
</html>










