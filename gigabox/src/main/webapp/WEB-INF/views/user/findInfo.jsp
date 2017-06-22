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
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>

</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">Start Bootstrap</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="about.html">About</a></li>
					<li><a href="services.html">Services</a></li>
					<li><a href="contact.html">Contact</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Portfolio <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="portfolio-1-col.html">1 Column Portfolio</a></li>
							<li><a href="portfolio-2-col.html">2 Column Portfolio</a></li>
							<li><a href="portfolio-3-col.html">3 Column Portfolio</a></li>
							<li><a href="portfolio-4-col.html">4 Column Portfolio</a></li>
							<li><a href="portfolio-item.html">Single Portfolio Item</a>
							</li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Blog <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="blog-home-1.html">Blog Home 1</a></li>
							<li><a href="blog-home-2.html">Blog Home 2</a></li>
							<li><a href="blog-post.html">Blog Post</a></li>
						</ul></li>
					<li class="dropdown active"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown">Other Pages <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="active"><a href="full-width.html">Full Width
									Page</a></li>
							<li><a href="sidebar.html">Sidebar Page</a></li>
							<li><a href="faq.html">FAQ</a></li>
							<li><a href="404.html">404</a></li>
							<li><a href="pricing.html">Pricing Table</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

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
					<form class="form-horizontal" id="findId">
						<fieldset>
							<div class="alert alert-danger center-block" style="width: 400px;" id="errorMessage"></div>
						
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
									name="userBirthday" type="text" placeholder="- 없이 입력해 주세요. 예:YYYYMMDD" maxlength="8">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userTel">휴대폰 번호</label>
							<div class="col-sm-6">
								<input class="form-control" id="userTel"
									name="userTel" type="text" placeholder="- 없이 입력해 주세요." maxlength="11">
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-12 text-center">
								<button id="findIdSubmitBtn" class="btn btn-primary" type="submit">
									확인<i class="fa fa-check spaceLeft"></i>
								</button>
								<button id="cancleBtn" class="btn btn-danger" type="submit">
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
					<form class="form-horizontal" id="findPw">
						<fieldset>
							<div class="alert alert-danger center-block" style="width: 400px;" id="errorMessage"></div>
						
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
								<input class="form-control" id="userName"
									name="userName" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userTel">휴대폰 번호</label>
							<div class="col-sm-6">
								<input class="form-control" id="userTel"
									name="userTel" type="text" placeholder="- 없이 입력해 주세요." maxlength="11">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="email">이메일</label>
							<div class="col-sm-6">
								<input class="form-control" id="email"
									name="email" type="email">
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-12 text-center">
								<button id="findPwSubmitBtn" class="btn btn-primary" type="submit">
									확인<i class="fa fa-check spaceLeft"></i>
								</button>
								<button id="cancleBtn" class="btn btn-danger" type="submit">
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
		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; GigaBox 2017</p>
				</div>
			</div>
		</footer>
	</div>
	<!-- /.container -->
	
	<!-- jQuery -->
	<script src="/resources/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>

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
		 	
			//취소버튼 클릭시 메인으로
			$('#cancleBtn').click(function(e){
				e.preventDefault();

				$("#").attr("method", "GET");
				$("#").attr("action", "/");
				$("#").submit();
			});
			
		 	//확인 버튼 클릭시
		 	$("#").click(function(e) {
		 		e.preventDefault();
				
				
		 	});
		});
	</script>

</body>
</html>