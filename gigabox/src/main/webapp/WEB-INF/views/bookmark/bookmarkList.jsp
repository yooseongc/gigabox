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
<title>GigaBox - 예매 안내</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- service CSS -->
<link href="/resources/css/service.css" rel="stylesheet">

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
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					마이페이지 <small id="pageType">마이무비</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>마이페이지</li>
					<li id="pageType2">마이무비</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
		<div class="col-lg-12">
			<div class="board-inner">
				<ul class="nav nav-tabs" id="myTab">
					<li class="active"><a href="#home" data-toggle="tab"
						title="welcome"> <span class="round-tabs one"> <i
								class="glyphicon glyphicon-user"></i>
						</span>
					</a></li>

					<li><a href="#profile" data-toggle="tab" title="profile">
							<span class="round-tabs two"> <i
								class="glyphicon glyphicon-usd"></i>
						</span>
					</a></li>
					<li><a href="#messages" data-toggle="tab"
						title="bootsnipp goodies"> <span class="round-tabs three">
								<i class="glyphicon glyphicon-credit-card"></i>
						</span>
					</a></li>

					<li><a href="#myMovieTab" data-toggle="tab" title="myMovie">
							<span class="round-tabs four"> <i
								class="glyphicon glyphicon-film"></i>
						</span>
					</a></li>

					<li><a href="#doner" data-toggle="tab" title="completed">
							<span class="round-tabs five"> <i
								class="glyphicon glyphicon-comment"></i>
						</span>
					</a></li>

				</ul>
			</div>

			<div class="tab-content">
				<div class="tab-pane fade in active" id="home">

					<h3 class="head text-center">
						Welcome to Bootsnipp<sup>™</sup> <span style="color: #f48260;">♥</span>
					</h3>
					<p class="narrow text-center">Lorem ipsum dolor sit amet, his
						ea mollis fabellas principes. Quo mazim facilis tincidunt ut,
						utinam saperet facilisi an vim.</p>

					<p class="text-center">
						<a href="" class="btn btn-success btn-outline-rounded green">
							start using bootsnipp <span style="margin-left: 10px;"
							class="glyphicon glyphicon-send"></span>
						</a>
					</p>
				</div>
				<div class="tab-pane fade" id="profile">
					<h3 class="head text-center">
						Create a Bootsnipp<sup>™</sup> Profile
					</h3>
					<p class="narrow text-center">Lorem ipsum dolor sit amet, his
						ea mollis fabellas principes. Quo mazim facilis tincidunt ut,
						utinam saperet facilisi an vim.</p>

					<p class="text-center">
						<a href="" class="btn btn-success btn-outline-rounded green">
							create your profile <span style="margin-left: 10px;"
							class="glyphicon glyphicon-send"></span>
						</a>
					</p>

				</div>
				<div class="tab-pane fade" id="myMovieTab">
					<h3 class="head text-center">Bootsnipp goodies</h3>
					<p class="narrow text-center">Lorem ipsum dolor sit amet, his
						ea mollis fabellas principes. Quo mazim facilis tincidunt ut,
						utinam saperet facilisi an vim.</p>

					<p class="text-center">
						<a href="" class="btn btn-success btn-outline-rounded green">
							start using bootsnipp <span style="margin-left: 10px;"
							class="glyphicon glyphicon-send"></span>
						</a>
					</p>
				</div>
				<div class="tab-pane fade" id="settings">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="page-header"></h2>
						</div>
						<c:forEach items="${bookmarkList}" var="movieItem">
							<div class="col-md-3 col-sm-6" data-role="movieItem">
								<div class="panel panel-default text-center">
									<div class="panel-heading">
										<img
											src="http://image2.megabox.co.kr/mop/poster/2017/D0/FE777E-E4C3-4606-8EA1-987449753072.large.jpg"
											class="img-responsive" width="270" height="376">
									</div>
									<div class="panel-body">
										<div>
											<h4
												style="width: 100%; height: 1.35em; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
												<tag:rating rating="${movieItem.movieRating}" />
												${movieItem.movieTitle}
											</h4>
											<div class="rating">
												<input id="starRating" value="${movieItem.reviewStarscore}"
													type="number" data-show-clear="false"
													data-show-caption="false" class="rating" min=0 max=10
													step=0.1 data-size="xs" disabled="disabled">
											</div>
											<button class="btn btn-primary"
												onclick="viewDetail('${movieItem.movieNumber}')"
												data-id="${movieItem.movieNumber}">상세보기</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="tab-pane fade" id="doner">
					<div class="text-center">
						<i class="img-intro icon-checkmark-circle"></i>
					</div>
					<h3 class="head text-center">
						thanks for staying tuned! <span style="color: #f48260;">♥</span>
						Bootstrap
					</h3>
					<p class="narrow text-center">Lorem ipsum dolor sit amet, his
						ea mollis fabellas principes. Quo mazim facilis tincidunt ut,
						utinam saperet facilisi an vim.</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- Content Row -->

	</div>
	<!-- /.container -->



	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

</body>
</html>