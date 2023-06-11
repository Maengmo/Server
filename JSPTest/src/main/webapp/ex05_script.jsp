<%@page import="com.test.jsp.util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String name = "홍길동";
	int age = 20;
	String color = "orange";
	String txt = "<input type='text'>";
	String attr = "background-color";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


	/* CSS 구문으로 사용 */
	div {
		color : <%= color %>;
		<%= attr %> : gold;
	}

</style>
</head>
<body>
	
	<%
	
		//자바 영역
		int a = 10;
		int b = 20;
		int c = a+b;
		
		String str = name;
	
	%>	
	
	<!-- HTML의 PCDATA로 출력  -->
	<div><%= a %> + <%= b %> = <%= a+b %> </div>
	
	<div><%= name %></div>
	
	<!-- HTML의 속성값으로 출력 -->
	<input type="text" value="<%= age %>">
	
	<hr>
	
	<%-- JSP 주석 --%>
	결과 : <%-- <%= add(100,200) %> --%>
	
	결과 : <%= util.add(100, 200) %>
	
	<%= txt %>
	
	<input type="button" value="확인" id="btn1">
	
	<script>
	
		document.getElementById('btn1').onclick = function() {
			
			//alert(<%= age %>);
			alert('<%= name %>');
		};
	
	</script>
	
</body>
</html>




