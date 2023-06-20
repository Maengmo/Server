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

	<h1>우편번호 검색</h1>
	
	<table>
		<tr>
			<th>검색어(동입력)</th>
			<td>
			<input type="text" id="dong" class="short">
			<input type="button" id="btn1" value="검색하기">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<select id="address1">
					<option value="0">검색해주세요.</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td><input type="text" id="address2"></td>
		</tr>
	</table>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$('#dong').keydown(()=> {
		
		if (event.keyCode == 13) {
			$('#btn1').click(); //에뮬레이터 함수
		}
		
	});

	$('#address1').change(()=>{
		$('#address2').focus();
	});

	$('#btn1').click(()=> {
		
		$('#address1').html(''); 
		
		$.ajax({
			
			type: 'GET',
			url: '/ajax/ex09data.do',
			
			data:'dong=' + $('#dong').val(),
			dataType: 'json',
			
			success: (result)=>{
				$(result).each((index, item) => {
					$('#address1').append(
						`
							<option value=''>\${item}</option>
						`
					);
				});
			},
			error: (a,b,c)=>console.log(a,b,c)
			
		});
		
	});

</script>
</body>
</html>










