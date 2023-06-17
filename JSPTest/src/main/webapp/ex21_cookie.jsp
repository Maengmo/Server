<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>

	#txtid, #txtpw {
		width : 120px;
	}
	
	table th {
		width : 120px !important;
	}
	
	table td {
		width : 180px !important;
	}

</style>
</head>
<body>

	<h1>로그인</h1>
	
	<table class="vertical" style="width:300px;">
		<tr>
			<th>아이디</th>
			<td><input type="text" id="txtid"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="txtpw"></td>
		</tr>
	</table>

	<div>
		<input type="checkbox" id="cb"> 아이디 기억하기
		<input type="button" value="로그인" id="btn">
	</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="js/cookie.js"></script>
<script>
	
	$('#btn').click(function() {
		
		//로그인
		if ($('#txtid').val() == 'hong' && $('#txtpw').val() == '1234') {
			
			location.href = 'ex20_cookie.one.jsp'
			
			if($('#cb').prop('checked')) {
				//alert('O');
				setCookie('id', $('#txtid').val(), 365);
			} else {
				//alert('X');
				setCookie('id', '', -1); //어제
			}
			
		}else {
			alert('아이디 or 암호가 일치하지 않습니다.');
		}
		
	});
	
	
	if(getCookie('id') != '') {
		//id가 있으면
		$('#txtid').val(getCookie('id'));
		$('#txtpw').focus();
		$('#cb').prop('checked', true);
	} else {
		$('#txtid').focus();
	};
	
</script>
</body>
</html>










