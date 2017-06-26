<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/movieRatingTag.tld"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GigaBox - 영화관 찾기</title>
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

<!-- handlebar -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.10/handlebars.min.js">
	
</script>

<!-- bootstrap star rating -->
<link rel="stylesheet"
	href="/resources/bootstrap-star-rating/css/star-rating.css" media="all"
	rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap-star-rating/js/star-rating.js"
	type="text/javascript"></script>


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
	<div>
		<img src="http://image2.megabox.co.kr/mop/home/theater/bg.jpg"
			width="100%" height="500" style="">
	</div>
	<!-- Page Content -->
	<div>

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					영화 <small id="pageType">영화관 찾기</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>영화</li>
					<li class="active" id="pageType2">영화관 찾기</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-md-3">
				<div class="list-group">
					<ul>
						<c:forEach items="${movieRoomList}" var="movieRoomItem">
							<li style="list-style-type: none"><a href="index.html"
								class="list-group-item"
								data-id="${movieRoomItem.movieRoomNumber }">서울${movieRoomItem.movieRoomNumber }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- Content Column -->
			<div class="col-md-9">
				<h2>Section Heading</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Soluta, et temporibus, facere perferendis veniam beatae non
					debitis, numquam blanditiis necessitatibus vel mollitia dolorum
					laudantium, voluptate dolores iure maxime ducimus fugit.</p>
			</div>
		</div>
		<!-- /.row -->

		<!-- 		<img src="http://image2.megabox.co.kr/mop/home/map/world2.jpg"> -->






	</div>
	<!-- /.container -->

	<!-- footer -->
	<c:import url="/templates/footer.jsp" />



</body>
</html>