<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">


<style>

</style>
</head>
<body>

	<h1> 버튼 만들기</h1>

	<form method="POST" action="ex09ok.jsp">
	
	<table>
		<tr>
			<th>너비(px)</th>
			<td><input type="number" min="20" max="300" step="10" name="width" value="100"></td>
		</tr>
		<tr>
			<th>높이(px)</th>
			<td><input type="number" min="10" max="200" step="10" name="height" value="50"></td>
		</tr>
		<tr>
			<th>텍스트</th>
			<td><input type="text" name="txt"></td>
		</tr>
		<tr>
			<th>버튼 갯수</th>
			<td><input type="number" name="ea" value="1" min="1" max="30" value="1"></td>
		</tr>
		<tr>
			<th>배경색</th>
			<td><input type="color" name="backgroundcolor" value="#FFFFFF" class="form-control tiny"></td>
		</tr>
		<tr>
			<th>글자색</th>
			<td><input type="color" name="color" value="#FFFFFF" class="form-control tiny"></td>
		</tr>
		<tr>
			<th>글자 크기(px)</th>
			<td><input type="number" min="10" max="100" name="fontSize" value="10"></td>
		</tr>
		<tr>
			<th>버튼 간격</th>
			<td>
			<div>좌우 간격 : <input type="range" min="0" max="50" value="0" name="leftright"></div> 
			<div>상하 간격 : <input type="range" min="0" max="50" value="0" name="topbottom"></div>
			</td>
		</tr>
		<tr>
				<th>아이콘</th>
				<td>
					<div><input type="radio" name="icon" value="none" checked> 없음
					<div><input type="radio" name="icon" value="glyphicon glyphicon-heart"> <span class="glyphicon glyphicon-heart"></span></div>
					<div><input type="radio" name="icon" value="glyphicon glyphicon-headphones"> <span class="glyphicon glyphicon-headphones"></span></div>
					<div><input type="radio" name="icon" value="glyphicon glyphicon-camera"> <span class="glyphicon glyphicon-camera"></span></div>
					<div><input type="radio" name="icon" value="glyphicon glyphicon-facetime-video"> <span class="glyphicon glyphicon-facetime-video"></span></div>
					<div><input type="radio" name="icon" value="glyphicon glyphicon-magnet"> <span class="glyphicon glyphicon-magnet"></span></div>
				</td>
			</tr>
		<tr>
				<th>테두리</th>
				<td>
					<select name="isborder" id="isborder" class="form-control sm">
						<option value="n">감추기</option>
						<option value="y">보이기</option>
					</select>
					<div id="borderbox" class="well">
						<div>두께(px) : <input type="number" name="borderwidth" min="0" max="10" value="1" class="form-control sm inline right"></div>
						<div>색상 : <input type="color" name="bordercolor" value="#000000" class="form-control sm inline"></div>
						<div>
							스타일 :
							<select name="borderstyle" class="form-control sm inline">
								<option value="solid">실선</option>
								<option value="dashed">쇄선</option>
								<option value="dotted">점선</option>
							</select>	
						</div>
						<div>
							모서리(px) : <input type="number" name="borderradius" min="0" max="50" value="0" class="form-control sm inline right">
						</div>
					</div>
				</td>
			</tr>
			</table>
			<div>
				<input type="submit" value="만들기"
					class="btn btn-success">
			</div>
	</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	$("#isborder").change(function() {
		if ($(this).val() == "y") {
			$("#borderbox").show();
		} else {
			$("#borderbox").hide();
		}
	});
</script>
</body>
</html>










