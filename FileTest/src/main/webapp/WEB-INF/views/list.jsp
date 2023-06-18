<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Viewer</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>

	img {
		display:block;
		width : 140px;
		height : 140px;
		margin : 0 auto;
		object-fit : cover;
		cursor : pointer;
	}

</style>
</head>
<body>

	<h1>Image Viewer</h1>
	
	<table>
		<tr>
			<c:forEach items="${list}" var="dto" varStatus="status">
			
			<td><img src="/file/files/${dto.filename}" onclick="view(${dto.seq});"></td>
			
			<c:if test="${status.count % 5 == 0}">
				</tr>
				<tr>	
			</c:if>
			
			</c:forEach>
			
			<c:forEach var="i" begin="1" end="${5- list.size() % 5}">
				<td></td>
			</c:forEach>
			
		</tr>
	</table>
	
	<div>
		<input type="button" value="등록하기" onclick="location.href='/file/add.do';">
	</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	function view(seq) {
		
		location.href = '/file/view.do?seq=' + seq;
		
	}
</script>
</body>
</html>










