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
					<div class="panel panel-info" data-role="resv-seatSelect-panel">
						<div class="panel-heading">
							<h1 class="panel-title">
								결제방법<small> &nbsp;&nbsp;결제방법을 선택해 주세요.</small>
							</h1>
						</div>
						<div class="panel-body" style="height: 500px;">
							<ul class="nav nav-list bs-docs-sidenav">
								<li><a href="#">신용카드</a></li>
								<li><a href="#">휴대전화</a></li>
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
							<form id="payMentForm">
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
											<input class="form-control" min="0" max="99999" id="useMileage" name=""
												type="number" value="" maxlength="5"
												oninput="maxLengthCheck(this)" />
										</div>
									</div>
								</div>
								<br>
								<div class="form-group">
									<label class="col-sm-6 control-label" for="">잔여 마일리지</label>
									<div>
										<div class="input-group col-sm-5">
											<input class="form-control" id="restMileage" name="" type="number"
												value="" readonly="readonly">
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
						<form id="payMentForm">
							<div class="form form-horizontal">
								<div class="form-group">
									<div>
										<label class="col-sm-10 control-label" for="">상영정보-포스터,
											영화제목, 극장, 상영관, 상영시간(년월일 요일 시간),인원수, 인원속성, 좌석정보</label>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-4 control-label" for="">결제 금액</label>
									<div class="input-group col-sm-6">
										<input class="form-control" id="" name="" type="number"
											value="" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="">마일리지</label>
									<div class="input-group col-sm-6">
										<input class="form-control" id="resvMileage" name="" type="number"
											value="0" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="">총 결제 금액</label>
									<div class="input-group col-sm-6">
										<input class="form-control" id="" name="" type="number"
											value="" readonly="readonly">
									</div>
								</div>
								<hr>
								<div class="row"
									style="height: 50px; margin-left: 5%; margin-right: 5%;">
									<div class="col-md-12">
										<button id="nextStep"
											class="btn btn-md btn-outline btn-success pull-right">
											<i class="glyphicon glyphicon-ok"></i>결제
										</button>
										<button onclick="location.href='/'"
											class="btn btn-md btn-outline btn-danger pull-right">
											<i class="glyphicon glyphicon-home"></i> 메인
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


	<script type="text/javascript">
		//maxlength 체크
		function maxLengthCheck(object) {
			if (object.value.length > object.maxLength) {
				object.value = object.value.slice(0, object.maxLength);
			}
		}
		
		//마일리지 차감
		$(document).ready(function() {
			$("#mileageCal").click(function(e) {
				e.preventDefault();
				if (parseInt($("#userMileage").val()) >= parseInt($("#useMileage").val())){
				var sub = parseInt($("#userMileage").val()) - parseInt($("#useMileage").val())
				$("#restMileage").val(sub);
				$("#resvMileage").val($("#useMileage").val());
				}else{
					alert("사용가능한 마일리지를 초과하였습니다.")
					$("#useMileage").val('');
					$("#restMileage").val('');
					$("#resvMileage").val('');
				}
			});
		});
	</script>
	
	
	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

</body>
</html>