<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
	
	#cat {
		cursor: pointer;
		left: 481px;
		top: -569px;
	}

</style>
</head>
<body>
	<h2>[실행]</h2>

	<div>
		<img src="/ajax/pic/catty10.png" id="cat" name="cat">
	</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	
	$(document).ready(function() {
	    $("#cat").draggable({
	        stop: function(event, ui) {
	            var x = ui.position.left;
	            var y = ui.position.top;
	            // 드래그 중지 시 수행할 작업
	        }
	    });
	});
	

	
	
	
	


</script>
</body>
</html>










