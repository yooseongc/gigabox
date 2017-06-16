<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>
</head>
<body>
	<h2>회원 전용 페이지</h2>
	<c:choose>
		<c:when test="${not empty sessionScope.login}">
		<li class="nav">${sessionScope.login.userId }님</li>
		<li class="nav"><a href="/user/logout">로그아웃</a></li>
		</c:when>
		<c:when test="${empty session}">
		<li class="nav"><a href="/user/joinAgreeForm">회원가입</a></li>
		<li class="nav"><a href="/user/login">로그인</a></li>
		</c:when>
	</c:choose>
	<br> 
	님 환영합니다
	<br>
	<!--  <input type="button" value="로그아웃" onclick="location.href='logout.do'">  
    <input type="button" value="모든회원보기" onclick="location.href='memberList.do'"> -->
	<input type="button" value="회원수정페이지"
		onclick="location.href='/user/modifyForm'">

</body>
</html>

