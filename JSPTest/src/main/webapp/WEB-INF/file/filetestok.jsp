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
	
	<h1>결과</h1>
	
	<div>
		
		<div>txt : ${txt}</div>
		<div>orgfilename : ${orgfilename}</div>
		<div>filename : ${filename}</div>
		
		<hr>
		<div>다운로드 : <a href="/jsp/uploads/${filename}" download > ${filename}</a></div>
		</div>
		
		<hr>
		<div>
			다운로드 :
			<a href="/jsp/download.do?filename=${filename}&orgfilename=${orgfilename}">${orgfilename}</a>
		</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>










