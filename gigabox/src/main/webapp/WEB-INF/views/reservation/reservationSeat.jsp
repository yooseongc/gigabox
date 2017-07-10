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

<!-- jquery-seat-chart -->
<link rel="stylesheet" type="text/css" href="/resources/jquery-seat-chart/jquery.seat-charts.css">
<script src="/resources/jquery-seat-chart/jquery.seat-charts.js"></script> 

<!-- custom-reservation-module -->
<link rel="stylesheet" href="/resources/custom/css/seat.css" />
<script src="/resources/custom/js/seat.js"></script>



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
					빠른 예매 <small>좌석 선택</small>
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
            		<i class="fa fa-info-circle"></i>좌석을 선택해 주세요. (최대 6석)</span>
            	<button onclick="location.href='/reservation/resvMain';" class="btn btn-md btn-outline btn-primary pull-right">
            		<i class="glyphicon glyphicon-repeat"></i> 다시 예매</button>
            	<button onclick="location.href='/'" class="btn btn-md btn-outline btn-danger pull-right">
            		<i class="glyphicon glyphicon-home"></i> 메인으로</button>
            	<button id="nextStep" class="btn btn-md btn-outline btn-success pull-right">
            		<i class="glyphicon glyphicon-ok"></i>결제</button>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			
			<div class="col-md-8">
				
				<!-- 날짜 선택 -->
				<div class="col-md-12">
					<div class="panel panel-danger" data-role="resv-seatSelect-panel">
						<div class="panel-heading">
							<h3 class="panel-title">좌석 선택</h3>
						</div>
						<div class="panel-body" style="height: 700px;">
							<div id="seat-map">
								<div class="front-indicator">스&nbsp;&nbsp;&nbsp;크&nbsp;&nbsp;&nbsp;린</div>
							</div>
							<div id="legend"></div>
						</div>
					</div>
				</div>
				
			</div>
			<!-- /.col-md-8 -->
			
			<div class="col-md-4">
			
				<!-- 상영 일정 선택 -->
				<div class="col-md-12">
					<div class="panel panel-success" data-role="resv-seatInfo-panel">
						<div class="panel-heading">
							<h3 class="panel-title">예약 선택</h3>
						</div>
						<div class="panel-body" style="height: 700px;">
							<form id="seatForm">
							<div class="form form-horizontal">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="reservationAdultnum">성인</label>
									<div class="col-sm-9">
										<div class="input-group col-sm-9">
											<input class="form-control" min="0" max="6" data-role="people"
												id="reservationAdultnum" name="reservationAdultnum" type="number" value="0">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="reservationYouthnum">청소년</label>
									<div class="col-sm-9">
										<div class="input-group col-sm-9">
											<input class="form-control" min="0" max="6" data-role="people"
												id="reservationYouthnum" name="reservationYouthnum" type="number" value="0">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="reservationChildnum">아동</label>
									<div class="col-sm-9">
										<div class="input-group col-sm-9">
											<input class="form-control" min="0" max="6" data-role="people"
												id="reservationChildnum" name="reservationChildnum" type="number" value="0">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="reservationPreferencenum">우대</label>
									<div class="col-sm-9">
										<div class="input-group col-sm-9">
											<input class="form-control" min="0" max="6" data-role="people"
												id="reservationPreferencenum" name="reservationPreferencenum" type="number" value="0">
										</div>
									</div>
								</div>
							</div>
								<input type="hidden" id="scheduleNumber" name="scheduleNumber" value="${scheduleNumber}">
								<input type="hidden" id="userNumber" name="userNumber" value="${sessionScope.login.userNumber}">
								<input type="hidden" id="movieroomNumber" name="movieroomNumber" value="${movieroomNumber}">
								<input type="hidden" id="seat1" name="reservationSeat1">
								<input type="hidden" id="seat2" name="reservationSeat2">
								<input type="hidden" id="seat3" name="reservationSeat3">
								<input type="hidden" id="seat4" name="reservationSeat4">
								<input type="hidden" id="seat5" name="reservationSeat5">
								<input type="hidden" id="seat6" name="reservationSeat6">
								<input type="hidden" id="reservationPayamount" name="reservationPayamount" />
							</form>
							<br>
							<script>
								function calcTotal() {
									var bargain = parseInt($("#reservationYouthnum").val())*1000 +
									parseInt($("#reservationChildnum").val())*2000 +
									parseInt($("#reservationPreferencenum").val())*2000;
									$("#bargain").text(bargain);
									$("#realTotal").text(parseInt($("#total").text()) - parseInt($("#bargain").text()));
								}
								
								$(document).ready(function() {
									$("input[data-role='people']").on("change", function() {
										var total = 
											parseInt($("#reservationAdultnum").val()) +
											parseInt($("#reservationYouthnum").val()) +
													parseInt($("#reservationChildnum").val()) +
											parseInt($("#reservationPreferencenum").val());
										if (total > 6) {
											alert("6명 이상 선택할 수 없습니다.");
											$(this).val($(this).val()-1);
											return false;
										}
										if ((sc.find('selected').length+1) > total) {
											sc.find('selected').each(function() {
												$(this).trigger("click");
											});
											return false;
										}
									});
								});
							</script>
							<div class="booking-details" style="padding-top: 0px;">
								<h3>
									선택된 좌석 (<span id="counter">0</span>석):
								</h3>
								<ul id="selected-seats" style="height: 200px; list-style: decimal;">
								</ul>
								<p class="well well-md well-info">
									요금 할인은 청소년 1000원, <br>아동 및 우대 2000원 입니다.					
								</p>
								<p class="well well-md well-info">
									금액 : <b><span id="total">0</span>원</b><br>	
									할인 : <b><span id="bargain">0</span>원</b><br>
									적용 금액: <b><span id="realTotal">0</span>원</b>						
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->
		
	</div>
	<!-- /.container -->

	
	<script type="text/javascript">
		
		function transformMap(beforeMap) {
			map = beforeMap
			var colCount = map[0].length;
			var rowCount = map.length;
			for (var i = 0; i < map.length; i++) {
				map[i] = map[i].replace(/w/gi,"_");
			}
			return map;
		}
	
		function mapLoad(loadmap, loadseats) {
			map = loadmap;
			seats = loadseats;
			var colCount = map[0].length;
			var rowCount = map.length;
			$('.seatCharts-row').remove();
			$('.seatCharts-legendItem').remove();
			$('#seat-map,#seat-map *').unbind().removeData();
			sc = $("#seat-map").seatCharts({
				map: transformMap(map), 
				seats: seats,
				naming: naming,
				legend: legend,
				click: click
			});
			$("#seat-map").css("width", 22*(parseInt(colCount)+1));
			//$("#seat-map").css("height", 22*(parseInt(rowCount)+5));
			
			var resvSeat = new Array();
			// 기존에 예약된 좌석
			$.ajax({
				url: '/reservation/resvList',
				type: 'GET',
				data: {scheduleNumber: $("#scheduleNumber").val()},
				async: false,
				dataType: 'json'
			}).success(function(data) {
				for (var i = 0; i < data.length; i++) {
					if (data[i].reservationSeat1 != null) {
						resvSeat.push(data[i].reservationSeat1);
					}
					if (data[i].reservationSeat2 != null) {
						resvSeat.push(data[i].reservationSeat2);
					}
					if (data[i].reservationSeat3 != null) {
						resvSeat.push(data[i].reservationSeat3);
					}
					if (data[i].reservationSeat4 != null) {
						resvSeat.push(data[i].reservationSeat4);
					}
					if (data[i].reservationSeat5 != null) {
						resvSeat.push(data[i].reservationSeat5);
					}
					if (data[i].reservationSeat6 != null) {
						resvSeat.push(data[i].reservationSeat6);
					}
				}
			});
			for (var i = 0; i < resvSeat.length; i++) {
				var each = resvSeat[i];
				var col = parseInt(each.substring(1));
				var row = each.charCodeAt(0)-64;
				var id = row + "_" + col;
				sc.status(id,'unavailable');
			}
		}
		
		function recalculateTotal(sc) {
			var total = 0;
		
			//basically find every selected seat and sum its price
			sc.find('selected').each(function () {
				total += parseInt(this.data().price);
				
			});
			
			return parseInt(total);
		}
	
		$(document).ready(function() { 
			var $cart = $('#selected-seats');
			var $counter = $('#counter');
			var $total = $('#total');
			naming = {
				top : false,
				getLabel : function (character, row, column) {
					/* if (row == 1 && column == 1) {
						firstSeatLabel = 1;
					}
					return firstSeatLabel++; */
					// A 아스키 코드 : 65 
					return String.fromCharCode(64 + row) + column;
				}
			};
			legend = {
				node : $('#legend'),
			    items : [
					[ 's', 'available', 'Standard Zone' ],
					[ 'p', 'available', 'Prime Zone'],
					[ 'd', 'available', '장애인석']
			    ]					
			};
			click = function() {
				if (this.status() == 'available') {
					//let's create a new <li> which we'll add to the cart items
					var totalCount = 
						parseInt($("#reservationAdultnum").val()) +
						parseInt($("#reservationYouthnum").val()) +
								parseInt($("#reservationChildnum").val()) +
						parseInt($("#reservationPreferencenum").val());
					if(parseInt($counter.text()) >= totalCount) {
						alert("더 이상 선택하실 수 없습니다.");
						return 'available';
					}
					$('<li>'+this.data().category+' 좌석 '+this.settings.label+': <b>'+this.data().price+'원</b> <a href="#" class="cancel-cart-item label label-danger">취소</a></li>')
						.attr('id', 'cart-item-'+this.settings.id)
						.data('seatId', this.settings.id)
						.appendTo($cart);
					
					$('#selected-seats').on('click', '.cancel-cart-item', function () {
						//let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
						sc.get($(this).parents('li:first').data('seatId')).click();
					});

					/*
					 * Lets update the counter and total
					 *
					 * .find function will not find the current seat, because it will change its stauts only after return
					 * 'selected'. This is why we have to add 1 to the length and the current seat price to the total.
					 */
					$counter.text(sc.find('selected').length+1);
					$total.text(recalculateTotal(sc)+parseInt(this.data().price));
					$("#seat"+$counter.text()).val(this.settings.label);
					calcTotal();
					return 'selected';
				} else if (this.status() == 'selected') {
					//update the counter
					$("#seat"+$counter.text()).removeAttr("value");
					$counter.text(sc.find('selected').length-1);
					//and total
					$total.text(recalculateTotal(sc)-this.data().price);
					
					//remove the item from our cart
					$('#cart-item-'+this.settings.id).remove();
					
					calcTotal();
					//seat has been vacated
					return 'available';
				} else if (this.status() == 'unavailable') {
					//seat has been already booked
					return 'unavailable';
				} else {
					return this.style();
				}
			};
			
			$.ajax({
				url: "http://choiys3574.cafe24.com/upload/gigabox/movieroom/" + $("#movieroomNumber").val() + "/seatdata",
				//url: "http://choiys3574.cafe24.com/upload/gigabox/movieroom/1/seatdata",
				type: "GET",
				error: function() {
					console.log("좌석 정보 로딩 실패");
				},
				success: function(data) {
					map = data.map;
					seats = data.seats;
					mapLoad(map, seats);
				}
			});
			
			
			$("#nextStep").click(function(e) {
				e.preventDefault();
				var total = 
					parseInt($("#reservationAdultnum").val()) +
					parseInt($("#reservationYouthnum").val()) +
							parseInt($("#reservationChildnum").val()) +
					parseInt($("#reservationPreferencenum").val());
				if (parseInt($("#counter").text()) <= 0) {
					alert("좌석을 선택해 주세요.");
					return;
				}
				if (total != sc.find('selected').length) {
					alert("인원 수에 맞게 좌석을 선택해 주세요.");
					return;
				}
				$("#reservationPayamount").val($("#realTotal").text());
				$("#seatForm").attr("method", "POST");
				$("#seatForm").attr("action", "/reservation/resvPayment");
				$("#seatForm").submit();
			});
	});
	</script>	

	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

	

</body>
</html>