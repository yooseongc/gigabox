<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>GigaBox - 회원가입</title>

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

<script type="text/javascript"
	src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>

</head>
<body>

	<!-- header -->
	<c:import url="/templates/header.jsp" />

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					회원 서비스 <small>회원 탈퇴</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">회원 서비스</a></li>
					<li class="active">회원 탈퇴</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<article>
				<div class="col-md-12">
					<div class="page-header">
						<h1>회원탈퇴</h1>
						<h6>*30일간 재가입이 불가능 합니다.</h6>
					</div>
					<form class="form-horizontal" id="userLeaveForm">
						<table class="table table-striped table-bordered table-hover">
							<caption>${userInfo.userName }님회원정보</caption>
							<thead>
								<tr>
									<th>이름</th>
									<th>아이디</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>주소</th>
									<th>탈퇴확인</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${userInfo.userName }</td>
									<td>${userInfo.userId }</td>
									<td>${userInfo.userTel }</td>
									<td>${userInfo.userEmail }</td>
									<td>${userInfo.userAddr }</td>
									<td><button id="leaveBtn" class="btn btn-danger"
											type="submit">탈퇴</button></td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr>
				</div>
			</article>
		</div>
		<!-- /.row -->
		<hr>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<c:import url="/templates/footer.jsp" />

	<!-- Modal -->
	<div class="modal fade" id="leaveOK" tabindex="-1" role="dialog"
		aria-labelledby="leaveOKModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="leaveOKModalLabel">회원 탈퇴 확인</h4>
				</div>
				<div class="modal-body">
					<form id="addrSearchForm" onsubmit="return false;">
						<strong> 정말 회원탈퇴?? 레알?<br> 진심?<br> 기타 등등 안내문<br>
						</strong> <br>
						<br>
					</form>
				</div>
				<div class="modal-footer text-center">
					<button id="" class="btn btn-danger" type="submit">탈퇴</button>
					<button class="btn btn-primary" data-dismiss="modal">취소</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#leaveBtn').click(function(e) {
				e.preventDefault();
				$('#leaveOK').modal({
					show : true,
					backdrop : 'static',
					keyboard : true
				});
			});
		});
	</script>
</body>
</html>