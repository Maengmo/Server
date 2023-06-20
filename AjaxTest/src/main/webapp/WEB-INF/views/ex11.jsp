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

	#tbl1 {
		width : auto;
	}
	#tbl1 td {
		width: 100px;
		height: 100px;
	}
</style>
</head>
<body>

	<h1>테이블 상태 유지</h1>
	
	<table id="tbl1">
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$('#tbl1 td').click(function() {
		
		//rgb(255, 215, 0)
		//$(this).css('background-color', 'gold');
		//alert($(this).css('background-color'));
		
// 		alert(this.cellIndex);	<td>
// 		alert(this.parentElement.rowIndex); <tr>
		let x = this.cellIndex;
		let y = this.parentElement.rowIndex;
		let ck = 'n';
		
		console.log(x,y);
		
		if($(this).css('background-color') == 'rgb(255, 215, 0)') {
			$(this).css('background-color', 'transparent');
			ck = 'n';
		}else {
			$(this).css('background-color', 'gold');
			ck = 'y';
		}
		
		//x, y, ck
		
		$.ajax({
			type: 'POST',
			url: '/ajax/ex11data.do',
			data: {
				x: x,
				y: y,
				ck: ck
			},
			error: (a,b,c)=>console.log(a,b,c)
		});
	});
	
	//셀 상태 설정
	<c:forEach items="${list}" var="dto">
	$('#tbl1 tbody')
		.children().eq(${dto.y})
		.children().eq(${dto.x})
		.css('background-color', '${dto.ck == 'y' ? 'gold' : 'transparent'}');
	</c:forEach>
	
</script>
</body>
</html>










