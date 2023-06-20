<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
   #list {
      
   }
   
   #list th:nth-child(1) { width: 160px; }
   #list th:nth-child(2) { width: 240px; }
   #list th:nth-child(3) { width: 110px; }
   #list th:nth-child(4) { width: 100px; }
   #list th:nth-child(5) { width: 158px; }
   
   #list td:nth-child(1) img { width: 150px; height: 150px; object-fit: cover; }
   #list td { text-align: center; }
   
</style>
</head>
<body>
   <!-- ex13.jsp -->
   
   <h1>Product List</h1>
   
   <table id="list">
      <thead>
         <tr>
            <th>사진</th>
            <th>제품명</th>
            <th>가격</th>
            <th>색상</th>
            <th>편집</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${list}" var="dto">
         <tr>
            <td><img src="/ajax/pic/${dto.pic}"></td>
            <td>${dto.name}</td>
            <td><fmt:formatNumber value="${dto.price}" />원</td>
            <td>${dto.color}</td>
            <td>
               <div>
                  <input type="button" value="수정" onclick="edit();">
                  <input type="button" value="삭제" onclick="del(${dto.seq});">
               </div>
               <div style="display:none;">
                  <input type="button" value="확인" onclick="editok(${dto.seq});">
                  <input type="button" value="취소" onclick="cancel();">
               </div>
            </td>
         </tr>
         </c:forEach>
      </tbody>
   </table>
   
   <hr>
   
   <form id="form1">
   <table id="add">
      <tr>
         <th>제품명</th>
         <td><input type="text" name="name" id="name"></td>
      </tr>
      <tr>
         <th>가격</th>
         <td><input type="number" name="price" id="price" min="0" max="10000000" step="1000"></td>
      </tr>
      <tr>
         <th>색상</th>
         <td>
            <select name="color" id="color">
               <option value="검정색">검정색</option>
               <option value="흰색">흰색</option>
               <option value="회색">회색</option>
            </select>
         </td>
      </tr>
      <tr>
         <th>사진</th>
         <td><input type="file" name="pic"></td>
      </tr>
   </table>
   </form>
   
   <div>
      <input type="button" value="상품 등록하기" id="btn">
   </div>
   

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
   
   $('#btn').click(()=>{
      
      //일반 텍스트 + 첨부 파일 > Ajax 통해서 전송
      const formData = new FormData(document.getElementById('form1'));
            
      $.ajax({
         
         type: 'POST',
         url: '/ajax/ex13add.do',
         
         enctype: 'multipart/form-data',
         processData: false,
         contentType: false,
         
         data: formData,
         dataType: 'json',
         success: (result)=>{
            
            //alert(result.result);
            if (result.result == 1) {
               
               //테이블에 상품을 추가하기(출력)
               let tr = `
               
                  <tr>
                     <td><img src="/ajax/pic/\${result.pic}"></td>
                     <td>\${$('#name').val()}</td>
                     <td>\${parseInt($('#price').val()).toLocaleString()}원</td>
                     <td>\${$('#color').val()}</td>
                     <td>
                        
                        <div>
                        <input type="button" value="수정" onclick="edit();">
                        <input type="button" value="삭제" onclick="del(\${result.seq});">
	                     </div>
	                     <div style="display:none;">
	                        <input type="button" value="확인" onclick="editok(\${result.seq});">
	                        <input type="button" value="취소" onclick="cancel();">
	                     </div>
	                     
                     </td>
                  </tr>
               
               `;
               
               $('#list tbody').prepend(tr);
               
               $('#name').val('');
               $('#price').val('');
               $('#color').val('검정색');
               
               
            } else {
               alert('failed');
            }
            
         },
         error: (a,b,c)=>console.log(a,b,c)
         
      });
      
   });
   
   let temp_name = '';
   let temp_price = '';
   let temp_color = '';
   
   function edit() {
      
      let tr = event.target.parentElement.parentElement.parentElement;
      
      let name = $(tr).children().eq(1).text();
      $(tr).children().eq(1).html('<input type="text" class="short" value="' + name + '">');
      
      let price = $(tr).children().eq(2).text();
      $(tr).children().eq(2).html('<input type="number" class="short" value="' + price.replace('원', '').replace(/,/g, '') + '" min="0" max="10000000" step="1000">');
      
      let color = $(tr).children().eq(3).text();
      $(tr).children().eq(3).html(
            `
               <select name="color" id="color2">
                  <option value="검정색">검정색</option>
                  <option value="흰색">흰색</option>
                  <option value="회색">회색</option>
               </select>
            `   
      );
      
      $('#color2').val(color);
      
      
      
      $(event.target).parent().parent().children().last().show();
      $(event.target).parent().hide();
      
      temp_name = name;
      temp_price = price;
      tmep_color = color;
      
   }
   
   function del(seq) {
      
      let tr = event.target.parentElement.parentElement.parentElement; //<tr>
      
      $.ajax({
         type: 'POST',
         url: '/ajax/ex13del.do',
         data: {
            seq: seq
         },
         dataType: 'json',
         success: (result)=>{
            
            if (result.result == 1) {
               
               //화면에 있는 상품 안보이게 처리
               $(tr).remove();
               
            } else {
               alert('failed');
            }
            
         },
         error: (a,b,c)=>console.log(a,b,c)
         
      });
      
   }
   
   
   function editok(seq) {
      
	   let name = $(event.target).parent().parent().parent().children().eq(1).children().eq(0).val();
	   let price = $(event.target).parent().parent().parent().children().eq(2).children().eq(0).val();
	   let color = $(event.target).parent().parent().parent().children().eq(3).children().eq(0).val();
	   
	   const btn = event.target;
	   
	   $.ajax({
		  type: 'POST',
		  url: '/ajax/ex13edit.do',
		  data: {
			  seq: seq,
			  name: name,
			  price: price,
			  color: color
		  },
		  dataType: 'json',
		  success: (result)=>{
			 
			  $(btn).parent().hide();
		      $(btn).parent().parent().children().first().show();
		      
		      //제품명
		      let name = $(btn).parent().parent().parent().children().eq(1).children().eq(0).val();
		      //alert(name);
		      $(btn).parent().parent().parent().children().eq(1).text(name);   
		      
		      //가격
		      let price = $(btn).parent().parent().parent().children().eq(2).children().eq(0).val();
		      $(btn).parent().parent().parent().children().eq(2).text(price);   
		      
		      //색상
			  let color = $(btn).parent().parent().parent().children().eq(3).children().eq(0).val();
		      $(btn).parent().parent().parent().children().eq(3).text(color);   
			  
			  
		  },
		  error: (a,b,c)=>console.log(a,b,c)
	   });
	   
   }
   
   function cancel() {
      
      $(event.target).parent().hide();
      $(event.target).parent().parent().children().first().show();
      
      //제품명
      //alert(name);
      $(event.target).parent().parent().parent().children().eq(1).text(temp_name);   
      
      //가격
      $(event.target).parent().parent().parent().children().eq(2).text(temp_price);   
      
      //색상
	  $(event.target).parent().parent().parent().children().eq(3).text(tmep_color);   
      
   }
   
</script>
</body>
</html>







