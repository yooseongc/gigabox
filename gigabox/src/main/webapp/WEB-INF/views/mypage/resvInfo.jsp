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
<title>GigaBox - 마이페이지</title>
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

<!-- bookmarkmenuCSS -->
<link href="/resources/css/service.css" rel="stylesheet">
<!-- handlebar -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.10/handlebars.min.js">
	
</script>


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
					마이페이지 <small>마일리지 정보</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>마이페이지</li>
					<li>마일리지 정보</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Service Tabs -->
		<div class="container">
			<div class="row">
				<!-- <h2>Welcome to IGHALO!<sup>™</sup></h2>-->
				<div class="board-inner">
					<ul class="nav nav-tabs" id="myTab">

						<!-- 마일리지 정보 -->
						<li><a href="/mypage/mileageInfo" data-toggle="tab"
							title="마일리지 정보"> <span class="round-tabs two"> <i
									class="glyphicon glyphicon-usd"></i>
							</span>
						</a></li>
						<!-- 예매 정보 -->
						<li class="active"><a href="/mypage/resvInfo"
							data-toggle="예매 내역 확인" title="예매 내역 확인/취소"> <span
								class="round-tabs three"> <i
									class="glyphicon glyphicon-credit-card"></i>
							</span>
						</a></li>
						<!-- 마이무비 -->
						<li><a href="/mypage/mymovie" data-toggle="tab" title="마이무비">
								<span class="round-tabs four"> <i
									class="glyphicon glyphicon-film"></i>
							</span>
						</a></li>
						<!-- qna내역 -->
						<li><a href="/mypage/qnaInfo" data-toggle="tab" title="문의 내역">
								<span class="round-tabs five"> <i
									class="glyphicon glyphicon-comment"></i>
							</span>
						</a></li>

					</ul>
				</div>

				<div class="tab-content">
					<div class="tab-pane fade in active">
						
					</div>
				</div>
			</div>
		</div>
		<div class="h2_mypage">
							<h3 class="sub_title">예매 확인/취소</h3>
							<span>예매하신 영화 내역과 취소 내역을 확인할 수 있습니다.</span>
						</div>

						<ul class="nav nav-tabs mb40">
							<li class="active"><a href="#tab_list1" data-toggle="tab"
								title="예매 내역 보기">예매 내역</a></li>
							<li><a href="#tab_list3" data-toggle="tab"
								onclick="cancelList()" title="취소 내역 보기">취소 내역</a></li>
						</ul>
						<div class="tab-content">

							<!-- tab1 예매내역// -->
							<div class="tab-pane active" id="tab_list1"></div>
							<!-- //tab1 예매내역 -->

							<!-- tab2 지난내역// -->
							<div class="tab-pane" id="tab_list2"></div>
							<!-- //tab2 지난내역 -->

							<!-- tab3 취소내역// -->
							<div class="tab-pane" id="tab_list3"></div>
						</div>
						<!-- //tab -->
	</div>

	<!-- footer -->
	<c:import url="/templates/footer.jsp" />
</body>
</html>