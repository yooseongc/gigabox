<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
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
    
<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>

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
					GIGABOX<small>정보찾기</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>회원 서비스</li>
					<li class="active">비밀번호 찾기(변경)</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<article>
				<div class="col-md-12">
					<div class="page-header">
						<h1>비밀번호 변경 </h1>
					</div>
					<form class="form-horizontal" id="findUserPwForm">
						<fieldset>
							<div class="alert alert-danger center-block" style="width: 400px;" id="errorMessage"></div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userId">아이디</label>
							<div class="col-sm-6">
									<input class="form-control" id="userId" type="text"
									name="userId" maxlength="20" value="${findUserPw.userId }" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userPw">새 비밀번호</label>
							<div class="col-sm-6">
								<input class="form-control" id="userPw"
									name="userPw" type="password" placeholder="영문소문자, 숫자 8자 이상" maxlength="12">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="newPwCheck">새 비밀번호 확인</label>
							<div class="col-sm-6">
								<input class="form-control" id="newPwCheck"
									name="newPwCheck" type="password" placeholder="위에 입력하신 번호와 똑같이 입력하세요." maxlength="12">
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-12 text-center">
								<button id="changePwSubmitBtn" class="btn btn-primary">
									변경완료<i class="fa fa-check spaceLeft"></i>
								</button>
								<button id="changePwCancleBtn" class="btn btn-danger">
									변경취소<i class="fa fa-times spaceLeft"></i>
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
	<c:import url="/templates/footer.jsp"/>

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
	 
	//비밀번호 유효성 검사(영문,숫자 혼합하여 6~20자리 이내)
		function chkPwd(str){
			var reg_pwd = /^.*(?=.{6,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			if(!reg_pwd.test(str)){
				return false;
				}
			return true;
			}
	
		$(document).ready(function() {
			$("#errorMessage").hide();
			
		 	//변경완료 버튼 클릭시
		 	$("#changePwSubmitBtn").click(function(e) {
		 		e.preventDefault();
		 		if (!formCheck($("#userPw"), "새 비밀번호를", $("#errorMessage"))) {
					$("#errorMessage").removeClass("hide");
					return;
				}
		 		
		 		if(!chkPwd( $.trim($("#userPw").val()))){ 

					alert("비밀번호를 확인하세요.\n(영문,숫자를 혼합하여 6~20자 이내)");    

					$("#userPw").val('');
					$("#userPw").focus(); 
					return false;
				}
				
				if ($("#userPw").val() != $("#newPwCheck").val()){
					$("#errorMessage").text("새 비밀번호가 일치하지 않습니다.");
					$("#errorMessage").show();
					return;
				}
				
				$.ajax({
					type: "POST",
					url: "/user/findUserPwForm",
					data: $("#findUserPwForm").serialize(),
					error: function() {
						$("#errorMessage").text("시스템 오류입니다.");
						$("#errorMessage").show();
					},
					success: function(resultData) {
						if (resultData.message == 'CHANGE-SUCCESS') {
							console.log("change success!!!");
							$("#findUserPwForm").submit();
							alert("비밀번호가 변경되었습니다.")
							location.href ="/user/logout";
						} else if (resultData.message == 'ERROR') {
							$("#errorMessage").text("시스템 오류입니다.");
							$("#errorMessage").show();
						}
					}
				});
		 	});
		 	
		 	//취소버튼 클릭시 메인으로
			 $('#changePwCancleBtn').click(function(e){
				e.preventDefault();
				location.href ="/";
			});
		});
	</script>

</body>
</html>