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
<body>

	<h1>Ajax</h1>
	
	<form id="form1">
		<div>
			<input type="text" name="txt1" id="txt1" value="강아지">
		</div>
		<div>
			<input type="text" name="txt2" id="txt2" value="고양이">
		</div>
		<div>
			<input type="text" name="txt3" id="txt3" value="토끼">
		</div>
		<div>
			<input type="text" name="txt4" id="txt4" value="사자">
		</div>
		<div>
			<input type="text" name="txt5" id="txt5" value="호랑이">
		</div>
		<div>
			<input type="submit" value="보내기" id="btn1">
		</div>
	</form>
	
	<hr>
	
	<div>
		<input type="button" value="가져오기" id="btn2">
	</div>
	<div id="result" class="panel" title="result"></div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	
	// 템플릿
	/*
	$('#form1').submit(()=> {
		
		$.ajax({
			type: 'GET',
			url: '/ajax/ex10data.do',
			data: '',
			success: (result)=>{},
			error: (a,b,c)=>console.log(a,b,c)
		});
		
		event.preventDefault();
		return false;
		
	});
	*/
	
	//***방법 1***
	
	/*
	$('#form1').submit(()=> {
		
		let data = 'txt1=' + $('#txt1').val() 
				+ '&txt2=' + $('#txt2').val()
				+ '&txt3=' + $('#txt3').val()
				+ '&txt4=' + $('#txt4').val()
				+ '&txt5=' + $('#txt5').val();
		
		$.ajax({
			type: 'GET',
			url: '/ajax/ex10data.do',
			data: data,
			success: (result)=>{},
			error: (a,b,c)=>console.log(a,b,c)
		});
		
		event.preventDefault();
		return false;
		
	});
	*/
	
	//***방법 2***
	
	/*
	$('#form1').submit(()=> {
		
		//객체 전송
		const obj = {
			txt1: $('#txt1').val(),
			txt2: $('#txt2').val(),
			txt3: $('#txt3').val(),
			txt4: $('#txt4').val(),
			txt5: $('#txt5').val()
		};
		
		$.ajax({
			type: 'GET',
			url: '/ajax/ex10data.do',
			data: obj,
			success: (result)=>{},
			error: (a,b,c)=>console.log(a,b,c)
		});
		
		event.preventDefault();
		return false;
		
	});
	*/
	
	//***방법3***
	/*
	$('#form1').submit(()=> {
		
		$.ajax({
			type: 'GET',
			url: '/ajax/ex10data.do',
			data: {
				txt1: '딸기',
				txt2: '바나나',
				txt3: '포도'
			},
			success: (result)=>{},
			error: (a,b,c)=>console.log(a,b,c)
		});
		
		event.preventDefault();
		return false;
		
	});
	*/
	
	//방법 4
	/*
	$('#form1').submit(()=> {
		
// 		alert($('#form1').serialize());
		
		$.ajax({
			type: 'GET',
			url: '/ajax/ex10data.do',
			data: '$('#form1').serialize()',
			success: (result)=>{},
			error: (a,b,c)=>console.log(a,b,c)
		});
		
		event.preventDefault();
		return false;
		
	});
	*/
	
	//1. Object > 주력
	//2. QueryString > serialize()
	
	//방법 5
	/*
	$('#form1').submit(()=> {
		
		//String[] name = req.getParameterValues("name")
		
		const list = [ '사과', '바나나', '딸기', '포도', '귤'];
		
		$.ajax({
			type: 'GET',
			url: '/ajax/ex10data.do',
			traditional: true,
			data: {
				list: list
			},
			success: (result)=>{},
			error: (a,b,c)=>console.log(a,b,c)
		});
		
		event.preventDefault();
		return false;
		
	});
	*/
	
	//방법 6
	
	$('#form1').submit(()=> {
   
      const obj = {
         txt1: $('#txt1').val(),      
         txt2: $('#txt2').val(),      
         txt3: $('#txt3').val(),      
         txt4: $('#txt4').val(),      
         txt5: $('#txt5').val()      
      };
      
      //{"txt1":"강아지","txt2":"고양이","txt3":"토끼","txt4":"사자","txt5":"호랑이"}
      
      //alert(JSON.stringify(obj));
      
      $.ajax({
         type: 'POST',
         url: '/ajax/ex10data.do',
         contentType: 'application/json', //줄때
         data: JSON.stringify(obj),
         //dataType: 'json', //받을때
         success: (result)=>{},
         error: (a,b,c)=>console.log(a,b,c)
      });
         
      event.preventDefault();
      return false;
   });
	
	$('#btn2').click(()=> {
		
		$.ajax({
			type: 'GET',
			url: '/ajax/ex10data.do',
			
			dataType: 'json',
			success: (result)=>{
// 				$('#result').append('<div>' + result.seq + '</div>');
// 				$('#result').append('<div>' + result.question + '</div>');
				
				$(result).each((index, item) => {
					$('#result').append('<div>' + item.name + '</div>');
					$('#result').append('<div>' + item.age + '</div>');
					$('#result').append('<div>' + item.address + '</div>');
					$('#result').append('<hr>');
				});
				
			},
			error: (a,b,c)=>console.log(a,b,c)
			
		});
		
	});
	
	
</script>
</body>
</html>










