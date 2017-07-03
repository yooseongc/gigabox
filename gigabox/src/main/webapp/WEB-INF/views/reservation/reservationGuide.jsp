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
<title>GigaBox - 예매 안내</title>
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

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					예매 <small id="pageType">예매 안내</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>예매</li>
					<li class="active" id="pageType2">예매 안내</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<div class="col-lg-12"
				style="display: inline-block; text-align: center;">
				<div>
					<img src="/resources/images/reservationGuide.png" alt="예매 안내"
						usemap="#gudieBtn" width="100%">
					<map name="gudieBtn">
						<area shape="rect" coords="845, 1138, 1105, 1205"
							href="/reservation/resvMain">
					</map>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12"
				style="display: inline-block; text-align: center;">
				<h1 class="page-header">

				</h1>
				<div>
					<img src="/resources/images/reservationGuide2.png" alt="가격 안내"
						width="100%">
					<br><br>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->



	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

</body>
</html>