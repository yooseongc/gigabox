<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/movieRatingTag.tld"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GigaBox - 빠른 예매</title>
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
					빠른 예매 <small>결제 내역</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>예매</li>
					<li class="active">결제</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-md-12">
				<button onclick="location.href='/'" class="btn btn-md btn-outline btn-danger pull-right">
            		<i class="glyphicon glyphicon-home"></i> 메인으로</button>
            	<button onclick="location.href='/mypage/mymovie?listType=1'" class="btn btn-md btn-outline btn-success pull-right">
            		<i class="glyphicon glyphicon-list-alt"></i> 예매 내역 확인</button>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h1>예매 완료<small> 예매 및  결제 내역을 확인하세요.</small></h1>
				</div>
				<form class="form-horizontal">
					<table class="table table-striped table-bordered table-hover">
						<caption>${sessionScope.login.userName}님 예매정보</caption>
						<thead>   
							<tr>
								<th style="text-align: center;">항목</th>
								<th style="text-align: center;">내용</th>
							</tr>
						</thead>
						<tbody>
							<tr style="text-align: center;">
								<th style="text-align: center;">예매번호</th>
								<td>${resvInfo.reservationCode}</td>
							</tr>
							<tr style="text-align: center;">
								<th style="text-align: center;">영화명</th>
								<td><tag:rating rating="${resvInfo.movieRating}" />${resvInfo.movieTitle}</td>
							</tr>
							<tr style="text-align: center;">
								<th style="text-align: center;">영화관</th>
								<td>${resvInfo.branchName} - ${resvInfo.movieroomName}</td>
							</tr>
							<tr style="text-align: center;">
								<th style="text-align: center;">상영시간</th>
								<td><fmt:formatDate value="${resvInfo.scheduleStart}" pattern="yyyy-MM-dd kk:ss" />
									- <fmt:formatDate value="${resvInfo.scheduleEnd}" pattern="yyyy-MM-dd kk:ss" />
									(${resvInfo.movieScreentime} 분)
								</td>
							</tr>
							<tr style="text-align: center;">
								<th style="text-align: center;">예약 좌석</th>
								<td>
									<c:forEach var="i" begin="1" end="6" step="1">
										<c:if test="${i==1}">
											${resvInfo.reservationSeat1}
										</c:if>
										<c:if test="${i==2 and resvInfo.reservationSeat2 != null}">
											, ${resvInfo.reservationSeat2}
										</c:if>
										<c:if test="${i==3 and resvInfo.reservationSeat3 != null}">
											, ${resvInfo.reservationSeat3}
										</c:if>
										<c:if test="${i==4 and resvInfo.reservationSeat4 != null}">
											, ${resvInfo.reservationSeat4}
										</c:if>
										<c:if test="${i==5 and resvInfo.reservationSeat5 != null}">
											, ${resvInfo.reservationSeat5}
										</c:if>
										<c:if test="${i==6 and resvInfo.reservationSeat6 != null}">
											, ${resvInfo.reservationSeat6}
										</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr style="text-align: center;">
								<th style="text-align: center;">예매일</th>
								<td><fmt:formatDate
										value="${resvInfo.reservationRegisterdate}"
										pattern="yyyy-MM-dd kk:ss" /></td>
							</tr>
							<tr style="text-align: center;">
								<th style="text-align: center;">결제 방법</th>
								<td>${resvInfo.reservationPaymethod}</td>
							</tr>
							<tr style="text-align: center;">
								<th style="text-align: center;">결제 금액</th>
								<td>${resvInfo.reservationPayamount} 원</td>
							</tr>
							<tr style="text-align: center;">
								<th style="text-align: center;">사용 마일리지</th>
								<td>${resvInfo.reservationUsingmileage} POINT</td>
							</tr>
							<tr style="text-align: center;">
								<th style="text-align: center;">결제일</th>
								<td><fmt:formatDate
										value="${resvInfo.reservationPaymentdate}"
										pattern="yyyy-MM-dd kk:ss" /></td>
							</tr>
							
						</tbody>
					</table>
				</form>
				<br>
				<hr>
				<div class="mypage_box_wrap">
					<h2>취소및 환불 규정</h2>
					<ul class="icon_list mypage">
						<li>현장 취소를 하는 경우 상영시간 이전까지만 가능하며, 상영시간 이후 취소나 환불은 되지 않습니다.</li>
						<li>홈페이지 또는 모바일에서 예매한 내역을 취소 할 경우 부분 취소는 불가능합니다.</li>
						<li>온라인(홈페이지/모바일) 예매 취소는 상영시간 20분전까지 입니다.</li>
						<li>위탁 예매 사이트 이용 시 취소 및 환불 규정은 해당 사이트 규정을 따릅니다.</li>
						<li><strong class="c_purple">발권된 티켓은 상영시간 전까지 현장 방문 시에만 취소가 가능합니다.</strong></li>
					</ul>
				</div>
			</div>
		
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	
	
	

	<script type="text/javascript">
		
		$(document).ready(function() {
			
			
		});
	</script>
	
	
	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

</body>
</html>