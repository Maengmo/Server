<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
	#memberlist img {
		opacity : .3;
	}
	
	#memberlist img.ui-selected {
		opacity : 1;
	}
</style>
</head>
<body>

	<h1>폼 컨트롤 전송하기</h1>
	
	<form method="POST" action="/jsp/ex08ok.jsp">
	
		<table>
			<tr>
				<th>텍스트 박스</th>
				<td><input type="text" name="txt1"></td>
			</tr>
			<tr>
				<th>암호 상자</th>
				<td><input type="password" name="pw1"></td>
			</tr>
			<tr>
				<th>다중 라인 텍스트 박스</th>
				<td><textarea name="txt2"></textarea></td>
			</tr>
			<tr>
				<th>체크 박스</th>
				<td><input type="checkbox" name="cb1"></td>
			</tr>
			<tr>
				<th>체크 박스</th>
				<td><input type="checkbox" name="cb2" value="yes"></td>
			</tr>
			<tr>
			<th>체크 박스들</th>
			<td>
				<h3>당신의 취미?</h3>
				<label><input type="checkbox" name="cb3" value="독서">독서</label>
				<label><input type="checkbox" name="cb4" value="운동">운동</label>
				<label><input type="checkbox" name="cb5" value="코딩">코딩</label>
			</td>
			</tr>
			<tr>
			<th>체크 박스들2</th>
			<td>
				<h3>당신의 취미?</h3>
				<label><input type="checkbox" name="cb" value="독서">독서</label>
				<label><input type="checkbox" name="cb" value="운동">운동</label>
				<label><input type="checkbox" name="cb" value="코딩">코딩</label>
			</td>
			</tr>
			<tr>
			<th>라디오 버튼</th>
			<td>
				<h3>성별?</h3>
				<label><input type="radio" name="rb" value="m" checked>남자</label>
				<label><input type="radio" name="rb" value="f">여자</label>
			</td>
			</tr>
			<tr>
			<th>셀렉트 박스</th>
			<td>
				<select name="sel1">
					<option value="f1">사과</option>
					<option value="f2">바나나</option>
					<option value="f3">귤</option>
				</select>	
			</td>
			</tr>
			<tr>
			<th>셀렉트 박스2</th>
			<td>
				<select name="sel2" multiple>
					<option value="f1">사과</option>
					<option value="f2">바나나</option>
					<option value="f3">귤</option>
				</select>	
			</td>
			</tr>
			<tr>
				<th>히든 태그</th>
				<td><input type="hidden" name="id" value="hong"></td>
			</tr>
			<tr>
				<th>색상</th>
				<td><input type="color" name="color1"></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><input type="date" name="date1"></td>
			</tr>
			<tr>
				<th>범위</th>
				<td><input type="range" name="range1"></td>
			</tr>
			<tr>
				<th>사용자 정의 컨트롤</th>
				<td>
					<div id="memberlist">
						<img src="images/man_01.png" data-name="홍길동">
						<img src="images/man_02.png" data-name="아무개">
						<img src="images/man_03.png" data-name="하하하">
					</div>
					<input type="hidden" name="member" id="member">
				</td>
			</tr>
		</table>
		
		<div>
			<input type="submit" value="보내기">
		</div>
	
	</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="js/jquery-ui.js"><</script>
<script>

	$('#memberlist').selectable({
		
		selected : function(event, ui) {
// 			alert(ui.selected.dataset['name']);
			
			$('#member').val(ui.selected.dataset['name']);
		}
		
	});

</script>
</body>
</html>










