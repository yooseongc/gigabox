<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>GigaBox 공지사항 상세</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- jQuery -->
<script src="/resources/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/js/bootstrap.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
	
	<!-- header -->
	<c:import url="/templates/header.jsp"/>

	<!-- Page Content -->
	<div class="container">

		<!-- 상단 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					고객 센터 <small>공지사항</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>고객 센터</li>
					<li class="active">공지사항</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="container">
					<table class="table">
						<tbody>
							<tr>
								<th>제목</th>
								<td colspan="3">${noticeRead.noticeTitle}</td>
							</tr>
							<tr>
								<th>영화관</th>
								<td>${noticeRead.noticeBranchname}</td>
								<th>등록일</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${noticeRead.noticeRegisterdate}" /></td>
							</tr>
							<tr style="height: 500px;">
								<td colspan="4" style="padding: 40px;">${noticeRead.noticeContent}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!--/.col-lg-12 -->
			<div class="col-lg-12">
				<div class="pull-right">
					<a href="/cc/notice/noticeList"><button	class="btn btn-primary btn-sm">목록</button></a>
				</div>
			</div>
			<!--/.col-lg-12 -->
		</div>
		<!-- /.row -->
	
		<hr>
		
	</div>
	<!-- /.container -->
	
	<!-- footer -->
	<c:import url="/templates/footer.jsp"/>

	
</body>
</html>