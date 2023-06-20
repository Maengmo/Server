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

	<h1>게시판</h1>
	
	<table>
		<tr>
			<th>번호</th>
			<th>제품명</th>
			<th>가격</th>
			<th>색상</th	>		
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.seq}</td>
			<td>${dto.name}</td>
			<td>${dto.price}</td>
			<td>${dto.color}</td>
		</tr>
		</c:forEach>
	</table>
	
	<div style="text-align: center;">
		<input type="button" value="게시물 더보기" id="btn">
	</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	let n = 11;

	$('#btn').click(()=>{
		
		//10개 더 가져오기 > 화면 출력
		
		$.ajax({
			
			type: 'POST',
			url: '/ajax/ex14data.do',
			data: {
				n: n
			},
			dataType: 'json',
			success: (result)=>{
				
				$(result).each((index, item)=>{
					
					$('table tbody').append(
						`
						
							<tr>
								<td>\${item.seq}</td>
								<td>\${item.name}</td>
								<td>\${item.price}</td>
								<td>\${item.color}</td>
							</tr>
					
						`
					);
					
				});
				
				n += 10;
				
// 				console.log(result.length);

				if (result.length == 0) {
					alert('더 이상 게시물이 없습니다.');
					$('#btn').attr('disabled', true);
				}
				
			},
			error: (a,b,c)=>console.log(a,b,c)
			
		});
		
	});

</script>
</body>
</html>










