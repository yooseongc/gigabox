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
<title>GigaBox - 마이무비</title>
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

<style type="text/css">
#movieDetailModal .modal-dialog, #movieDetailModal .modal-content {
	/* 80% of window height */
	height: 90%;
	width: 80%;
	margin: 5% auto;
}

#movieDetailModal .modal-body {
	/* 100% = dialog height, 120px = header + footer */
	max-height: calc(100% - 120px);
	overflow-y: scroll;
}
</style>
<script type="text/javascript">
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>
<script>
	// 더보기 카운트
	var boxofficeReadMoreCount = 0;
	var recentReadMoreCount = 0;
	var tobeReadMoreCount = 0;
	var reviewReadMoreCount = 0;

	// 관람가 마크
	function makeRatingTag(value) {
		if (value == "전체관람가" || value == "전체 관람가") {
			return "<span class='label label-success' style='border-radius: 50%;'>All</span>";
		} else if (value == "12세 관람가") {
			return "<span class='label label-primary' style='border-radius: 50%; background-color: blue;'>12</span>";
		} else if (value == "15세 관람가") {
			return "<span class='label label-warning' style='border-radius: 50%;'>15</span>";
		} else if (value == "청소년 관람불가") {
			return "<span class='label label-danger' style='border-radius: 50%;'>19</span>";
		} else if (value == "미정") {
			return "<span class='label label-default' style='border-radius: 50%;'>미정</span>";
		}
	}

	function makeGenreTag(value) {
		var genrePrefix = "<span class='label label-success label-sm' style='font-size: 1.1em;'>";
		var genreSuffix = "</span> ";
		var genreTrim = value.replace(/\s/g, "");
		var genreArray = genreTrim.split(",");
		var genreFinal = "";
		for (var g = 0; g < genreArray.length; g++) {
			genreFinal += genrePrefix + genreArray[g] + genreSuffix;
		}
		return genreFinal;
	}

	function makeReleasedateFormat(value) {
		var year = value.substr(0, 4);
		var month = value.substr(4, 2);
		var day = value.substr(6, 2);
		var result = year + "-" + month + "-" + day;
		return result;
	}

	var printData = function(data, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(data);
		target.html(html);
	}

	var printDataReadMore = function(data, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(data);
		target.append(html);
	}

	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();

		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}

	function getTimeStamp(d) {
		var s = leadingZeros(d.getFullYear(), 4) + '-'
				+ leadingZeros(d.getMonth() + 1, 2) + '-'
				+ leadingZeros(d.getDate(), 2) + ' ' +

				leadingZeros(d.getHours(), 2) + ':'
				+ leadingZeros(d.getMinutes(), 2) + ':'
				+ leadingZeros(d.getSeconds(), 2);

		return s;
	}

	Handlebars.registerHelper("eqReplyer", function(replyer, reviewNumber,
			block) {
		var accum = '';
		if (replyer == '${sessionScope.login.userId}') {
			accum += block.fn(this);
		}
		return accum;
	});

	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		return getTimeStamp(dateObj);
	});

	Handlebars.registerHelper("ratingTag", function(data) {
		return makeRatingTag(data);
	});

	// 감상평 더보기
	function reviewReadMore(movieNumber) {
		console.log("감상평 더보기");
		reviewReadMoreCount++;
		$.ajax({
			url : "/review/list/" + movieNumber + "/" + reviewReadMoreCount,
			type : "GET",
			headers : {
				"Content-Type" : "application/json",
			},
			error : function() {
				console.log("댓글 불러오기 오류입니다.");
			},
			success : function(data) {
				console.log(data.length);
				dataArray = {
					arr : data,
					movieNumber : data[0].review.movieNumber
				};
				Handlebars.registerHelper("canReadMore", function(movieNumber,
						block) {
					var accum = '';
					if ((reviewReadMoreCount * 10) <= data.length) {
						accum += block.fn(this);
					}
					return accum;
				});
				$("#review").html("");
				console.log(1);
				printData(dataArray, $("#review"), $("#replyTemplate"));
				console.log(2);
				// 별점 초기화
				$("#review .rating").rating({
					showClear : false,
					hoverOnClear : false,
					starCaptions : function(val) {
						return val;
					},
					starCaptionClasses : function(val) {
						if (val < 4) {
							return 'label label-danger';
						} else if (val < 8) {
							return 'label label-warning';
						} else {
							return 'label label-success';
						}
					}
				});
			}
		});
	}

	// 감상평 쓰기
	function reviewWrite(that) {
		console.log("감상평 쓰기 시작");
		var reviewContentVal = $("#newReviewContent").val();
		var reviewStarRating = $("#reviewStarRating").val();
		var movieNum = $(that).attr("data-num");
		var userNum = "${sessionScope.login.userNumber}";

		$.ajax({
			type : 'PUT',
			url : '/review/write',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			dataType : 'text',
			data : JSON.stringify({
				movieNumber : movieNum,
				userNumber : userNum,
				reviewContent : reviewContentVal,
				reviewStarscore : reviewStarRating
			}),
			success : function(result) {
				if (result == 'SUCCESS') {
					$("#newReviewContent").val("");
					$("#reviewStarRating").rating("refresh");
					alert("등록 되었습니다.");
					reviewReadMoreCount--;
					reviewReadMore(movieNum);
				} else {
					alert("댓글 등록에 실패했습니다.");
				}
			}
		});
	}

	// 감상평 삭제
	function deleteReply(reviewNum) {
		$.ajax({
			type : 'put',
			url : '/review/delete/' + reviewNum,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					reviewReadMoreCount--;
					reviewReadMore($("#reviewAddBtn").attr("data-num"));
				}
			}
		});
	}

	// 감상평 수정 모달
	function updateReply(reviewNum, that) {
		var content = $(that).parents("div[data-id=" + reviewNum + "]").find(
				"div[data-role=reviewContent] > p").text();
		var starScore = $(that).parents("div[data-id=" + reviewNum + "]").find(
				"input[data-role=reviewStarscore]").val();
		$("#reviewUpdateContent").val(content);
		$("#reviewUpdateStarscore").rating("update", starScore);
		console.log(reviewNum);
		$("#reviewUpdateBtn").attr("data-num", reviewNum);
		// 모달
		$("#movieDetailModal").modal("hide");
		$('#reviewUpdateModal').modal({
			show : true,
			keyboard : true
		});
	}

	// 감상평 수정
	function reviewUpdateExec(that) {
		console.log($("#reviewUpdateContent").val());
		$.ajax({
			type : 'PUT',
			url : '/review/update/' + $(that).attr("data-num"),
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				reviewNumber : $(that).attr("data-num"),
				reviewContent : $("#reviewUpdateContent").val(),
				reviewStarscore : $("#reviewUpdateStarscore").val()
			}),
			dataType : 'text',
			success : function(result) {
				if (result == 'SUCCESS') {
					$('#reviewUpdateModal').modal("hide");
					$("#reviewUpdateContent").val("");
					$("#reviewUpdateStarscore").rating("update", 0);
					alert("수정 되었습니다.");
					reviewReadMoreCount--;
					reviewReadMore($("#reviewAddBtn").attr("data-num"));
					$("#movieDetailModal").modal("show");
				}
			}
		});
	}

	$(document).ready(
			function() {

				// 현재 URL 가져오기
				var url = location.href;

				// get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
				var parameter = (url.slice(url.indexOf('?listType=') + 10,
						url.length));
				if (parameter == '2') {
					$("#pageType, #pageType2").text("마이무비");
					$('#myTab > li:eq(1) > a').trigger("click");
				} else if (parameter == '1') {
					$("#pageType, #pageType2").text("예매 확인/취소");
					$('#myTab > li:eq(0) > a').trigger("click");

				} else if (parameter == '3') {
					$("#pageType, #pageType2").text("문의 내역");
					$('#myTab > li:eq(2) > a').trigger("click");
				}

				// 별점 초기화
				$("#starRating").rating('refresh', {
					showClear : false,
					hoverOnClear : false,
					starCaptions : function(val) {
						return val;
					},
					starCaptionClasses : function(val) {
						if (val < 4) {
							return 'label label-danger';
						} else if (val < 8) {
							return 'label label-warning';
						} else {
							return 'label label-success';
						}
					}
				});

				// 감상평 수정 모달 별점 초기화
				$("#reviewUpdateStarscore").rating('refresh', {
					showClear : true,
					hoverOnClear : false,
					starCaptions : function(val) {
						return val;
					},
					starCaptionClasses : function(val) {
						if (val < 4) {
							return 'label label-danger';
						} else if (val < 8) {
							return 'label label-warning';
						} else {
							return 'label label-success';
						}
					}
				});

			});

	// 북마크 삭제
	function bookmarkDeleteBtn(bookmarkNum) {
		if (confirm("정말 삭제하시겠습니까?")) {
			$.ajax({
				url : "/mypage/bookmarkDelete",
				type : "POST",
				headers : {
					"Content-Type" : "application/json",
				},
				dataType : 'text',
				data : JSON.stringify({
					bookmarkNumber : bookmarkNum
				}),
				success : function(data) {
					alert("삭제되었습니다.");
					self.location.reload(true);
				}
			});

		}
	};

	function viewDetail(movieNum) {
		console.log(movieNum)
		$
				.ajax({
					url : "/movie/movieDetail/" + movieNum,
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
						$("#reviewAddBtn").attr("data-num", data.movieNumber);

						$("div[data-id=movieTitle]").html(
								makeRatingTag(data.movieRating) + " "
										+ data.movieTitle);
						$("div[data-id=movieType]").text(data.movieType);
						$("div[data-id=movieReleasedate]").text(
								makeReleasedateFormat(data.movieReleasedate));
						$("div[data-id=movieDirector]")
								.text(data.movieDirector);
						$("div[data-id=movieCast]").text(data.movieCast);
						$("div[data-id=movieScreentime]").text(
								data.movieScreentime + "분");
						$("div[data-id=movieGenre]").html(
								makeGenreTag(data.movieGenre));
						$("div[data-id=movieStoryline]").html(
								data.movieStoryline);
						$("div[data-id=movieEngname]").text(data.movieEngname);
						$("img[data-id=moviePoster]").attr(
								"src",
								data.moviePoster + "/" + data.movieCode
										+ ".jpg");

						$("#reviewStarRating").rating('refresh', {
							showClear : false,
							hoverOnClear : false,
							starCaptions : function(val) {
								return val;
							},
							starCaptionClasses : function(val) {
								if (val < 4) {
									return 'label label-danger';
								} else if (val < 8) {
									return 'label label-warning';
								} else {
									return 'label label-success';
								}
							}
						});
						$("#detailStarRating").rating('update',
								data.reviewStarscore);

						// 댓글 불러오기
						$
								.ajax({
									url : "/review/list/" + data.movieNumber
											+ "/0",
									type : "GET",
									headers : {
										"Content-Type" : "application/json",
									},
									error : function() {
										console.log("댓글 불러오기 오류입니다.");
									},
									success : function(data) {
										if (data.length == 0) {
											$("#review").html("");
											return;

										}
										dataArray = {
											arr : data,
											movieNumber : data[0].review.movieNumber
										};
										console.log("댓글 불러오기");
										reviewReadMoreCount = 0;
										Handlebars
												.registerHelper(
														"canReadMore",
														function(movieNumber,
																block) {
															var accum = '';
															if ((reviewReadMoreCount * 10) <= data.length) {
																accum += block
																		.fn(this);
															}
															return accum;
														});
										printData(dataArray, $("#review"),
												$("#replyTemplate"));

										// 별점 초기화
										$("#review .rating")
												.rating(
														{
															showClear : false,
															hoverOnClear : false,
															starCaptions : function(
																	val) {
																return val;
															},
															starCaptionClasses : function(
																	val) {
																if (val < 4) {
																	return 'label label-danger';
																} else if (val < 8) {
																	return 'label label-warning';
																} else {
																	return 'label label-success';
																}
															}
														});
									}
								});

						// 모달
						$('#movieDetailModal').modal({
							show : true,
							keyboard : true
						});
					}

				});

	}
</script>

<style type="text/css">
.nav-tabs {
	text-align: center;
}

.nav-tabs li {
	float: none;
	display: inline-block;
}
</style>

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

		<!-- Service Tabs -->
		<div class="container">
			<div class="row">
				<!-- <h2>Welcome to IGHALO!<sup>™</sup></h2>-->
				<div class="board-inner">
					<ul class="nav nav-tabs" id="myTab">

						<li class="active"><a href="#resvInfo" data-toggle="tab"
							title="예매 확인/취소"> <span class="round-tabs one"> <i
									class="glyphicon glyphicon-user"></i>
							</span>
						</a></li>

						<li><a href="#mymovie" data-toggle="tab" title="마이무비"> <span
								class="round-tabs two"> <i
									class="glyphicon glyphicon-film"></i>
							</span>
						</a></li>

						<li><a href="#qnaInfo" data-toggle="tab" title="문의 내역 확인">
								<span class="round-tabs three"> <i
									class="glyphicon glyphicon-comment"></i>
							</span>
						</a></li>
					</ul>
				</div>

				<div class="tab-content">
					<div class="tab-pane fade in active" id="resvInfo">예매 확인/취소</div>

					<div class="tab-pane fade" id="mymovie">
						<div class="row">
							<div class="col-lg-12">
								<h2 class="page-header"></h2>
							</div>
							<c:forEach items="${bookmarkList}" var="bookmarkItem"
								varStatus="status">
								<c:if test="${status.index % 4 == 0}">
									<div class="row">
								</c:if>
								<div class="col-md-3" data-role="bookmarkItem">
									<div class="panel panel-default text-center">
										<div class="panel-heading">
											<img
												src="${bookmarkItem.movie.moviePoster}/${bookmarkItem.movie.movieCode}.jpg"
												class="img-responsive" width="270" height="376">
										</div>
										<div class="panel-body">
											<div>
												<h4
													style="width: 100%; height: 1.35em; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
													<tag:rating rating="${bookmarkItem.movie.movieRating}" />${bookmarkItem.movie.movieTitle}
												</h4>
												<div class="rating">
													<input id="starRating"
														value="${bookmarkItem.movie.reviewStarscore}"
														type="number" data-show-clear="false"
														data-show-caption="false" class="rating" min=0 max=10
														step=0.1 data-size="xs" disabled="disabled">
												</div>
												<button class="btn btn-primary"
													onclick="viewDetail('${bookmarkItem.movie.movieNumber}')"
													data-id="${bookmarkItem.movie.movieNumber}">상세보기</button>
												<button class="btn btn-danger"
													onclick="bookmarkDeleteBtn('${bookmarkItem.bookmark.bookmarkNumber}')"
													data-id="${bookmarkItem.movie.movieNumber}">삭제</button>

											</div>
										</div>
									</div>
								</div>
								<c:if test="${status.index % 4 == 3}">
						</div>
						</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="qnaInfo">문의 내역 확인</div>
		</div>


	</div>
	</div>
	</div>


	<!-- 영화상세 모달  -->
	<div class="modal fade" id="movieDetailModal">
		<div class="modal-dialog modal-large">
			<div class="modal-content">
				<div class="modal-header">
					<a href="#" data-dismiss="modal" class="class pull-right"><span
						class="glyphicon glyphicon-remove"></span></a>
					<div style="font-size: 28px; font-weight: board;" class="col-lg-10"
						data-id="movieTitle"></div>
					<div
						style="font-size: 15px; font-weight: board; color: grey; margin-top: 18px;"
						class="col-lg-10" data-id="movieEngname"></div>
					<input type="hidden" id="movieNumber" name="movieNumber">
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-4">
							<img
								src="http://image2.megabox.co.kr/mop/poster/2017/D0/FE777E-E4C3-4606-8EA1-987449753072.large.jpg"
								class="img-responsive" data-id="moviePoster" width="270"
								height="376">
						</div>
						<div class="col-md-8">

							<div class="rating">
								<input id="detailStarRating" value="" type="number"
									data-show-clear="false" data-show-caption="true" class="rating"
									min=0 max=10 step=0.1 data-size="md" disabled="disabled">

							</div>
							<div class="list-group-item row">
								<div class="col-sm-3">타입 :</div>
								<div class="col-sm-9" data-id="movieType"></div>
							</div>
							<div class="list-group-item row">
								<div class="col-sm-3">개봉일 :</div>
								<div class="col-sm-9" data-id="movieReleasedate"></div>
							</div>
							<div class="list-group-item row">
								<div class="col-sm-3">감독 :</div>
								<div class="col-sm-9" data-id="movieDirector"></div>
							</div>
							<div class="list-group-item row">
								<div class="col-sm-3">출연진 :</div>
								<div class="col-sm-9" data-id="movieCast"></div>
							</div>
							<div class="list-group-item row">
								<div class="col-md-3">장르 :</div>
								<div class="col-md-9" data-id="movieGenre"></div>
							</div>
							<div class="list-group-item row">
								<div class="col-md-3">상영시간 :</div>
								<div class="col-md-9" data-id="movieScreentime"></div>
							</div>

							<div class="list-group-item row">
								<div class="btn-group btn-group-justified" role="group"
									aria-label="group button">
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-danger" role="button"
											id="bookmarkButton" disabled>
											<span class="glyphicon glyphicon-heart"></span> 보고싶어
										</button>
									</div>

									<div class="btn-group" role="group">
										<button type="button" class="btn btn-primary" role="button"
											id="resvButton">
											<i class="glyphicon glyphicon-time"></i> 예매하기
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-lg-12">
							<div class="well">
								<h3 style="text-align: left; font-weight: 800; color: grey;">
									줄거리</h3>
								<br>
								<div style="min-height: 150px; font-size: 1.1em;"
									data-id="movieStoryline"></div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-lg-12">
							<div class="well">
								<div>
									<h3 style="display: inline;">한줄평</h3>
								</div>
								<br>
								<c:if test="${sessionScope.login == null}">
									<div class="input-group">
										<textarea name="reviewContent" class="form-control"
											readonly="readonly" style="resize: none; height: 78.73px;"
											placeholder="로그인 후 작성할 수 있습니다."></textarea>
										<span class="input-group-btn">
											<button type="button" class="btn btn-default" data-num=""
												disabled="disabled" style="padding: 2.05em;">
												<span class="glyphicon glyphicon-search"></span> 등록
											</button>
										</span>
									</div>
									<div class="rating input-group">
										<input name="reviewRating" value="0" type="number"
											class="rating input-group" min=0 max=10 step=1 data-size="sm"
											disabled="disabled">
									</div>
								</c:if>
								<c:if test="${sessionScope.login != null}">
									<div class="input-group">
										<textarea name="reviewContent" class="form-control"
											style="resize: none; height: 78.73px;" id="newReviewContent"
											placeholder="감상평을 입력하세요."></textarea>
										<span class="input-group-btn">
											<button type="button" class="btn btn-default"
												id="reviewAddBtn" data-num="" onclick="reviewWrite(this);"
												style="padding: 2.05em;">
												<span class="glyphicon glyphicon-search"></span> 등록
											</button>
										</span>
									</div>
									<div class="rating input-group">
										<input id="reviewStarRating" name="reviewStarscore" value="5"
											type="number" class="rating input-group" min=0 max=10 step=1
											data-size="sm">
									</div>
								</c:if>
								<!-- /.input-group -->
							</div>
							<!-- 댓글 -->
							<div>
								<div id="review"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- ./modal-body -->
			</div>
		</div>
	</div>

	<!-- 감상평 모달 -->
	<div class="modal fade" id="reviewUpdateModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<a href="#" data-dismiss="modal" class="class pull-right"><span
						class="glyphicon glyphicon-remove"></span></a>
					<div style="font-size: 28px; font-weight: board;" class="col-lg-12">감상평
						수정</div>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<textarea name="reviewContent" class="form-control"
							style="resize: none; height: 78.73px;" id="reviewUpdateContent"
							placeholder="감상평을 입력하세요."></textarea>
						<span class="input-group-btn">
							<button type="button" class="btn btn-default"
								id="reviewUpdateBtn" data-num=""
								onclick="reviewUpdateExec(this);" style="padding: 2.05em;">
								<span class="glyphicon glyphicon-search"></span> 수정
							</button>
						</span>
					</div>
					<div class="rating input-group">
						<input id="reviewUpdateStarscore" name="reviewStarscore" value=""
							type="number" class="rating input-group" min=0 max=10 step=1
							data-size="sm">

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>


	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

	<!-- 댓글 템플릿 -->


	<script id="replyTemplate" type="text/x-handlerbars-template">
	<div class="row">
	{{#each arr}}
        <div class="col-sm-12" data-num="{{user.userNumber}}" data-id="{{review.reviewNumber}}">
            <div class="panel panel-white post panel-shadow">
                <div class="col-sm-12">
                    <div class="pull-left image">
                        <i class="fa fa-user fa-2x"></i> &nbsp;&nbsp;
                    </div>
                    <div class="pull-left meta">
                        <div class="title h5" style="font-size: 1.1em;">
                            <b>{{user.userName}}</b> ({{user.userId}}) &nbsp;&nbsp;
							<span class="text-muted time"><i class="fa fa-clock-o"></i> &nbsp;{{prettifyDate review.reviewRegisterdate}}</span>
                        	{{#eqReplyer user.userId review.reviewNumber}}
								&nbsp;&nbsp;
								<a class="btn btn-default btn-xs" onclick="updateReply({{{review.reviewNumber}}}, this)">
								<i class="fa fa-cog"></i></a>&nbsp;
								<a class="btn btn-default btn-xs" onclick="deleteReply({{{review.reviewNumber}}})">
								<i class="fa fa-times"></i></a>
							{{/eqReplyer}}
						</div>
                    </div>
                    <div class="pull-right image">
                         <input name="reviewStarscore" value="{{review.reviewStarscore}}" type="number" 
							class="rating" disabled="disabled" min="0" max="10" step="1" 
							data-size="xs" data-role="reviewStarscore"> 
                    </div>
                </div> 
				<br>
                <div class="col-sm-12" data-role="reviewContent"> 
                    <p style="font-size: 1.2em;">{{review.reviewContent}}</p>
                </div>
            </div>
        </div>
    
	{{/each}}
	</div>
	{{#canReadMore movieNumber}}
	<div class="row">
		<div class="col-lg-12">
			<button type="button" class="btn btn-outline btn-default btn-md btn-block"
					onclick="javascript:reviewReadMore({{{movieNumber}}});">더보기</button>
			<br>
		</div>
	</div>
	{{/canReadMore}}
	</script>

	<script id="readMoreTemplate" type="text/x-handlerbars-template">
	{{#each .}}
	<div class="col-md-3 col-sm-6">
		<div class="panel panel-default text-center">
			<div class="panel-heading">
				<img
					src="http://image2.megabox.co.kr/mop/poster/2017/D0/FE777E-E4C3-4606-8EA1-987449753072.large.jpg"
					class="img-responsive" width="270" height="376">
			</div>
			<div class="panel-body">
				<div>
					<h4 style="width: 100%; height:1.35em; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
						{{{ratingTag movieRating}}} {{movieTitle}}
					</h4>
					<div class="rating">
						<input value="{{reviewStarscore}}" type="number" data-show-clear="false" data-show-caption="false" 
							class="rating ratingMore" min=0 max=10 step=0.1 data-size="xs" disabled="disabled">
					</div>
					<button class="btn btn-primary" onclick="viewDetail('{{movieNumber}}')"
						data-id="{{movieNumber}}">상세보기</button>
				</div>
			</div>
		</div>
	</div>
	{{/each}}
	</script>



	<script>
		// 영화 목록 더보기
		function readMore(type) {
			if (type = 'recent') {
				recentReadMoreCount++;
				var readUrl = '/movie/movieList/recent/' + recentReadMoreCount;
				var target = $("#service-one > .row:eq(0)");
				var target2 = $("#service-one > .row:eq(1)");
				var count = recentReadMoreCount;
				var totalCount = $
				{
					movieListCountRecent
				}
			} else if (type = 'tobe') {
				tobeReadMoreCount;
				var readUrl = '/movie/movieList/tobe/' + tobeReadMoreCount;
				var target = $("#service-two > .row:eq(0)");
				var target2 = $("#service-two > .row:eq(1)");
				var count = tobeReadMoreCount;
				var totalCount = $
				{
					movieListCountTobe
				}
			}

			$.ajax({
				type : 'GET',
				url : readUrl,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET"
				},
				success : function(result) {
					printDataReadMore(result, target, $("#readMoreTemplate"));
					if ((count + 1) * 8 >= totalCount) {
						target2.addClass("hide");
					}

					// 별점 초기화
					$(".ratingMore").rating('refresh', {
						showClear : false,
						hoverOnClear : false,
						starCaptions : function(val) {
							return val;
						},
						starCaptionClasses : function(val) {
							if (val < 4) {
								return 'label label-danger';
							} else if (val < 8) {
								return 'label label-warning';
							} else {
								return 'label label-success';
							}
						}
					});
				}
			});

		}
	</script>
</body>
</html>