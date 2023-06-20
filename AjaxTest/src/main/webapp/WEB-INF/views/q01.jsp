<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h1>[실행]</h1>
	
	<table>
		<tr>
			<th>검색어(동입력) : </th>
			<td>
				<input type="text" id="id1" class="short">
				<input type="button" id="btn1" value="우편번호 검사하기">
			</td>
		</tr>
		<tr>
			<th>검색 결과 : </th>
			<td>
				<select id="id2" class="middle">
				  <option value="">검색해주세요.</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>나머지 주소 : </th>
			<td>
				<input type="text" id="id3" class="long">
			</td>
		</tr>
	</table>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	$('#btn1').click(() => {
		$.ajax({
			type: 'GET',
			url: '/ajax/q01.do', // 수정된 경로
			data: {name: $('#id1').val()}, // 수정된 데이터 파라미터
			dataType: 'json',
			success: (result) => {
				$('#id2').empty(); // 검색 결과 셀렉트 박스 비우기
				$('#id2').append('<option value="">검색해주세요.</option>'); // 기본 옵션 추가
				
				// 검색 결과를 셀렉트 박스에 추가
				$.each(result.list, function(index, item) {
					$('#id2').append('<option value="' + item.zip + '">' + item.sido + ' ' + item.gugun + ' ' + item.dong + ' ' + item.bunji + '</option>');
				});
			},
			error: (a, b, c) => console.log(a, b, c)
		});
	});
</script>
</body>
</html>