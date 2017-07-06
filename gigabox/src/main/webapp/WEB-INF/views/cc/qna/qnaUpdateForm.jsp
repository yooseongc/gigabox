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
<title>GigaBox 1:1문의 수정</title>
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
				<ul class="nav nav-tabs nav-justified" role="tablist">
					<li class=""><a href="/cc/faq/faqList" class="faq"
						title="자주묻는질문 바로가기"><i class="fa fa-question"></i>&nbsp;&nbsp;자주묻는질문</a></li>
					<li><a href="/cc/notice/noticeList" class="notice"
						title="공지사항 바로가기"><i class="fa fa-info"></i>&nbsp;&nbsp;공지사항</a></li>
					<li><a href="/cc/qna/qnaList" class="qna" title="1:1문의 바로가기"><i
							class="fa fa-comments-o"></i>&nbsp;&nbsp;1:1문의</a></li>
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
				<form id="qnaUpdateForm" class="form-group" method="post">
					<table class="table">
						<tbody>
							<tr>
								<th align="center">제목</th>
								<td><input type="text" id="title"></td>
							</tr>
							<tr>
								<th align="center">내용</th>
								<td><input type="text" id="content"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<!--/.col-lg-12 -->
	</div>
	<!-- /.row -->
	<hr>

	<div class="container">
		<div class="pull-right">
			<a href="/user/qnaUpdateForm"><button type="button"
					id="qnaUpdateBtn" class="btn btn-primary btn-sm"
					onclick="location.href='/cc/qna/qnaList'">수정</button></a> <a
				href="/cc/qna/qnaList"><button class="btn btn-primary btn-sm">목록</button></a>
		</div>
	</div>

	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

	<script type="text/javascript">
		$(document).ready(function() {
			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#qnaUpdateBtn").click(function() {
				var title = $("#title").val();
				var content = $("#content").val();

			});
		});
	</script>

</body>
</html>