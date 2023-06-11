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

</style>
</head>
<body>

	<h1>Address</h1>
	
	<!-- 
	
		JSP 페이지에서 자바 구문을 사용하지 말자!!
		- 지저분함;;
		
	
		EL, Expression Language
		- 표현식 언어
		- 자바의 값을 HTML 문서에 출력하는 역할
		- 내장 객체(pageContext, request, session, application)안에 있는 데이터를 출력하는 언어
		- 일반 데이터는 출력 불가능;;
	
	 -->
	 
	 <div>
	 	<!-- 기존 표현식 -->
	 	<div>주소록 총 인원수 : <%= request.getAttribute("count") %></div>
	 	<!-- EL 표현식 -->
	 	<div>주소록 총 인원수 : ${count} </div>
	 	
	 	<!-- X2를 할 경우 -->
	 	<!-- 기존 표현식 -->
	 	<div>주소록 총 인원수 : <%= (int)request.getAttribute("count") * 2 %></div>
	 	<!-- EL 표현식 -->
	 	<div>주소록 총 인원수 : ${count * 2} </div>
	 	
	 	<hr>
	 	
	 	<!-- 리터럴 표현 -->
	 	
	 	<div>${100}</div>
	 	<div>${3.14}</div>
	 	<div>${"홍길동"}</div>
	 	<div>${'홍길동'}</div>
	 	<div>${true}</div>
	 	<div>${null}</div>
	 	
	 	<hr>
	 	
	 	<!-- 배열 -->
	 	<div>${nums}</div>
	 	<div>${nums[0]}</div>
	 	
	 	<hr>
	 	
	 	<!-- List -->
	 	<div>${nums2}</div>
	 	<div>${nums2.get(0)}</div>
	 	<div>${nums2[0]}</div>
	 	
	 	<hr>
	 	
	 	<!-- Map -->
	 	<div>${nums3}</div>
	 	<div>${nums3.get("kor")}</div>
	 	<div>${nums3["kor"]}</div>
	 	<div>${nums3.kor}</div>
	 	
	 	<hr>
	 	
	 	<!-- Object -->
	 	<div>${vo}</div>
	 	<div>${vo.getName()}</div>
	 	<div>${vo["name"]}</div>
	 	<div>${vo.name}</div>
	 	
	 	<hr>
	 	
	 	<!-- 연산자 -->
	 	
	 	<div>a: ${a}</div>
	 	<div>b: ${b}</div>
	 	
	 	<div>a + b : <%= (int)request.getAttribute("a") + (int)request.getAttribute("b") %></div>

	 	<div>a + b : ${a + b}</div>
	 	<div>a - b : ${a - b}</div>
	 	<div>a * b : ${a * b}</div>
	 	<div>a / b : ${a / b}</div>
	 	<div>a % b : ${a % b}</div>
	 	<div>a % b : ${a div b}</div>
	 	<div>a / b : ${a mod b}</div>
	 	
	 	<hr>
	 	
	 	<div>${a > b}</div>
	 	<div>${a gt b}</div>
	 	<div>${a >= b}</div>
	 	<div>${a ge b}</div>
	 	<div>${a < b}</div>
	 	<div>${a lt b}</div>
	 	<div>${a <= b}</div>
	 	<div>${a le b}</div>
	 	<div>${a == b}</div>
	 	<div>${a eq b}</div>
	 	<div>${a != b}</div>
	 	<div>${a ne b}</div>
	 	
	 	<hr>
	 	
	 	<div>${a > 10 && b < 5}</div>
	 	<div>${a > 10 and b < 5}</div>
	 	<div>${a > 10 || b < 5}</div>
	 	<div>${a > 10 or b < 5}</div>
	 	<div>${!(a>10)}</div>
	 	<div>${not(a>10)}</div>
	 	
	 	<hr>
	 	
	 	<div>${a > 0 ? "양수" : "음수"}</div>
	 	
	 	<hr>

		<%
		
			//pageContext > request > session > application
		
			pageContext.setAttribute("age", 20);
			request.setAttribute("age", 30);
			session.setAttribute("age", 40);
			application.setAttribute("age",50);
		
		%>
		<div>나이 <%= pageContext.getAttribute("age") %></div>
		<div>나이 <%= request.getAttribute("age") %></div>
		
		<div>나이 : ${age}</div>

		<div>나이 : ${pageScope.age}</div>
		<div>나이 : ${requestScope.age}</div>
		<div>나이 : ${sessionScope.age}</div>
		<div>나이 : ${applicationScope.age}</div>
	 	
	 	
	 	
	 	<!-- 
	 	
	 		JSTL, JSP Standard Tag Library
	 		- 자바 서버페이지 표준 태그 라이브러리
	 	
	 	 -->
	 	
	 
	 </div>
	 
	 <hr>
	 
	 <!-- 값을 출력하는 명령 -->
	 <c:out value="안녕하세요."></c:out>
	 
	 <c:out value="${count}"></c:out>
	 
	 ${count}
	 
	 <c:out value="${count2}">값이 없음</c:out>
	 
	 ${count2}
	 
	 <hr>
	 
	 <!-- 변수 생성 -->
	 <c:set var="n1" value="100" scope="page"></c:set>
	 
	 <div>${pageScope.n1}</div>
	 <div>${requestScope.n1}</div>
	 <div>${sessionScope.n1}</div>
	 <div>${applicationScope.n1}</div>
	 
	 <hr>
	 <!-- 변수 수정 -->
	 <c:set var="age" value="11"></c:set>
	 <c:set var="age" value="22"></c:set>
	 
	 <div>${age}</div>
	 
	 <hr>
	 <!-- 변수 삭제 -->
	 <c:remove var="age"/>
	 
	 <div>age : ${empty age}</div>
	 
	 <hr>
	 
	 <c:set var="num" value="10"></c:set>
	 
	 <!-- 조건문(if) -->
	 <c:if test="${num > 0}">
	 	<div>${num}은 양수 입니다.</div>
	 </c:if>
	 <c:if test="${num <= 0}">
	 	<div>${num}은 양수가 아닙니다.</div>
	 </c:if>
	 
	 <hr>
	 
	 <!-- 조건문(choose - when) -->
	 <c:choose>
	 	<c:when test="${num > 0}">양수</c:when>
	 	<c:when test="${num < 0}">음수</c:when>
	 	<c:when test="${num == 0}">빵</c:when>	 	
	 	<c:otherwise>기본값</c:otherwise>
	 </c:choose>
	 
	 <hr>
	 
	 <!-- 반복문(for문, 향상된 for문) -->
	 
	 <!-- for (String name : names) -->
	 
	 <c:forEach var="name" items="${names}">
		<div>${name}</div>
	 </c:forEach>
	
	<hr>
	
	<c:forEach var="i" begin="1" end="5" step="1">
		<div>${i}</div>
	</c:forEach>
	
	<hr>
	
	<c:forEach items="${names}" var="name" begin="2" end="4">
		<div>${name}</div>
	</c:forEach>
	
	<c:forEach items="${names}" var="name" varStatus="status">
		<div>${status.index}. 
			${status.count}. 
			${status.first}.
			${status.last}.
			${name}</div>
	</c:forEach>
	
	<hr>
	
	<c:forEach items="${colors}" var="name">
		<div>${name}</div>
	</c:forEach>
	
	<hr>
	
	<c:forTokens items="${colors}" delims=":" var="name">
		<div>${name}</div>
	</c:forTokens>
	
	<hr>
	<!-- 링크 -->
	<c:url var="link" value="http://localhost:8090/view.do">
		<c:param name="name" value="Hong"></c:param>
		<c:param name="age" value="20"></c:param>
		<c:param name="address" value="서울"></c:param>
	</c:url>
	
	<a href="${link}">링크</a>

	<hr>

	
<%-- 	<c:redirect url="https://naver.com"></c:redirect>  --%>

	<hr>
	
	<div>내 생일 : <fmt:formatDate value="${birthday.time}" pattern="yyyy-MM-dd E HH:mm:ss"/></div>	

	<hr>
	
	<c:set var="price" value="10000"/>
	
	<div>가격 : ${price}원</div>
	<div>가격 : <fmt:formatNumber value="${price}" />원</div>
	
	<hr>
	
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>전화</th>
			<th>주소</th>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr>
			<td>${vo.getSeq()}</td>
			<td>${vo["name"]}</td>
			<td>${vo.age }</td>
			<td>${vo.tel }</td>
			<td>${vo.address }</td>
		</tr>
		</c:forEach>
	</table>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>












