<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header id="header">
	<h1>
		<c:if test="${empty id}">
		<span>Toy</span> 
		</c:if>
		
		<c:if test="${not empty id}">
		_<span class="material-symbols-outlined">android</span>_
		</c:if>
		
		<c:if test="${not empty id and lv == '1'}">
		<span style="color: cornflowerblue;">Toy</span> 
		</c:if>
		<c:if test="${not empty id and lv == '3'}">
		<span style="color: tomato;">Toy</span>
		</c:if> 
		Project
	</h1>
	<nav>
		<a href="/toy/index.do">Home</a>
		
		<c:if test="${empty id}">
		<a href="/toy/user/register.do">Register</a>
		<a href="/toy/user/login.do">Login</a>
		</c:if>
		
		<c:if test="${not empty id}">
		<a href="/toy/user/info.do">info</a>
		<a href="/toy/user/unregister.do">UnRegister</a>
		<a href="/toy/user/logout.do">Logout</a>
		</c:if>
		
		<a href="/toy/place/place.do">Place</a>
		<a href="/toy/board/board.do">Board</a>
	</nav>
</header>










