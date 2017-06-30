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
	<c:import url="/templates/header.jsp"/>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					GIGABOX <small>정보찾기</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">메인</a></li>
					<li class="active">아이디/비밀번호찾기</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<article>
				<div class="col-md-12">
					<div class="page-header">
						<h1>아이디 찾기</h1>
					</div>
					<form class="form-horizontal" id="findUserIdForm">
						<fieldset>
							<div class="alert alert-danger center-block"
								style="width: 400px;" id="errorMessage1"></div>
							찾는 게 [${userInformation.userId }] 이거 맞아?
							<div class="form-group">
								<label class="col-sm-3 control-label" for="userName">이름</label>
								<div class="col-sm-6">
									<input class="form-control" id="userName" type="text"
										name="userName" maxlength="10">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="userBirthday">가입생년월일</label>
								<div class="col-sm-6">
									<input class="form-control" id="userBirthday"
										name="userBirthday" type="text"
										placeholder="- 없이 입력해 주세요. 예:YYYYMMDD" maxlength="8">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="userTel">휴대폰
									번호</label>
								<div class="col-sm-6">
									<input class="form-control" id="userTel" name="userTel"
										type="text" placeholder="- 없이 입력해 주세요." maxlength="11">
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-12 text-center">
									<button id="findUserIdSubmitBtn" class="btn btn-primary"
										type="submit">
										ID찾기<i class="fa fa-check spaceLeft"></i>
									</button>
									<button id="cancleBtn1" class="btn btn-danger" type="submit">
										취소<i class="fa fa-times spaceLeft"></i>
									</button>
								</div>
							</div>
						</fieldset>
					</form>
					<hr>
				</div>
			</article>
			<article>
				<div class="col-md-12">
					<div class="page-header">
						<h1>비밀번호 찾기</h1>
					</div>
					<form class="form-horizontal" id="findUserPwForm">
						<fieldset>
							<div class="alert alert-danger center-block"
								style="width: 400px;" id="errorMessage2"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="userId">아이디</label>
								<div class="col-sm-6">
									<input class="form-control" id="userId" type="text"
										name="userId" maxlength="20">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="userName">이름</label>
								<div class="col-sm-6">
									<input class="form-control" id="userName" name="userName"
										type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="userTel">휴대폰
									번호</label>
								<div class="col-sm-6">
									<input class="form-control" id="userTel" name="userTel"
										type="text" placeholder="- 없이 입력해 주세요." maxlength="11">
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-12 text-center">
									<button id="findUserPwSubmitBtn" class="btn btn-primary"
										type="submit">
										PW찾기<i class="fa fa-check spaceLeft"></i>
									</button>
									<button id="cancleBtn2" class="btn btn-danger" type="submit">
										취소<i class="fa fa-times spaceLeft"></i>
									</button>
								</div>
							</div>
						</fieldset>
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
	<div class="modal fade" id="findIdModal" tabindex="-1" role="dialog"
		aria-labelledby="finIdModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">알림</h3>
				</div>
				<div class="modal-body">
					<form id="findUserId">
						<strong>회원님의 아이디는  ${userInformation.userId }입니다. 가입일: ${userInformation.userReg }
						</strong> <br> <br>
						<div class="form-group" style="text-align: center;">
						<button class="btn btn-primary" data-dismiss="modal">확인</button>
						</div>
					</form>
				</div>
				<div class="modal-footer" style="text-align: center;"></div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script type="text/javascript">
		function formCheck(v_item, v_name, e_item) {
			if (v_item.val().replace(/\s/g, "") == "") {

				e_item.text(v_name + " 확인해 주세요.");
				e_item.show();
				v_item.val("");
				v_item.focus();
				return false;
			} else {
				return true;
			}
		}
		
		$(document).ready(function() {
			$("#errorMessage1").hide();
			$("#errorMessage2").hide();
			
			//ID찾기 버튼 클릭시
			$("#findUserIdSubmitBtn").click(function(e) {
				e.preventDefault();
				if (!formCheck($("#userName"), "이름을", $("#errorMessage1"))) {
					$("#errorMessage1").removeClass("hide");
					return;
				}
				if (!formCheck($("#userBirthday"), "생년월일을", $("#errorMessage1"))) {
					$("#errorMessage1").removeClass("hide");
					return;
				}
				if (!formCheck($("#userTel"), "휴대폰 번호를", $("#errorMessage1"))) {
					$("#errorMessage1").removeClass("hide");
					return;
				}
				/* $.ajax({
					url: "/user/findUserIdForm",
					type: "POST",
					data: $("#findUserIdForm").serialize(),
					error: function() {
						$("#errorMessageHeader").text("시스템 오류입니다.");
						$("#errorMessageHeader").show();
					},
					success: function(resultData) {
						if (resultData.message == 'NOT FIND-ID') {
							$("#errorMessageHeader").text("회원정보가 존재하지 않습니다.");
							$("#errorMessageHeader").removeClass("hide");
							$("#userName").focus();
						} else if (resultData.message == 'FIND-ID') {
							console.log("FIND SUCCESS!!!");
							$("#findUserIdForm").submit();
						} else if (resultData.message == 'ERROR') {
							$("#errorMessageHeader").text("시스템 오류입니다.");
							$("#errorMessageHeader").removeClass("hide");
						}
					} 
					}); */
				
				$("#findUserIdForm").attr("method", "POST");
				$("#findUserIdForm").attr("action", "/user/findUserIdForm");
				$("#findUserIdForm").submit(); 
				
				$('#findUserId').modal({
					show : true,
					backdrop : 'static',
					keyboard : true
				});
			});
			
			//PW확인 버튼 클릭시
			$("#").click(function(e) {
				e.preventDefault();

			});
			
			//취소1버튼 클릭시 메인으로
			$('#cancleBtn1').click(function(e) {
				e.preventDefault();

				location.href = "/";
			});
			//취소2버튼 클릭시 메인으로
			$('#cancleBtn2').click(function(e) {
				e.preventDefault();

				location.href = "/";
			});
		});
	</script>

</body>
</html>