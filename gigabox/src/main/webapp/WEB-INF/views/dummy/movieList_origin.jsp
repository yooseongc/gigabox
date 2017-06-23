<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GigaBox - 영화 목록</title>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style type="text/css">
.product_view .modal-dialog {
	max-width: 800px;
	width: 100%;
}

.pre-cost {
	text-decoration: line-through;
	color: #a5a5a5;
}

.space-ten {
	padding: 10px 0;
}

.sd {
	margin-top:
}
</style>
<script type="text/javascript">
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>
</head>
<body>

	<!-- header -->
	<c:import url="/templates/header.jsp"/>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					영화/영화관<small>영화</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">영화</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->



		<!-- Service Tabs -->
		<div class="row">
			<div class="col-lg-12">

				<ul id="myTab" class="nav nav-tabs nav-justified">
					<li class="active"><a href="#service-one" data-toggle="tab"><i
							class="fa"></i> 박스오피스</a></li>
					<li class=""><a href="#service-two" data-toggle="tab"><i
							class="fa"></i> 최신개봉작</a></li>
					<li class=""><a href="#service-three" data-toggle="tab"><i
							class="fa"></i> 상영예정작</a></li>
				</ul>


				<div id="movieDetailList" class="tab-content">
					<div class="tab-pane fade active in" id="service-one">
						<div class="row">
							<div class="col-lg-12">
								<h2 class="page-header"></h2>
							</div>
							<c:forEach items="${movieList}" var="movieItem">
								<div class="col-md-3 col-sm-6">
									<div class="panel panel-default text-center">
										<div class="panel-heading">
											<img
												src="http://image2.megabox.co.kr/mop/poster/2017/D0/FE777E-E4C3-4606-8EA1-987449753072.large.jpg"
												class="img-responsive" width="270" height="376">
										</div>
										<div class="panel-body">
											<div>
												<h4
													style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${movieItem.movieTitle}</h4>
												<div class="rating">
													<span class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> (10 별점)
												</div>
												<button class="btn btn-primary movieDetailListBtn"
													id="movieDetailListBtn" data-id="${movieItem.movieNumber}">상세보기</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<input type="hidden" name="page" id="page" value="${page}">
						<div class="btns">
							<a href="javascript:loadNextPage();" class="btn btn-primary">더보기</a>
						</div>
					</div>
					<div class="tab-pane fade" id="service-two">
						<div class="row">
							<div class="col-lg-12">
								<h2 class="page-header"></h2>
							</div>
							<c:forEach items="${movieList}" var="movieItem">
								<div class="col-md-3 col-sm-6">
									<div class="panel panel-default text-center">
										<div class="panel-heading">
											<img
												src="http://image2.megabox.co.kr/mop/poster/2017/D0/FE777E-E4C3-4606-8EA1-987449753072.large.jpg"
												class="img-responsive" width="270" height="376">
										</div>
										<div class="panel-body">
											<div>
												<h4
													style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${movieItem.movieTitle}</h4>
												<div class="rating">
													<span class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> (10 별점)
												</div>
												<button class="btn btn-primary movieDetailListBtn"
													id="movieDetailListBtn" data-id="${movieItem.movieNumber}">상세보기</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<input type="hidden" name="page" id="page" value="${page}">
						<div class="btns">
							<a href="javascript:loadNextPage();" class="btn btn-primary">더보기</a>
						</div>
					</div>
					<div class="tab-pane fade" id="service-three">
						<div class="row">
							<div class="col-lg-12">
								<h2 class="page-header"></h2>
							</div>
							<c:forEach items="${movieList}" var="movieItem">
								<div class="col-md-3 col-sm-6">
									<div class="panel panel-default text-center">
										<div class="panel-heading">
											<img
												src="http://image2.megabox.co.kr/mop/poster/2017/D0/FE777E-E4C3-4606-8EA1-987449753072.large.jpg"
												class="img-responsive" width="270" height="376">
										</div>
										<div class="panel-body">
											<div>
												<h4
													style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${movieItem.movieTitle}</h4>
												<div class="rating">
													<span class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> <span
														class="glyphicon glyphicon-star"></span> (10 별점)
												</div>
												<button class="btn btn-primary movieDetailListBtn"
													id="movieDetailListBtn" data-id="${movieItem.movieNumber}"
													style="text-overflow: ellipsis;">상세보기</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<input type="hidden" name="page" id="page" value="${page}">
						<div class="btns">
							<a href="javascript:loadNextPage();" class="btn btn-primary">더보기</a>
						</div>
					</div>
				</div>

			</div>
		</div>

		<%-- <!-- Content Row -->
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<table class="table table-bordered table-hover" id="movieListTable">
						<thead>
							<tr>
								<th style="width: 50px; height: 20px; font-size: 1em;">번호</th>
								<th style="width: 150xp; height: 20px; font-size: 1em;">영화제목</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">영화타입</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">영화등급</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">개봉일</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">감독</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">출연진</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">총상영시간</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">장르</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">줄거리</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">영문제목</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">포스터</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">스틸컷</th>
								<th style="width: 150px; height: 20px; font-size: 1em;">트레일러</th>
							</tr>
						</thead>
						<tbody id="movieListTableBody">
							<c:forEach items="${movieList}" var="movieItem">
								<tr data-id="${movieItem.movieNumber}">
									<td>${movieItem.movieNumber}</td>
									<td>${movieItem.movieTitle}</td>
									<td>${movieItem.movieType }</td>
									<td>${movieItem.movieRating }</td>
									<td>${movieItem.movieReleasedate }</td>
									<td>${movieItem.movieDirector }</td>
									<td>${movieItem.movieCast }</td>
									<td>${movieItem.movieScreentime }</td>
									<td>${movieItem.movieGenre }</td>
									<td>${movieItem.movieStoryline }</td>
									<td>${movieItem.movieEngname }</td>
									<td>${movieItem.moviePoster }</td>
									<td>${movieItem.movieSteelcut }</td>
									<td>${movieItem.movieTrailer }</td>
								</tr>

							</c:forEach>
						</tbody>


					</table>
				</div>
			</div>
		</div>
 --%>

		<!-- 영화상세 모달  -->
		<div class="modal fade product_view" id="movieDetailModal">
			<div class="modal-dialog" data-id="movieNumber">
				<div class="modal-content">
					<div class="modal-header">
						<a href="#" data-dismiss="modal" class="class pull-right"><span
							class="glyphicon glyphicon-remove"></span></a>
						<div style="font-size: 28px; font-weight: board;"
							class="col-lg-10" data-id="movieTitle"></div>
						<div
							style="font-size: 15px; font-weight: board; color: grey; margin-top: 18px;"
							class="col-lg-10" data-id="movieEngname"></div>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-5 product_img">
								<img
									src="http://image2.megabox.co.kr/mop/poster/2017/D0/FE777E-E4C3-4606-8EA1-987449753072.large.jpg"
									class="img-responsive" width="270" height="376">
							</div>
							<div class="col-md-6 product_content">
								<div class="rating">
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> (10 별점)
								</div>
								<div class="list-group-item row">
									<div class="col-sm-3">타입 :</div>
									<div class="col-sm-6" data-id="movieType"></div>
								</div>
								<div class="list-group-item row">
									<div class="col-sm-3">개봉일 :</div>
									<div class="col-sm-6" data-id="movieReleasedate"></div>
								</div>
								<div class="list-group-item row">
									<div class="col-sm-3">감독 :</div>
									<div class="col-sm-6" data-id="movieDirector"></div>
								</div>
								<div class="list-group-item row">
									<div class="col-sm-3">출연진 :</div>
									<div class="col-sm-6" data-id="movieCast"></div>
								</div>
								<div class="list-group-item row">
									<div class="col-sm-3">장르 :</div>
									<div class="col-sm-6" data-id="movieGenre"></div>
								</div>
								<div class="list-group-item row">
									<div class="col-sm-6">누적관객 : 0명</div>
									<span class="divider"></span>
									<div class="col-sm-6">전일관객 : 0명</div>
								</div>

								<div class="modal-footer">
									<div class="btn-group btn-group-justified" role="group"
										aria-label="group button">
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-white" role="button">
												<span class="glyphicon glyphicon-heart"></span>보고싶어
											</button>
										</div>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-primary" role="button">예매하기</button>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<h3 style="text-align: left;">줄거리</h3>
						<div style="text-align: left;" data-id="movieStoryline"></div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="well">
								<div>
									<h3 style="display: inline;">한줄평</h3>
								</div>
								<div class="input-group">
									<input name="reviewContent" type="text" class="form-control"
										id="newReviewContent" style="height: 80px;"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-default"
											id="reviewAddBtn" data-num="" style="padding: 2.05em;">
											<span class="glyphicon glyphicon-search"></span> 등록
										</button>
									</span>
								</div>
								<!-- /.input-group -->
							</div>
							<div>
								<div id="review"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 댓글 modify 모달 -->
		<div class="modal" id="modDiv" aria-hidden="true"
			style="display: none; z-index: 1060;">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header"></div>
					<div class="container"></div>
					<div class="modal-body">
						<input type='text' id='reviewContent'>
					</div>
					<div class="modal-footer">
						<button type="button" id="reviewModBtn">수정</button>
						<button type="button" id="reviewDelBtn">삭제</button>
						<button type="button" id="closeBtn">닫기</button>
					</div>
				</div>
			</div>
		</div>



	</div>
	<!-- /.container -->

	<!-- footer -->
	<c:import url="/templates/footer.jsp"/>


	<!-- 	<script type="text/javascript">
		// 주소 검색 모달 창 띄우기
		$('#${movieItem.movieTitl1e}').on("click", function(e) {
			e.preventDefault();
			$('#movieModal').modal({
				show : true,
				backdrop : 'static',
				keyboard : true
			});
		});

	</script>
 -->
	<!-- 	<script type="text/javascript">
		var movieItemSrc = "";

		$(".movieItem").on("click", function(e) {

			var movieItemSrc = $(this).parents("tr").attr('data-num');
			e.preventDefault();
			$('#movieModal').modal({
				show : true,
				backdrop : 'static',
				keyboard : true
			});

		});
	</script>
-->
	<script>
		function insertPage() {
			location.href = "/movie/movieCreate";
		}
	</script>


	<script>
		$(document).ready(function() {
			$('.movieDetailListBtn').on('click', function(e) {
				e.preventDefault();
				// 데이터 불러오기 파트
				var dataId = $(this).attr("data-id");
				$.ajax({
					url : "/movie/movieDetail/"
							+ dataId,
					type : "PUT",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					error : function() {
						alert("시스템 오류입니다.");
					},
					success : function(data) {

						console.log(data.movieNumber);
						$("#reviewAddBtn").attr("data-num",	data.movieNumber);

						$("#detailMovieTitle").text(data.movieTitle);
						$("div[data-id=movieTitle]").text(data.movieTitle);
						$("div[data-id=movieType]").text(data.movieType);
						$("div[data-id=movieRating]").text(data.movieRating);
						$("div[data-id=movieReleasedate]").text(data.movieReleasedate);
						$("div[data-id=movieDirector]").text(data.movieDirector);
						$("div[data-id=movieCast]").text(data.movieCast);
						$("div[data-id=movieScreentime]").text(data.movieScreentime);
						$("div[data-id=movieGenre]").text(data.movieGenre);
						$("div[data-id=movieStoryline]").html(data.movieStoryline);
						$("div[data-id=movieEngname]").text(data.movieEngname);
						$("div[data-id=moviePoster]").text(data.moviePoster);
						$("div[data-id=movieSteelcut]").text(data.movieSteelcut);
						$("div[data-id=movieTrailer]").text(data.movieTrailer);
					}

				});

				$("#movieDeleteBtn").click(function(e) { 
					e.preventDefault();
					if (confirm("정말 삭제하시겠습니까?")) {
						$.ajax({
							cache : false,
							type : 'POST',
							url : "/movie/movieDelete/" + dataId,
							headers : {
								"Content-Type": "application/json",
								"X-HTTP-Method-Override": "PUT"
							},
							success : function() {
								alert("삭제되었습니다.");
								location.reload();
							}
						});
					}
				});

				$('#movieDetailModal').modal({
					show : true,
					keyboard : true
				});
			});

		});
	</script>



	<!-- 더보기 


  <script id="template" type="text/x-handlebars-template">
		{{#each .}}
		<span> {{movieTitle}} <span>
		<div>
			<span> {{movieEngname}} <span>
		</div>
		{{/each}}
	</script>
	<script>
		var source = $("#template").html();
		var template = Handlebars.compile(source);
		var data = {movieTitle:"엥", movieEngname:"aabb"};
		
		$(".row").html(template(data));
	</script>
	
	
	<script>
		function loadNextPage() {

			var lastmno = $(".btn btn-primary movieDetailListBtn:last").attr("data-id");
			var source = $("#template").html();
			var template = Handlebars.compile(source);
			
			
			$.ajax({

				type : 'post',

				url : '/movie/readMore',

				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'json' ,
				data : JSON.stringify({
					mno : lastmno
				}),
				success : function(data){
					var str = "";
					
					if(data != "") {
						$("#rowId").append(template(data));
					}
				}
				}

			});
		}
	</script>

-->
	<!-- 모달 닫기 -->
	<script>
		$("#closeBtn").on("click", function (){
			$("#modDiv").hide("slow");
		});
	</script>


	<!-- 댓글등록 -->
	<script>
		$("#reviewAddBtn").on("click", function() {
			var reviewContent = $("#newReviewContent").val();
			var dataId = $(this).attr("data-num");

			$.ajax({
				type : 'post',
				url : '/review',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					movieNumber: dataId,
					reviewContent: reviewContent
				}),
				success : function(result) {
					if (result == 'SUCCESS') {
						alert("등록 되었습니다.");
						$.getJSON("/review/all/" + dataId, function(data) {
							var str = "";
							console.log(data.length);

							$(data).each(function() {
								str += "<div data-rno='" +this.reviewNumber+"' class='reviewLi'>"
									+ this.reviewNumber
									+ ":"
									+ this.reviewContent
									+ "<button>MOD</button></div>";
							});
							
							$("#review").html(str);

						});
					}
				}
			});
		});
	</script>

	<!-- 댓글 수정버튼 -->
	<script>
		$("#review").on("click", ".reviewLi button", function() {

			var review = $(this).parent();

			var rno = review.attr("data-rno");
			var reviewContent = review.text();

			$(".modal-header").html(rno);
			$("#reviewContent").val(reviewContent);
			$("#modDiv").show("slow");
			$("#reviewContent").focus();
		});
	</script>

	<!-- 댓글 삭제 -->
	<script>
		$("#reviewDelBtn").on("click", function() {
			var rno = $(".modal-header").html();
			var reviewContent = $("#reviewContent").val();

			$.ajax({
				type : 'delete',
				url : '/review/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("삭제 되었습니다.");
						$("#modDiv").hide("slow");
					}
				}
			});
		});
	</script>

	<!-- 댓글 수정 -->
	<script>
		$("#reviewModBtn").on("click", function() {
			var rno = $(".modal-header").html();
			var reviewContentVal = $("#reviewContent").val();

			$.ajax({
				type : 'put',
				url : '/review/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({
					reviewContent : reviewContentVal
				}),
				dataType : 'text',
				success : function(result) {
					console.log(result);
					if (result == 'SUCCESS') {
						alert("수정 되었습니다.");
						$("#modDiv").hide("slow");
					}
				}
			});
		});
	</script>

	<!-- 댓글 템플렛 -->
	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
		<li class="reviewLi" data-rno={{reviewNumber}}>
		<i class="fa fa-comments bg-bule"></i>
<div class="timeline-item">
<span class="time">
<i class="fa fa-clock-o"></i>{{reviewRegisterDate}}
</span>
<h3 class="timeline-header"><strong>{{reviewNumber}}</strong> -{{userNumber}}</h3>
<div class="timeline-body">{{reviewContent}}</div>
<div class="timeline-footer>
<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#review">Modify</a>
</div>
</div>
</li>
		{{/each}}
	</script>

	<!-- 	<script>
	function loadNextPage() {
		var reviewNumber = $(".reviewLi").attr("data-rno");
		var reviewRegisterDate =
		var userNumber = 
		var reviewContent = 
		
		var source = $("#template").html();
		var template = handlebars.compile(source);
		
		$.ajax({

			type : 'post',

			url : '/review/all/' ,

			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json' ,
			data : JSON.stringify({
				reviewNumber : reviewNumber,
				reviewRegisterDate : reviewRegisterDate,
				userNumber : userNumber,
				reviewContent : reviewContent
			}),
			success : function(data){
				var str = "";
				
				if(data != "") {
					$("#rowId").append(template(data));
				}
			}
			}

		});
	</script>
 -->

	<script>
 	function getAllList(){
 		
 		
 		var movieNumber = $(".movieDetailListBtn").attr("data-id");
 		
 		alert(movieNumber);
 		
 		$.ajax({
			url : "/review/all/"
				+ movieNumber,
		type : "get",
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "GET"
		},
		error : function() {
			alert("시스템 오류입니다.");
		},
		success : function(
				data) {
 			
 			var str = "";
 			
 			$(data).each(function(){
 				str += "<div data-rno='" +this.reviewNumber+"' class='reviewLi'>"
				+ this.reviewNumber
				+ ":"
				+ this.reviewContent
				+ "<button>MOD</button></div>";
 			});
 			
 			$("#review").html(str);
		}
 		});
 	}
 </script>
</body>
</html>