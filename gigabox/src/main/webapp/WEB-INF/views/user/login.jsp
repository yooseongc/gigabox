<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>free login form -bootstrap</title>

<!-- Bootstrap -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<!-- Custom Style -->
<link href="/resources/css/style.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></scri.row>.containerpt>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="page-header">
				<h2>GIGABOX 로그인</h2>
			</div>
			<div class="col-md-4 col-md-offset-4">
				<div class="login-box well">
					<form accept-charset="UTF-8" role="form" method="post" action="/user/loginSession"
						id="loginForm">
						<fieldset>
							<legend>로그인</legend>
							<div class="alert alert-danger" id="errorMessage">
							</div>
							<div class="form-group">
								<label for="userId">아이디</label> <input
									name="userId" value='' id="userId"
									placeholder="ID" type="text"
									class="form-control" />
							</div>
							<div class="form-group">
								<label for="userPw">비밀번호</label> <input name="userPw"
									id="userPw" value='' placeholder="Password" type="password"
									class="form-control" />
							</div>
							<div class="form-group">
									<!-- Change this to a button or input when using this as a form -->
                                <button class="btn btn-lg btn-success btn-block" id="loginButton">로그인</button>
							</div>
							<span class='text-center'><a
								href="#"
								class="text-sm">비밀번호 찾기</a></span>
							<hr />
							<div class="form-group">
								<a href="/user/joinAgreeForm" class="btn btn-default btn-block m-t-md"> 회원가입</a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		
		function formCheck(v_item, v_name, e_item) {
			if (v_item.val().replace(/\s/g, "") == "") {

				e_item.text(v_name + " 입력해 주세요.");
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
			$("#loginButton").click(function(e) {
				e.preventDefault();
				console.log(!formCheck($("#userId"), "아이디를", $("#errorMessage")));
				if (!formCheck($("#userId"), "아이디를", $("#errorMessage"))) {
					return;
				}
				if (!formCheck($("#userPw"), "비밀번호를", $("#errorMessage"))) {
					return;
				}
				
				 $.ajax({
					url: "/user/login.do",
					type: "POST",
					data: $("#loginForm").serialize(),
					error: function() {
						$("#errorMessage").text("시스템 오류입니다.");
						$("#errorMessage").show();
					},
					success: function(resultData) {
						if (resultData.message == 'ID-MISSING') {
							$("#errorMessage").text("해당 계정이 존재하지 않습니다.");
							$("#errorMessage").show();
							$("#userId").val("");
							$("#userPw").val("");
							$("#userId").focus();
						} else if (resultData.message == 'PW-WRONG') {
							$("#errorMessage").text("비밀번호가 일치하지 않습니다.");
							$("#errorMessage").show();
							$("#userPw").val("");
							$("#userPw").focus();
						} else if (resultData.message == 'LOGIN-SUCCESS') {
							console.log("login success!!!");
							$("#loginForm").submit();
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