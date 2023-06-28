<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<h1 id="title">Java Crawling</h1>
	
	<p class="desc">자바 크롤링 테스트</p>
	<p class="desc">Jsoup 라이브러리 사용</p>
	
	<hr>
	
	<h2>다른 데이터</h2>
	
	<div id = "items"></div>	



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	load();
	
	function load() {
		
		const list = ['자바', '오라클', '스프링'];
		
		list.forEach(item=>{
				$('#items').append(`<div class="item">\${item}</div>`);
		});
		
	}
</script>
</body>
</html>










