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

<script>
	setTimeout(function() { alert("5분 내로 결제를 완료하지 않으시면 예약이 취소됩니다.") }, 0);
	setTimeout(function() { alert("예약이 취소됩니다."); location.href = "/";}, 300000);
</script>
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
					빠른 예매 <small>결제 수단 선택</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>예매</li>
					<li class="active">결제</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<div class="col-md-8">
				<!-- 결제 방법 선택 -->
				<div class="col-md-5">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h1 class="panel-title">
								결제방법<small> &nbsp;&nbsp;결제방법을 선택해 주세요.</small>
							</h1>
						</div>
						<div class="panel-body" style="height: 500px;">
							<ul class="nav nav-pills nav-stacked" id="paymethodSelect">
								<li><a href="#">신용카드 결제</a></li>
								<li><a href="#">휴대전화 결제</a></li>
								<li><a href="#">무통장 입금</a></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- 마일리지 선택 -->
				<div class="col-md-7">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h1 class="panel-title">
								마일리지<small> &nbsp;&nbsp;사용 할 마일리지를 확인해주세요.</small>
							</h1>
						</div>
						<div class="panel-body" style="height: 500px;">
							<form>
								<div class="form-group">
									<label class="col-sm-6 control-label" for="">사용가능한 마일리지</label>
									<div>
										<div class="input-group col-sm-5">
											<input class="form-control" id="userMileage" name="" type="number"
												value="${sessionScope.login.userMileage}"
												readonly="readonly">
										</div>
									</div>
								</div>
								<br>
								<div class="form-group">
									<label class="col-sm-6 control-label" for="">사용 마일리지</label>
									<div>
										<div class="input-group col-sm-5">
											<input class="form-control" min="0" max="99999" id="useMileage"
												type="number" value="0" maxlength="5"
												oninput="maxLengthCheck(this)" />
										</div>
									</div>
								</div>
								<br>
								<div class="form-group">
									<label class="col-sm-6 control-label" for="">잔여 마일리지</label>
									<div>
										<div class="input-group col-sm-5">
											<input class="form-control" id="restMileage" type="number"
												value="${sessionScope.login.userMileage}" readonly="readonly">
										</div>
									</div>
								</div>
								<hr>
								<div class="row"
									style="height: 50px; margin-left: 5%; margin-right: 5%;">
									<div class="col-md-12">
										<button class="btn btn-md btn-outline btn-primary pull-right"
											id="mileageCal">
											<i class="glyphicon glyphicon-ok"></i> 적용
										</button>
										<button class="btn btn-md btn-outline btn-danger pull-right"
											type="reset">
											<i class="glyphicon glyphicon-repeat"></i> 초기화
										</button>
									</div>
									<!-- /.col-lg-12 -->
								</div>
								<!-- /.row -->
							</form>

						</div>
					</div>
				</div>
			</div>
			<!-- /.col-md-8 -->

			<div class="col-md-4">
				<!-- 결제 내역 -->
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">결제 내역</h3>
					</div>
					<div class="panel-body" style="height: 500px;">
						<form>
							<div class="form form-horizontal">

								<div class="form-group">
									<label class="col-sm-4 control-label" for="">결제 금액</label>
									<div class="input-group col-sm-6">
										<input class="form-control" type="number" id="paymentBefore"
											value="${resvInfo.reservationPayamount}" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="">마일리지</label>
									<div class="input-group col-sm-6">
										<input class="form-control" id="resvMileage" type="number"
											value="0" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="">총 결제 금액</label>
									<div class="input-group col-sm-6">
										<input class="form-control" id="paymentAfter" type="number"
											value="${resvInfo.reservationPayamount}" readonly="readonly">
									</div>
								</div>
								<hr>
								<div class="row"
									style="height: 50px; margin-left: 5%; margin-right: 5%;">
									<div class="col-md-12">
										<button id="nextStep"
											class="btn btn-md btn-outline btn-success pull-right">
											<i class="glyphicon glyphicon-ok"></i> 결제하기
										</button>
										<button onclick="location.href='/'"
											class="btn btn-md btn-outline btn-danger pull-right">
											<i class="glyphicon glyphicon-home"></i> 메인으로
										</button>

									</div>
									<!-- /.col-lg-12 -->
								</div>
								<!-- /.row -->
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
		
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	
	
	<form class="hide" id="paymentForm">
		<input type="hidden" name="reservationNumber" value="${resvInfo.reservationNumber}">
		<input type="hidden" id="resvPaymethod" name="reservationPaymethod">
		<input type="hidden" id="resvPayamount" name="reservationPayamount">
		<input type="hidden" id="resvUsingmileage" name="reservationUsingmileage" value="0">
	</form>

	<script type="text/javascript">
		//maxlength 체크
		function maxLengthCheck(object) {
			if (object.value.length > object.maxLength) {
				object.value = object.value.slice(0, object.maxLength);
			}
		}
		
		
		$(document).ready(function() {
			// 초기 변수
			var calCheck = 0;
			
			
			//마일리지 차감
			$("#mileageCal").click(function(e) {
				e.preventDefault();
				if ($("#useMileage").val() == '') {
					$("#useMileage").val(0);
				}
				
				if (parseInt($("#userMileage").val()) >= parseInt($("#useMileage").val())){
					var sub = parseInt($("#userMileage").val()) - parseInt($("#useMileage").val());
					console.log($("#paymentAfter").val());
					$("#restMileage").val(sub);
					$("#resvMileage").val($("#useMileage").val());
					$("#paymentAfter").val(parseInt($("#paymentBefore").val()) - parseInt($("#useMileage").val()));
					console.log($("#paymentAfter").val());
					$("#resvPayamount").val($("#paymentAfter").val());
					$("#resvUsingmileage").val($("#useMileage").val());
					
					calCheck = 1;
				} else {
					alert("사용가능한 마일리지를 초과하였습니다.")
					$("#useMileage").val(0);
					$("#mileageCal").trigger("click");
					
					calCheck = 0;
				}
			});
			
			$("#paymethodSelect > li > a").click(function(e) {
				e.preventDefault();
				if ($(this).parent("li").hasClass("active")) {
					$("#resvPaymethod").val("");
				} else {
					$("#resvPaymethod").val($(this).text());
				}
				$("#paymethodSelect li").each(function() {
					$(this).removeClass("active");
				});
				$(this).parent("li").addClass("active");
				
			});
			
			$("#nextStep").click(function(e) {
				e.preventDefault();
				// 유효성 체크
				if ($("#resvPaymethod").val() == '') {
					alert("결제 수단을 선택해 주세요.");
					return;
				}
				if (calCheck != 1) {
					alert("사용할 마일리지를 결정해 주세요.");
					return;
				}
				
				$("#paymentForm").attr("method", "POST");
				$("#paymentForm").attr("action", "/reservation/resvComplete");
				$("#paymentForm").submit();
			});
			
		});
	</script>
	
	
	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

</body>
</html>