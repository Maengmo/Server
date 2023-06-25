<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Project</title>

<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/toy/asset/css/tagify.css">

<style>
	#pic {
		width: 550px;
		display: block;
	}
	
	#map {
		width: 550px;
		height: 400px;
	}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1 class="page">장소 <small>상세보기</small></h1>
		
		<table class="vertical">
			<tr>
				<th>장소명</th>
				<td>${dto.name}</td>
			</tr>
			<tr>
				<th>설명</th>
				<td>${dto.content}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.uname}(${dto.id})</td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td><small>${dto.regdate}</small></td>
			</tr>
			<tr>
				<th>해시태그</th>
				<td>
					<input type="text" id="hashtag" readonly>
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td><img src="/toy/asset/place/${dto.pic}" id="pic"></td>
			</tr>
			<c:if test="${not empty lat && not empty lng}">
			<tr>
				<th>위치</th>
				<td><div id="map"></div></td>
			</tr>
			</c:if>
		</table>
		<div>
			<button type="button" class=back"
				onclick="location.href='/toy/place/place.do';">돌아가기</button>
		</div>
	</main>


<script src="/toy/asset/js/jQuery.tagify.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b34a8317f5befe832f9eefe047ae818"></script>
<script>
	<c:if test="${not empty lat and not empty lng}">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	
	var options = { //지도를 생성할 때 필요한 기본 옵션
	   center: new kakao.maps.LatLng(${lat}, ${lng}), //지도의 중심좌표.
	   level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	var m = new kakao.maps.Marker({
		position: new kakao.maps.LatLng(${lat}, ${lng})
	});
	
	m.setMap(m\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	</c:if>
	
	let temp = '';
	
	<c:forEach items="${dto.hashtag}" var="tag">
		temp += '${tag},';	
	</c:forEach>
	
	$('#hashtag').val(temp);
	//$('#hashtag').tagify();
	
	/*
	$('#hashtag').tagify().on('click', function(e) {
		alert(e.detail);
	});
	*/
	
	const tagify = new Tagify(document.querySelector('#hashtag'), {});
	   
    tagify.on('click', test);
   
    function test(e) {
      //alert(e.detail.data.value);   
      location.href = '/toy/place/place.do?tag=' + e.detail.data.value;
    }

	
</script>
</body>
</html>










