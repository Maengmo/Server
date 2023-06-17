<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
	table {
		background-color : white;
	}
</style>
</head>
<body>

	<h1>쿠키, Cookie</h1>
	
	<!-- 
	
		쿠키, Cookie
		- 개인 정보를 저장하는 저장소
		- 브라우저가 관리하는 저장소
		- 방문자가 사이트를 접속 > 사이트에 접속한 브라우저(개개인)의 정보를 관리하기 위해서 쿠키에 정보를 입출력
		- JSP(Servlet), JavaScript 등 > 쿠키에 접근해서 조작 가능
	
		쿠키의 종류
		1. 메모리 쿠기
			- 브라우저 실행중에만 유지
			- 브라우저가 종료되면 쿠키도 삭제 
			- 메모리에만 상주
			
		2. 하드 쿠키
			- 브라우저가 종료되도 유지
			- 하드 디스크에 저장
			
	 -->

	<h2>배경 화면 선택(테마)</h2>
	 
	 <table>
	 	<tr>
	 		<td><img src="images/rect_icon01.png"></td>
	 		<td><input type="radio" name="background" value="rect_icon01.png" checked></td>
	 	</tr>
	 	<tr>
	 		<td><img src="images/rect_icon02.png"></td>
	 		<td><input type="radio" name="background" value="rect_icon02.png"></td>
	 	</tr>
	 	<tr>
	 		<td><img src="images/rect_icon03.png"></td>
	 		<td><input type="radio" name="background" value="rect_icon03.png"></td>
	 	</tr>
	 </table>

	<hr>
	
	<div style="background-color : white;">
		<a href="ex20_cookie.one.jsp">첫번째 페이지</a>
		<a href="ex20_cookie.two.jsp">두번째 페이지</a>
		<a href="ex20_cookie.three.jsp">세번째 페이지</a>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="js/cookie.js"></script>
<script>

// 	document.cookie = 100;
	
// 	console.log(documnet.cookie);

// 	key=value&key=value..

	setCookie('name', '홍길동');
	
	console.log(getCookie('name'));
	
	if(getCookie('background') == '') {
		//첫방문
		const date = new Date();
	      date.setFullYear(date.getFullYear() + 1);
	      setCookie('background', 'rect_icon01.png', 365);
	} else {
		//재방문
		$('body').css('background-image', `url(images/\${getCookie('background')})`);
	
		$('input[name=background]').each((index, item) => {
		
			if($(item).val() == getCookie('background')) {
				$(item).prop('checked', true);
			}else {
				$(item).prop('checked', false);
			}
		
		});
	}
	
	$('input[name=background]').change(function() {
	      
	      //alert($(this).val());
	      $('body').css('background-image'
	            , `url(images/\${$(this).val()})`);
	  
	      //선택한 테마 > 쿠키 저장
	      const date = new Date();
	      date.setFullYear(date.getFullYear() + 1);
	      setCookie('background', $(this).val(), 365);
	      
   });

</script>
</body>
</html>










