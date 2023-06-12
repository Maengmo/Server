<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//UTF-8 설정
	request.setCharacterEncoding("UTF-8");
	
	//가로 세로
	String width = request.getParameter("width");
	String height = request.getParameter("height");
	
	//텍스트
	String txt = request.getParameter("txt");
	
	//버튼 갯수
	int ea = Integer.parseInt(request.getParameter("ea"));   
	
	//배경 색상 | 폰트 색상
	String background = request.getParameter("backgroundcolor");
	String color = request.getParameter("color");
	
	//폰트 사이즈
	String fontSize = request.getParameter("fontSize");
	
	//버튼 간격
	String leftright = request.getParameter("leftright");
	String topbottom = request.getParameter("topbottom");
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<style>
	#main .btn {
		width : <%= width %>px;
		height : <%= height %>px;	
		background-color : <%= background %>;
		color : <%= color %>;
		font-size : <%= fontSize %>px;
		margin : <%=topbottom%>px <%=leftright%>px;
	}

</style>
</head>
<body id="main">
	
	<h1>결과</h1>
	
	<div class="panel full">
		<% for (int i=0; i<ea; i++) { %>
		<input type="button" class="btn" value="<%= txt %>">
		<% } %>
	</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	
</script>
</body>
</html>










