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
<body class="narrow">

	<h1>Ajax 요청</h1>
	
	<div>
		<input type="button" value="확인" id="btn1">
		<hr>
		<div id="div1"></div>
	</div>
	<hr>
	
	<div>
		<input type="text" id="txt2">
		<input type="button" value="전송" id="btn2">
		<hr>
		<div id="div2"></div>
	</div>
	
	<hr>
	
	<div>
		<input type="text" id="txt3">
		<input type="button" value="전송" id="btn3">
		<hr>
		<div id="div3"></div>
	</div>
	
	<hr>
	<div>
		다른 작업 : <input type="text">
	</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$('#btn1').click( () => {
		
		const ajax = new XMLHttpRequest();
		
		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4 && ajax.status == 200) {
				//요청한 데이터를 올바르게 수신할 수 있는 순간!!
				
				$('#div1').text(ajax.responseText);
				alert(ajax.responseText);
		
			}
		};
		
// 		ajax.open('GET', '/ajax/ex05.txt');
		ajax.open('GET', '/ajax/ex05data.do');
		
		ajax.send(); //연결 + 접속 + 요청
		
	});

	$('#btn2').click( ()=> {
		
		const ajax = new XMLHttpRequest();
		
		//ajax > (데이터) > 서버
		//1. GET > QueryString
		//2. POST
		
// 		ajax.open('GET', '/ajax/ex05data.do?txt2=' + $('#txt2').val());
		
		
		ajax.open('POST', '/ajax/ex05data.do');
		
		ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		
		ajax.send('txt2=' + $('#txt2').val());
	
	});
	
	$('#btn3').click(() => {
		
		const ajax = new XMLHttpRequest();
		
		//데이터 수신
		ajax.onreadystatechange = function() {
			
			if (ajax.readyState == 4 && ajax.status == 200) {
				$('#div3').text(ajax.responseText);
			}
			
		};
		
		ajax.open('GET', '/ajax/ex05data.do?txt3= + $('#txt3').val()');
		
		//데이터 송신
		ajax.send();
		
		
	});
	
</script>
</body>
</html>










