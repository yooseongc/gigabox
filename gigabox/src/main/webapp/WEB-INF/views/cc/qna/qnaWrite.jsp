<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GigaBox 1:1문의</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
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
	<c:import url="/templates/header.jsp" />

	<!-- Page Content -->
	<div class="container">

		<!-- 상단 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					공지사항 <small>GIGABOX NEWS</small>
				</h1>
				<ul class="nav nav-tabs" role="tablist">
					<li><a href="/cc/faq/faqList" class="faq" title="자주묻는질문 바로가기">자주묻는질문</a></li>
					<li><a href="/cc/notice/noticeList" class="notice"
						title="공지사항 바로가기">공지사항</a></li>
					<li><a href="/cc/qna/qnaList" class="qna" title="1:1문의 바로가기">1:1문의</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /.row -->
	<br>
	<!-- Content Row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="container">
				<table class="table">
					<tbody id="inquiryWrite">
					<c:out value="inquiryItem">
						<tr>
							<th>제목</th>
							<td>${inquiry}</td>
						</tr>
						<tr>
						<td>내용</td>
						<td>${inquiry.}</td>
						</tr>
						</c:out>
					</tbody>
				</table>

			</div>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<hr>


	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

</body>
</html>