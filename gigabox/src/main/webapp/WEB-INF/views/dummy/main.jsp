<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>
	<h2>회원서비스 - 마이페이지</h2>
	<c:choose>
		<c:when test="${not empty sessionScope.login}">
		<li class="nav">${sessionScope.login.userId }님 로그인</li>
		<li class="nav"><a href="/user/logout">로그아웃</a></li>
		</c:when>
		<c:when test="${empty session}">
		<li class="nav"><a href="/user/joinAgreeForm">회원가입</a></li>
		<li class="nav"><a href="/user/login">로그인</a></li>
		</c:when>
	</c:choose>
	<br> 
	ㄱㄱㄱㄱ
	<br>
	<input type="button" value="회원수정페이지" id="modifyFormButton"
		onclick="location.href='/user/modifyForm/${sessionScope.login.userId }'">

	<script>
		$(document).ready(function() {
			if ('${sessionScope.login.userId }' == '') {
				$("#modifyFormButton").css('display', 'none');
			}
		});
	</script>
</body>
</html>

