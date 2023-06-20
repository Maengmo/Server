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

	<h1>아이디 중복검사</h1>
	
	<h3>새창 띄우기 방식</h3>
	
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="id1" class="short" readonly>
				<input type="button" id="btn1" value="중복검사">
			</td>
		</tr>
	</table>
	
	<div>
		다른 업무 : <input type="text">
	</div>
	
	<h3>Ajax 방식</h3>
	
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="id2" class="short">
				<input type="button" id="btn2" value="중복검사">
				<span id="result"></span>
			</td>
		</tr>
	</table>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$('#btn1').click(() => {
		
		window.open('/ajax/ex08check.do', 'idcheck', 'width=350 height=300');
		
	});
	
	$('#btn2').click( ()=> {
		
		$.ajax({
			
			type: 'GET',
			url: '/ajax/ex08data.do',
			data: 'id=' + $('#id2').val(),
			dataType: 'json',
			success: (result)=>{
				
				if(result.result ==1) {
					$('#result').text('중복된 아이디');
				} else {
					$('#result').text('사용가능한 아이디');
				}
				
			},
			error: (a,b,c)=>console.log(a,b,c)
			
		});
		
	});
	
</script>
</body>
</html>










