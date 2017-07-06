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
					<li>GIGABOX</li>
					<li>회원 서비스</li>
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
						<h1>회원탈퇴 <small>*30일간 재가입이 불가능 합니다.</small></h1>
					</div>
					<form class="form-horizontal">
						<table class="table table-striped table-bordered table-hover">
							<caption>${userInfo.userName }님회원정보</caption>
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>마일리지</th>
									<th>탈퇴확인</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${userInfo.userId }</td>
									<td>${userInfo.userName }</td>
									<td>${userInfo.userTel }</td>
									<td>${userInfo.userEmail }</td>
									<td>${userInfo.userMileage }</td>
									<td><button id="leaveBtn" class="btn btn-danger"
											>탈퇴</button></td>
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
					<h4 class="modal-title" id="leaveOKModalLabel">회원 탈퇴 확인</h4>
				</div>
				<div class="modal-body">
					<form id="userLeaveForm" onsubmit="return false;">
						<fieldset>
							<div class="alert alert-danger center-block" style="width: 400px;" id="errorMessage"></div>
						<strong>-주의-<br>
						*탈퇴 일로부터 30일간 현재 개인정보로 재가입이 불가능합니다.<br>*현재까지 적립된 마일리지가 모두 사라집니다.<br>
							*기타 등등 안내문<br>
						</strong> <br> <br>
						<div class="form-group" style="text-align: center;">
						<button id="leaveOKBtn" class="btn btn-danger" type="submit">탈퇴</button>
						<button class="btn btn-primary" data-dismiss="modal">취소</button>
						</div>
						</fieldset>
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
			$("#errorMessage").hide();
			//탈퇴버튼 클릭시 모달
			$('#leaveBtn').click(function(e) {
				e.preventDefault();
				$('#leaveOK').modal({
					show : true,
					backdrop : 'static',
					keyboard : true
				});
			});
			
		$('#leaveOKBtn').click(function(e){
			e.preventDefault();
			$.ajax({
				type: "POST",
				url: "/user/userLeaveForm",
				data: $("#userLeaveForm").serialize(),
				error: function() {
					$("#errorMessage").text("시스템 오류입니다.");
					$("#errorMessage").show();
				},
				success: function(resultData) {
					if (resultData.message == 'CHECK-SUCCESS') {
						console.log("change success!!!");
						$("#changePwForm").submit();
						alert("정상적으로 탈퇴처리 되었습니다.")
						location.href ="/user/logout";
					} else if (resultData.message == 'ERROR') {
						$("#errorMessage").text("시스템 오류입니다.");
						$("#errorMessage").show();
					}
				}
			});
			
		});
		});
	</script>
</body>
</html>