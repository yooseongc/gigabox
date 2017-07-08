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


<!-- bootstrap-datepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
<script src="/resources/js/bootstrap-datepicker.ko.js" charset="UTF-8"></script>

<!-- custom-reservation-module -->
<script src="/resources/custom/js/reservation.js"></script>



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
					빠른 예매 <small>영화 선택</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>예매</li>
					<li class="active">빠른 예매</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row" style="height: 50px; margin-left: 5%; margin-right: 5%;">
            <div class="col-md-12">
            	<span class="label label-info label-md pull-left" style="font-size: 1.2em;">
            		<i class="fa fa-info-circle"></i> 날짜 > 영화 > 극장 > 상영일정 순서로 클릭해 주세요.</span>
            	<button onclick="location.href='/reservation/resvMain';" class="btn btn-md btn-outline btn-primary pull-right">
            		<i class="glyphicon glyphicon-repeat"></i> 다시 예매</button>
            	<button onclick="location.href='/'" class="btn btn-md btn-outline btn-danger pull-right">
            		<i class="glyphicon glyphicon-home"></i> 메인으로</button>
            	<button id="nextStep" class="btn btn-md btn-outline btn-success pull-right">
            		<i class="glyphicon glyphicon-ok"></i> 좌석 선택</button>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			
			<div class="col-md-6">
				
				<!-- 날짜 선택 -->
				<div class="col-md-12">
					<div class="panel panel-danger" data-role="resv-date-panel">
						<div class="panel-heading">
							<h3 class="panel-title">날짜</h3>
						</div>
						<div class="panel-body" style="height: 260px;">
							<div class="form-group">
								<div class="date col-md-9 col-md-offset-3"> 
									<div id="datepicker" data-date-end-date="+4d"
										data-date-start-date="0d"></div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 영화 선택 -->
				<div class="col-md-12">
					<div class="panel panel-info" data-role="resv-movie-panel">
						<div class="panel-heading">
							<h3 class="panel-title">영화</h3>
						</div>
						<div class="panel-body" style="height: 200px; overflow-y: scroll;">
							
						</div>
					</div>
				</div>
				
				<!-- 지역 선택 -->
				<div class="col-md-12">
					<div class="panel panel-warning" data-role="resv-cinema-panel">
						<div class="panel-heading">
							<h3 class="panel-title">극장</h3>
						</div>
						<div class="panel-body" style="height: 200px; overflow-y: scroll;">
							
						</div>
					</div>
				</div>
				
				
			</div>
			<!-- /.col-md-6 -->
			
			<div class="col-md-6">
			
				<!-- 상영 일정 선택 -->
				<div class="col-md-12">
					<div class="panel panel-success" data-role="resv-schedule-panel">
						<div class="panel-heading">
							<h3 class="panel-title">상영 일정</h3>
						</div>
						<div class="panel-body" style="height: 780px; overflow-y: scroll;">
							
						</div>
					</div>
				</div>
			</div>
			<!-- /.col-md-6 -->
		</div>
		<!-- /.row -->
		
	</div>
	<!-- /.container -->
	<form id="hiddenData" class="hide" action="" method="">
		<input type="hidden" id="branchNumber" name="branchNumber" value="0">
		<input type="hidden" id="movieNumber" name="movieNumber" value="0">
		<input type="hidden" id="movieroomNumber" name="movieroomNumber" value="0">
		<input type="hidden" id="scheduleType" name="scheduleType">
		<input type="hidden" id="scheduleNumber" name="scheduleNumber" value="0">
		<input type="hidden" id="selectedDate" name="scheduleDateStr" >
		<input type="hidden" id="selectedHour" name="scheduleStartStr" >
		
	</form>
	<form id="hiddenForm" class="hide">
		<input type="text" id="movieSelectCheck" value="0">
		<input type="text" id="branchSelectCheck" value="0">
		<input type="text" id="scheduleTypeSelectCheck" value="0">
	</form>
	
	<script type="text/javascript">
		$(document).ready(function() { 
			$("#hiddenForm input[type='text']").each(function() {
				$(this).attr("value", "0");
			});
			Reservation.init();
			
			$("#movieSelectCheck").on("change", function() {
				if ($("#movieSelectCheck").attr("value") == "1" 
					&& $("#scheduleTypeSelectCheck").attr("value") == "1") {
					
					$("#branchNumber").val("0");
					$("#movieroomNumber").val("0");
					var reqData = $("#hiddenData").serialize();
					var resData = Reservation.getResData(reqData);
					Reservation.makeBranchList(resData);
				}
			});
			
			
			$("#branchSelectCheck").on("change", function() {
				if ($("#selectedDate").val() != '' && $("#branchSelectCheck").attr("value") == "1") {
					var reqData = $("#hiddenData").serialize();
					var resData = Reservation.getResData(reqData);
					Reservation.makeScheduleList(resData);
				}
			});
			
			
			$("#nextStep").click(function(e) {
				e.preventDefault();
				if ($("#scheduleNumber").val() != 0) {
					$("#hiddenData").prop("action", "/reservation/resvSeat");
					$("#hiddenData").prop("method", "POST");
					$("#hiddenData").submit();
				} else {
					alert("관람하실 상영 일정을 선택해 주세요.");
				}
			});
			
		});
	</script>	

	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

	

</body>
</html>