<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input.error, textarea.error { /* INPUT 박스 */
	border:1px solid red;
}
p.error { /* 에러메시지 */
	display: block;
	color:red;
	font-weight: normal;
	text-align: right;
}
</style>
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
	
	<c:import url="/templates/header.jsp"/>
	
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					회원 서비스 <small>회원 가입</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#">회원 서비스</a></li>
					<li class="active">이용약관 동의</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<article>
				<div class="col-md-12">
					<div class="page-header">
						<h1>이용약관 동의</h1>
					</div>
					<form role="form" id="joinAgreeForm" method="get" action="/user/joinFormLoad"
						autocomplete="off">
						<div class="panel panel-default">
							<div class="panel-heading">GIGABOX 동의 내용</div>
							<!-- panel heading -->

							<div class="panel-body">
								<div class="form-group">
									<label class="control-label" style="margin-left: 10px;"> 회원가입 약관 </label>
									<br>
									<div class="col-xs-12">
										<textarea id="auth1" class="form-control" readonly rows="15" cols="100" style="resize: none;">
											
										</textarea>
									</div>
									<div class="col-xs-12">
										<div class="checkbox pull-right">
											<label for="join_user_agree"> <input type="checkbox"
												name="join_user_agree" id="join_user_agree" value="1" />
												회원가입 약관에 동의합니다.
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label" style="margin-left: 10px;"> 개인정보 처리방침 안내 </label>
									<br>
									<div class="col-xs-12">
										<textarea id="auth2" class="form-control" readonly rows="15" cols="100" style="resize: none;">
										</textarea>
									</div>
									<div class="col-xs-12">
										<div class="checkbox pull-right">
											<label for="join_priv_agree"> <input type="checkbox"
												name="join_priv_agree" id="join_priv_agree" value="1" />
												개인정보 처리방침에 동의합니다.
											</label>
										</div>
									</div>
								</div>
							</div>
							<!-- panel body -->

							<div class="panel-footer">
								<div style="overflow: hidden">
									<div class="col-sm-offset-3 col-sm-6">
										<button class="btn btn-lg btn-primary btn-block" type="submit">
										다음</button>
										
									</div>
								</div>
							</div>
						</div>
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
	<c:import url="/templates/footer.jsp"/>


	<!-- jQuery -->
	<script src="/resources/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>

	<script src="/resources/js/jquery.validate.js"></script>
	<script type="text/javascript">
	$(function() {
		
		if ('${sessionScope.login.userId}' != '') {
			alert("이미 회원 가입이 되어 있습니다.\n메인 페이지로 돌아갑니다.");
			window.location.href = "/";
		}
		
		$("#joinAgreeForm").validate({
			rules: {
				join_user_agree: { required:true },
				join_priv_agree: { required:true }
			},
			messages: {
				join_user_agree: { required:'회원가입 약관에 동의하셔야 회원가입 하실 수 있습니다.' },
				join_priv_agree: { required:'개인정보 처리방침에 동의하셔야 회원가입 하실 수 있습니다.' }
			},
			errorPlacement: function(error, element) {
				element.parent("label").parent(".checkbox").parent("div").after(error);
				error.addClass("col-xs-12");
			},
			errorClass: "error",
			errorElement: "p"
		});
		
		$.get("/resources/auth1.txt", function(data) {
			$("#auth1").html(data);
		});
		$.get("/resources/auth2.txt", function(data) {
			$("#auth2").html(data);
		});
		
	});
	</script>
	
</body>
</html>