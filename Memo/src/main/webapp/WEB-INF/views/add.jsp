<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Memo</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	th {
		width : 200px;
	}
	
	textarea {
		width : 520px;
	}

	select {
		width : 535px;
	}
</style>
</head>
<body>
	<!-- add.jsp -->
	<h1>Memo <samll>Add</samll></h1>
	
	<form method="POST" action="/memo/add.do">
		<table>
			<tr>
				<th>메모</th>
				<td><textarea name="memo" id="memo" required></textarea></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="category" id="category">
						<c:forEach items="${clist}" var="cdto">
							<option value="${cdto.seq}">${cdto.name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table> 
		
		<div>
			<input type="button" value="돌아가기" onclick="location.href='/memo/list.do';">
			<input type="submit" value="추가하기" class="primary">
		</div>
	</form>

<script>
</script>
</body>
</html>










