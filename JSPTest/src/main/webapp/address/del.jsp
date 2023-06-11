<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 데이터 가져오기(del.jsp?seq=10)
	//2. 확인 > 이동 유무?
			
	//1.
	String seq = request.getParameter("seq");
	
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
	<!-- template.jsp -->
	 
	<%@ include file="inc/header.jsp" %>
	
	<div>
		<h3>삭제하기</h3>
		
		<div>
			<form method="POST" action="delok.jsp">
				<button type="button" onclick="location.href='list.jsp'">
					<span class="material-symbols-outlined">fact_check</span>
					목록보기
				</button>
				
				
				<button type="submit">
					<span class="material-symbols-outlined">delete</span>
					삭제하기
				</button>
				<input type="hidden" name="seq" value="<%= seq %>">
			</form>
		</div>
	</div>



<script>
</script>
</body>
</html>










