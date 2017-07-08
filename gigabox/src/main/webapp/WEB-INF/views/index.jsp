<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/movieRatingTag.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="resources/custom/css/main.css" rel="stylesheet">

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
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
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
					<strong>좋아하게 되는 그 순간을<hr><em>Moment You Fall In Love: Confess Your Love Committee</em></strong><br>
		                    <span>지금 좋아하게 돼! 모두가 첫사랑 진행중♥</span>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url(http://image2.megabox.co.kr/mop/home/ad/1600x600/170630_bre_1600x600.jpg);">
					<!-- <video controls="controls" width="100%" height="100%" poster="http://image2.megabox.co.kr/mop/home/ad/1600x600/170620_love_1600x600.jpg" preload="none">
                        <source src="http://m.mvod.megabox.co.kr/encodeFile/3550/2017/06/20/178c89d11c62230cf7c1a7847d208f4b_I.mp4" type="video/mp4" />
                    </video> -->
				</div>
				<div class="carousel-caption">
					<strong>2017 브레겐츠 페스티벌 - 카르멘<hr><em>Bregenz Festival CARMEN</em></strong><br>
		                    <span>오스트리아 호수 위 환상적인 오페라 페스티벌<br>7월 30일 오후 2시</span>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url(http://image2.megabox.co.kr/mop/home/ad/1600x600/170627_spi_1600x600.jpg);">
					<!-- <video controls="controls" width="100%" height="100%" poster="http://image2.megabox.co.kr/mop/home/ad/1600x600/170620_love_1600x600.jpg" preload="none">
                        <source src="http://m.mvod.megabox.co.kr/encodeFile/3550/2017/06/20/178c89d11c62230cf7c1a7847d208f4b_I.mp4" type="video/mp4" />
                    </video> -->
				</div>
				<div class="carousel-caption">
					 <strong>스파이더맨: 홈커밍<hr><em>Spider-Man: Homecoming</em></strong><br>
		                    <span>마블에서 새로 태어난 스파이더맨의 완벽한 컴백!</span>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url(http://image2.megabox.co.kr/mop/home/ad/1600x600/170627_park_1600x600.jpg);">
					<!-- <video controls="controls" width="100%" height="100%" poster="http://image2.megabox.co.kr/mop/home/ad/1600x600/170620_love_1600x600.jpg" preload="none">
                        <source src="http://m.mvod.megabox.co.kr/encodeFile/3550/2017/06/20/178c89d11c62230cf7c1a7847d208f4b_I.mp4" type="video/mp4" />
                    </video> -->
				</div>
				<div class="carousel-caption">
					 <strong>박열<hr><em>Anarchist from Colony</em></strong><br>
		                    <span>대한민국이 기억해야 할 뜨거운 실화</span>
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
		<div class="row slider-text"> 
			<div class="col-md-6">
				<h2>NEW MOVIES</h2>
			</div>
			<div class="col-md-6">
				<button class="btn btn-sm btn-primary pull-right"  style="margin-top: 30px;"  
					onclick="javascript:location.href='/movie/movieList';">더보기</button>
			</div>
		</div>
	</div>

	<!-- Item slider-->
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<div class="carousel carousel-showmanymoveone slide" id="itemslider">
					<div class="carousel-inner">

						<c:forEach items="${movieList}" var="movieItem" varStatus="status">
							<c:if test="${status.index == 0}">
								<div class="item active">
									<div class="col-xs-12 col-sm-6 col-md-2">
										<a href="/movie/movieList"><img src="${movieItem.moviePoster}/${movieItem.movieCode}.jpg"
											class="img-responsive center-block" width="180" height="200"></a>
										<div>
											<h4 class="text-center">
												<tag:rating rating="${movieItem.movieRating}" />
												${movieItem.movieTitle}
											</h4>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${status.index > 0}">
								<div class="item">
									<div class="col-xs-12 col-sm-6 col-md-2">
										<a href="/movie/movieList"><img src="${movieItem.moviePoster}/${movieItem.movieCode}.jpg"
											class="img-responsive center-block" width="180" height="200"></a>
										<div>
											<h4 class="text-center">
												<tag:rating rating="${movieItem.movieRating}" />
												${movieItem.movieTitle}
											</h4>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
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

	<!-- 공지사항 -->
	<br><br>
	<div class="container">
		<div class="row slider-text">
			<div class="col-md-6"> 
				<h2> NOTICE </h2>
			</div> 
			<div class="col-md-6">
				<button class="btn btn-sm btn-primary pull-right"  style="margin-top: 30px;"  
					onclick="javascript:location.href='/cc/notice/noticeList';">더보기</button>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th style="text-align: center;">NO</th>
							<th style="text-align: center;">지점</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">등록일</th>
						</tr>
					</thead>
					<tbody id="noticeListTableBody">
						<c:forEach var="noticeItem" items="${noticeList}">
							<tr data-id="${noticeItem.noticeNumber}">
								<td style="text-align: center;">${noticeItem.noticeNumber}</td>
								<td style="text-align: center;">${noticeItem.noticeBranchname}</td>
								<c:if test="${noticeItem.noticeStatus == '중요'}">
									<td style="font-weight: bold;"><span
										class="label label-danger">공지</span>&nbsp;&nbsp;<a
										href="/cc/notice/noticeRead?noticeNumber=${noticeItem.noticeNumber}"
										title="공지사항 상세보기">${noticeItem.noticeTitle}</a></td>
								</c:if>
								<c:if test="${noticeItem.noticeStatus == '일반'}">
									<td><a
										href="/cc/notice/noticeRead?noticeNumber=${noticeItem.noticeNumber}"
										title="공지사항 상세보기">${noticeItem.noticeTitle}</a></td>
								</c:if>
								<td style="text-align: center;"><fmt:formatDate
										value="${noticeItem.noticeRegisterdate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br>
	<br>
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