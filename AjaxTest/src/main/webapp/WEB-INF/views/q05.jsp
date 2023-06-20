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

	#list {
		border: 1px solid  gray;
		border-collapse:  collapse;
	}
	
	#list th, #list td {
		border: 1px solid  gray;
		padding: 5px;
	}
	
	#list th {
		background-color: #DDDDDD;
	}
	
	#list td:nth-child(1) { width: 50px; text-align: center; }
	#list td:nth-child(2) { width: 80px; text-align: center; }
	#list td:nth-child(3) { width: 140px; text-align: center; }
	#list td:nth-child(4) { width: 330px; }
	
	#addForm {
		margin-top: 10px;
		padding: 15px;
	}
	
	#addForm div {
		margin-bottom: 5px;
	}
	
	#addForm label {
		width: 50px;
		display: inline-block;
		text-align: right;
	}
	#addForm input[type='text'] {
		width: 300px;
	}

</style>
</head>
<body>
	
	<h1>사용자 목록 보기</h1>
	
	<table id="list">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>전화</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<td>${dto.name}</td>
				<td>${dto.tel}</td>
				<td>${dto.address}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

	<hr>
	
	<form id="addForm">
	<table id="add">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" id="name" required></td>
		</tr>
		<tr>
			<th>전화</th>
			<td><input type="text" name="call" id="call" required></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" id="address" required></td>
		</tr>
		
	</table>
	</form>
	
	<div>
		<input type="button" value="입력하기" id="btn">
	</div>
			


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$('#btn').click(()=> {
		
		const formData = new FormData(document.getElementById('addForm'));
		
		$.ajax({
			
			type: 'POST',
			url: '/ajax/q05add.do',
			
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			
			data: formData,
			dataType: 'json',
			success: (result)=>{
				alert('나야');
			},
			error: (a,b,c)=>console.log(a,b,c)
			
		});
		
	});
	
	
</script>
</body>
</html>










