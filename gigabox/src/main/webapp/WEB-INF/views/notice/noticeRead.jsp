<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GigaBox 공지사항</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
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
						<li><a href="portfolio-item.html">Single Portfolio Item</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Blog <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="blog-home-1.html">Blog Home 1</a></li>
						<li><a href="blog-home-2.html">Blog Home 2</a></li>
						<li><a href="blog-post.html">Blog Post</a></li>
					</ul></li>
				<li class="dropdown active"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Other Pages <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="full-width.html">Full Width Page</a></li>
						<li><a href="sidebar.html">Sidebar Page</a></li>
						<li class="active"><a href="faq.html">FAQ</a></li>
						<li><a href="404.html">404</a></li>
						<li><a href="pricing.html">Pricing Table</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<!-- Page Content -->
	<div class="container">

		<!-- 상단 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					공지사항 <small>GIGABOX NEWS</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">영화관 공지</li>
				</ol>
			</div>
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
						<tr>
							<td colspan="4"
								style="vertical-align: text-bottom;">${noticeRead.noticeContent}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!--/.col-lg-12 -->
	</div>
	<!-- /.row -->


	<div class="container" align="center">
		<a href="/notice/noticeList"><button type="submit"
				class="btn btn-primary btn-sm">목록</button></a>
	</div>

	<!-- Footer -->
	<footer>
	<div class="row">
		<div class="col-lg-12" align="center">
			<p>Copyright &copy; Your Website 2014</p>
		</div>
	</div>
	</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="/resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>