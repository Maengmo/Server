<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Project</title>

<%@ include file="/WEB-INF/views/inc/asset.jsp" %>

<style>

	#list th:nth-child(1) {width : 50px;}
	#list th:nth-child(2) {width : auto;}
	#list th:nth-child(3) {width : 70px;}
	#list th:nth-child(4) {width : 120px;}
	#list th:nth-child(5) {width : 50px;}
	
	#list td { text-align: center; }
	#list td:nth-child(2) { text-align: left; }
	
	.isnew {
		font-size: 14px;
		color: red;
	}
	
	.comment-count {
		font-size: 12px;
		color: #777;
	}
	
	#searchForm {
		margin-bottom: 15px;
		text-align: center;
	}
	
	#searchForm > * {
		box-sizing: border-box;
		height: 34px;
	}

</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1 class="sub">
			게시판 
			<c:if test="${map.search == 'n'}">
			<small>목록</small>
			</c:if>
			<c:if test="${map.search == 'y'}">
			<small>검색</small>
			</c:if>
			
			<%--
			<span id="pagebar" style="float: right; margin-top: -5px;">
				<input type="number" id="page" class="short" min="1" max="${totalPage}" value="${nowPage}">
				<input type="button" value="이동" onclick="location.href='/toy/board/board.do?page=' + $('#page').val() + '&column=${map.column}&word=${map.word}';">
			</span>
			 --%>
			 
			 
			<span id="pagebar" style="float: right;">
				<select onchange="location.href='/toy/board/board.do?page=' + $(this).val() + '&column=${map.column}&word=${map.word}';">
					<c:forEach var="i" begin="1" end="${totalPage}">
					<option value="${i}" <c:if test="${i == nowPage}">selected</c:if>>${i}페이지</option>
					</c:forEach>
				</select>
			</span>
			
			
		</h1>
		<c:if test="${map.search == 'y'}">
		<div style="text-align: center;">
			'${map.word}'(으)로 검색한 결과 ${totalCount}건이 있습네다.
		</div>
		</c:if>
		
		<table id="list">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>읽음</th>
			</tr>
			<c:if test="${list.size() == 0}">
			<tr>
				<td colspan="5">게시물이 없습니다.</td>
			</tr>
			</c:if>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>
					<c:if test="${dto.depth == 0}">
						${dto.seq}
					</c:if>
					<c:if test="${dto.depth > 0}">
						답변
					</c:if>
				</td>
					
				<td>
					<c:if test="${dto.depth > 0}">
						<span class="material-symbols-outlined" style="font-size:15px; margin-left: ${dto.depth * 20}px;">
						subdirectory_arrow_right
						</span>
					</c:if>
					
					<!-- 제목(링크) -->
					<a href="/toy/board/view.do?seq=${dto.seq}&column=${map.column}&word=${map.word}&search=${map.search}">${dto.subject}</a>
					
					<!-- 댓글 개수 -->
					<c:if test="${dto.ccnt > 0}">
					<span class="comment-count">(${dto.ccnt})</span>
					</c:if>
					<!-- 새글 표시 -->
					<c:if test="${dto.isnew < 30 / 24 / 60}">
						<span class="isnew">new</span>
					</c:if>
				</td>
				<td>${dto.name}</td>
				<td>${dto.regdate}</td>
				<td>${dto.readcount}</td>
			</tr>
			</c:forEach>
		</table>
		
		<!-- <form method="GET"> 사용 사례 -->
		<form id="searchForm" action="/toy/board/board.do" method="GET">
			<select name="column">
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="word" class="long" required>
			<input type="submit" value="검색하기">
		</form>
		
		<div id="pagination" style="text-align : center; margin-bottom: 10px;">${pagination}</div>
		
		<div>
			<c:if test="${not empty id}">
			<button type="button" class="add Primary" onclick="location.href='/toy/board/add.do?mode=new';">글쓰기</button>
			</c:if>
			<button type="button" class="list Primary" onclick="location.href='/toy/board/board.do';">목록보기</button>
			
		</div>
		
	</main>




<script>

	<c:if test="${map.search == 'y'}">
	$('select[name=column]').val('${map.column}');
	$('input[name=word]').val('${map.word}');
	</c:if>
</script>
</body>
</html>










