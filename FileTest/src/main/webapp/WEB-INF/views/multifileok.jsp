<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   <!-- multifileok.jsp -->
   <h1>결과</h1>
   
   <c:forEach var="i" begin="0" end="${flist.size()-1}">
      <div>다운로드: <a href="/file/download.do?filename=${flist[i]}&orgfilename=${olist[i]}">${olist[i]}</a></div>
   </c:forEach>
   

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>









