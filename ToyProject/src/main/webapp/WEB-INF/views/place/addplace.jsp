<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Project</title>

<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/toy/asset/css/tagify.css">

<style>
   
   table > th {
      width: 125px !important;
   }
   
   .tagify {
      border: 1px solid #BBB;
      border-radius: 3px;
      width: 100%;
   }


</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1 class="page">장소 <small>등록하기</small></h1>
		
		<form method="POST" action="/toy/place/addplace.do" enctype="multipart/form-data">
		<table>
			<tr>
				<th>장소명</th>
				<td><input type="text" name="name" required class="full"></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea name="content" required class="full"></textarea></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="pic" required class="full"></td>
			</tr>
			<tr>
				<th>해시 태그</th>
				<td><input type="text" name="hashtag" value=""></td>
			</tr>
		</table>
		<div>
			<button type="button" class=back"
				onclick="location.href='/toy/place/place.do';">돌아가기</button>
			<button type="submit" class="add primary">등록하기</button>
		</div>
		</form>
	</main>


<script src="/toy/asset/js/jQuery.tagify.min.js"></script>
<script>

	/* const obj = {};
	const list = [ '맛집', '점심', '도시락' ];

	obj.whitelist = list; */
	
	$('input[name=hashtag]').tagify();
	
</script>
</body>
</html>










