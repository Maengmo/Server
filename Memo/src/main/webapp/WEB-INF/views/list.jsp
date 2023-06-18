<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Memo</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
   
   main {
      padding: 10px;
   }
   
   main::after {
      content: '';
      display: block;
      clear: both;
   }
   
   .item {
      /* display: inline-block; */
      float: left;
      width: 180px;
      height: 200px;
      margin: 10px 5px;
      position: relative;
      left: 0;
      top: 0;
   }
   
   .item > span {
      position: absolute;
      right: 3px;
      top: 0px;
      font-size: 2rem;
   }
   
   .item > div:nth-child(2) {
      margin: 30px 15px;
   }

   .item > div:nth-child(3) {
      position: absolute;
      right: 5px;
      bottom: 3px;
      font-size: 12px;
      color: #999;
   }
   
   .item > div:nth-child(4) {
      position: absolute;
      left: 3px;
      bottom: 3px;
      font-size: 12px;
      display: none;
   }

   .item:hover > div:nth-child(4) {
      display: block;
   }
   
   .item > div:nth-child(4) > span {
   		cursor : pointer;
   }
   
   
   
</style>
</head>
<body>
   <!-- list.jsp -->
   <h1>Memo <small>List</small></h1>
   
   <main>

      <c:forEach items="${list}" var="dto">
      <div class="item" style="background-color: #${dto.color};">
         <span class="material-symbols-outlined">${dto.icon}</span>
         <div>${dto.memo}</div>
         <div>${dto.regdate}</div>
         <div>
            <span onclick="location.href='/memo/edit.do?seq=${dto.seq}';">[e]</span>
            <span onclick="del(${dto.seq})">[d]</span>
         </div>
      </div>
      </c:forEach>
      
   </main>
   
   <div>
      <input type="button" value="추가하기"
         onclick="location.href='/memo/add.do';">
   </div>


<script>

	function del(seq) {
		
		if (confirm('delete')) {
			location.href = '/memo/del.do?seq=' + seq;
		}
		
	}

</script>
</body>
</html>









