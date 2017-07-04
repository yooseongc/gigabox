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
<title>GigaBox - 메인페이지</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- main CSS -->
<link href="resources/css/main.css" rel="stylesheet">

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

<script>
	$(document).ready(
			function() {

				$('#itemslider').carousel({
					interval : 3000
				});

				$('.carousel-showmanymoveone .item').each(
						function() {
							var itemToClone = $(this);

							for (var i = 1; i < 6; i++) {
								itemToClone = itemToClone.next();

								if (!itemToClone.length) {
									itemToClone = $(this).siblings(':first');
								}

								itemToClone.children(':first-child').clone()
										.addClass("cloneditem-" + (i))
										.appendTo($(this));
							}
						});
			});
</script>
</head>
<body>

	<c:import url="/templates/header.jsp" />

	<!-- Carousel -->
	<header id="myCarousel" class="carousel slide" style="height: 600px;">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="fill"
					style="background-image: url(http://image2.megabox.co.kr/mop/home/ad/1600x600/170620_form_1600x600.jpg);">
					<!-- <video controls="controls" width="100%" height="100%" poster="http://image2.megabox.co.kr/mop/home/ad/1600x600/170620_form_1600x600.jpg" preload="none">
                        <source src="http://m.mvod.megabox.co.kr/encodeFile/3550/2017/06/20/0aa6867bf20013acc0bc3bb7c0f63a52_I.mp4" type="video/mp4" />
                    </video> -->
				</div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url(http://image2.megabox.co.kr/mop/home/ad/1600x600/170531_mm_1600x600.jpg);"></div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url(http://image2.megabox.co.kr/mop/home/ad/1600x600/170620_love_1600x600.jpg);">
					<!-- <video controls="controls" width="100%" height="100%" poster="http://image2.megabox.co.kr/mop/home/ad/1600x600/170620_love_1600x600.jpg" preload="none">
                        <source src="http://m.mvod.megabox.co.kr/encodeFile/3550/2017/06/20/178c89d11c62230cf7c1a7847d208f4b_I.mp4" type="video/mp4" />
                    </video> -->
				</div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>


	<!--Item slider text-->
	<div class="container">
		<div class="row" id="slider-text">
			<div class="col-md-6">
				<h2>NEW COLLECTION</h2>
			</div>
		</div>
	</div>

	<!-- Item slider-->
	<div class="container-fluid">

		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<div class="carousel carousel-showmanymoveone slide" id="itemslider">
					<div class="carousel-inner">

						<div class="item active">
							<c:forEach items="${movieListRecent}" var="movieItem">
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

						<div class="item">
							<div class="col-xs-12 col-sm-6 col-md-2">
								<a href="#"><img
									src="https://s12.postimg.org/41uq0fc4d/item_2_180x200.png"
									class="img-responsive center-block"></a>
								<h4 class="text-center">MAYORAL KOŠULJA</h4>
								<h5 class="text-center">4000,00 RSD</h5>
							</div>
						</div>

						<div class="item">
							<div class="col-xs-12 col-sm-6 col-md-2">
								<a href="#"><img
									src="https://s12.postimg.org/dawwajl0d/item_3_180x200.png"
									class="img-responsive center-block"></a> <span class="badge">10%</span>
								<h4 class="text-center">PANTALONE TERI 2</h4>
								<h5 class="text-center">4000,00 RSD</h5>
								<h6 class="text-center">5000,00 RSD</h6>
							</div>
						</div>

						<div class="item">
							<div class="col-xs-12 col-sm-6 col-md-2">
								<a href="#"><img
									src="https://s12.postimg.org/5w7ki5z4t/item_4_180x200.png"
									class="img-responsive center-block"></a>
								<h4 class="text-center">CVETNA HALJINA</h4>
								<h5 class="text-center">4000,00 RSD</h5>
							</div>
						</div>

						<div class="item">
							<div class="col-xs-12 col-sm-6 col-md-2">
								<a href="#"><img
									src="https://s12.postimg.org/e2zk9qp7h/item_5_180x200.png"
									class="img-responsive center-block"></a>
								<h4 class="text-center">MAJICA FOTO</h4>
								<h5 class="text-center">4000,00 RSD</h5>
							</div>
						</div>

						<div class="item">
							<div class="col-xs-12 col-sm-6 col-md-2">
								<a href="#"><img
									src="https://s12.postimg.org/46yha3jfh/item_6_180x200.png"
									class="img-responsive center-block"></a>
								<h4 class="text-center">MAJICA MAYORAL</h4>
								<h5 class="text-center">4000,00 RSD</h5>
							</div>
						</div>

					</div>

					<div id="slider-control">
						<a class="left carousel-control" href="#itemslider"
							data-slide="prev"><img
							src="https://s12.postimg.org/uj3ffq90d/arrow_left.png" alt="Left"
							class="img-responsive"></a> <a class="right carousel-control"
							href="#itemslider" data-slide="next"><img
							src="https://s12.postimg.org/djuh0gxst/arrow_right.png"
							alt="Right" class="img-responsive"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Item slider end-->
	<!-- /.container -->

	<!-- Footer -->
	<c:import url="/templates/footer.jsp" />

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		});
	</script>

</body>
</html>