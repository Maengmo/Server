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

   .line {
      display: block;
      width: calc(100% - 20px);
      border: 0px;
      border-bottom: 1px solid #999;
      border-radius: 0;
      margin-bottom: 5px;
   }
   
   #message {
      width: 100%;
      height: 100vh;
      background-color: rgba(0, 0, 0, .1);
      position:absolute;
      left: 0;
      top: 0;
      display: none;
      justify-content: center;
      align-items : center;
   }
   
   #message > div {
   		width: 150px;
   		height: 20px;
   		background-color: white;
   }

</style>
</head>
<body class="narrow">
   <!-- ex12.jsp -->
   
   <h1>Journal</h1>
   
   <div>
      
      <c:forEach items="${list}" var="dto" varStatus="status">
      <input type="text"
            name="line${status.count}" 
            id="line${status.count}" 
            class="line"
            value="${dto.line}">
      </c:forEach>
       <!-- 
       <input type="text" name="line2" id="line2" class="line">
       <input type="text" name="line3" id="line3" class="line">
       <input type="text" name="line4" id="line4" class="line">
       <input type="text" name="line5" id="line5" class="line">
       <input type="text" name="line6" id="line6" class="line">
       <input type="text" name="line7" id="line7" class="line">
       <input type="text" name="line8" id="line8" class="line">
       <input type="text" name="line9" id="line9" class="line">
       <input type="text" name="line10" id="line10" class="line">
       <input type="text" name="line11" id="line11" class="line">
       <input type="text" name="line12" id="line12" class="line">
       <input type="text" name="line13" id="line13" class="line">
       <input type="text" name="line14" id="line14" class="line">
       <input type="text" name="line15" id="line15" class="line"> 
       -->
   </div>
   
   <div id="message">
      <div>자동 저장되었습니다.</div>
   </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

   let timer = 0;
   
   $('.line').keydown(function() {
      clearTimeout(timer);
      
      let temp = this;
      
      timer = setTimeout(function() {
         //$(temp).blur();
         
         let seq = $(temp).index() + 1;
         let line = $(temp).val();
         
         $.ajax({
            type: 'POST',
            url: '/ajax/ex12data.do',
            data: {
               seq: seq,
               line: line
            },
            error: (a,b,c)=>console.log(a,b,c)
         });
         
      }, 5000);
      
   });
   
   $('.line').focus(function() {
      
      let temp = this;
      
      timer = setTimeout(function() {
         $(temp).blur();
      }, 5000);
      
   });

   $('.line').blur(function() {

      //alert($(event.target).index());
      let seq = $(this).index() + 1;
      let line = $(this).val();
      
      $.ajax({
         type: 'POST',
         url: '/ajax/ex12data.do',
         data: {
            seq: seq,
            line: line
         },
         error: (a,b,c)=>console.log(a,b,c)
      });
      
      //안내 메시지
      $('#message').css('display', 'flex');
      
      setTimeout(function() {
    	  $('#message').css('display', 'none');
      }, 500);
      
   });

</script>
</body>
</html>









