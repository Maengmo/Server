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
   <!-- ex06.jsp -->
   <h1>Ajax <small>jQuery</small></h1>
   
   <div>
      <input type="text" id="txt1">
      <input type="button" value="확인" id="btn1">
      <div id="div1"></div>
   </div>   

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

   $('#btn1').click(()=>{
      
      //$(검색 태그).메소드()
      
      //ajax 요청
      //- ajax.send();
      $.ajax({
         
         //페이지 요청 정보
         type: 'GET',
         url: '/ajax/ex06data.do',
         
         //데이터 전송(QueryString + GET/POST)
         data: 'txt1=' + $('#txt1').val(),
         
         //데이터 수신
         success: function(result) {
            $('#div1').text(result);
         },
         
         //ajax 예외 처리
         error: function(a,b,c) {
            console.log(a,b,c);
         }
         
      });
      
   });
   
   $('#btn1').click(()=>{
      
      //Ajax, 비동기(async)
      
      //네트워크 통신
      //1. 동기 통신
      //2. 비동기 통신
      
      $.ajax({
    	 type: 'GET',
    	 url : '/ajax/ex06data.do',
    	 async : true, //비동기(true), 동기(false)
    	 success : function(result) {
    		 $('#div1').text(result);
    	 },
    	 error : function(a,b,c) {
    		 console.log(a,b,c);
    	 }
      });
      
   });

</script>
</body>
</html>









