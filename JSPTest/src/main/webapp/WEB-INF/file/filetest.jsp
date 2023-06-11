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
   <!-- filetest.jsp -->
   <h1>파일 업로드</h1>
   
   <!--  
      파일 업로드는 반드시 POST 메소드를 사용한다.   
      - enctype="application/x-www-form-urlencoded" > 모두 문자열
      - enctype="multipart/form-data" > 문자열 + 이진 데이터
   -->
   
   <form method="POST" action="/jsp/filetestok.do" 
         enctype="multipart/form-data">   
   <table>
      <tr>
         <th>텍스트</th>
         <td><input type="text" name="txt"></td>
      </tr>
      <tr>
         <th>파일</th>
         <td><input type="file" name="attach"></td>
      </tr>
   </table>
   
   <div>
      <input type="submit" value="업로드">
   </div>
   </form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>