<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
   #files > div { margin-bottom: 5px; }
   
   .item { margin-bottom: 5px; }
</style>
</head>
<body>
   <!-- multifile.jsp -->
   <h1>다중 파일 업로드</h1>
   
   <form method="POST" action="/file/multifileok.do" enctype="multipart/form-data">
   <div>
      <div>이름: </div>
      <div><input type="text" name="name"></div>
   </div>
   <div id="files">
      <div>파일: </div>
      <div class="item"><input type="file" name="attach1"></div>
      <div id="list"></div>
      <div><input type="button" value="+" id="btnadd"></div>
   </div>
   <div>
      <input type="submit" value="업로드">
   </div>
   </form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

   let n = 2;

   $('#btnadd').click(()=>{
   
      $('#list').append(
            `<div class="item">
               <input type="file" name="attach\${n}">
               <input type="button" value="X" onclick="$(this).parent().remove();">
            </div>`);
      
      n++;
      
   });
   

</script>
</body>
</html>









