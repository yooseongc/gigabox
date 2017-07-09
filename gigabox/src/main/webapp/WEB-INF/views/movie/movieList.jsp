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

<!-- bootstrap star rating -->
<link rel="stylesheet"
	href="/resources/bootstrap-star-rating/css/star-rating.css" media="all"
	rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap-star-rating/js/star-rating.js"
	type="text/javascript"></script>


<link href="/resources/custom/css/stillcut.css" rel="stylesheet">
<!-- still cut js -->
<script src="/resources/custom/js/stillcut.js"></script>
<!-- custom js -->
<script src="/resources/custom/js/movielist.js" type="text/javascript"></script>
<!-- still cut CSS -->


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
					영화 <small id="pageType">최신개봉작</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>영화</li>
					<li class="active" id="pageType2">최신개봉작</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Service Tabs -->
		<div class="row">
			<div class="col-lg-12">

				<ul id="myTab" class="nav nav-tabs nav-justified"
					style="font-size: 1.2em;">
					<li class="active"><a href="#service-one" data-toggle="tab"><i
							class="fa"></i> 최신개봉작</a></li>
					<li class=""><a href="#service-two" data-toggle="tab"><i
							class="fa"></i> 상영예정작</a></li>
				</ul>


				<div id="movieDetailList" class="tab-content">

					<!-- 최신 상영작 -->
					<div class="tab-pane fade active in" id="service-one"
						data-role="recent">
						<div class="row">
							<div class="col-lg-12">
								<h2 class="page-header"></h2>
							</div>
							<c:forEach items="${movieListRecent}" var="movieItem"
								varStatus="status">
								<c:if test="${status.index % 4 == 0}">
									<div class="row">
								</c:if>
								<div class="col-md-3" data-role="movieItem">
									<div class="panel panel-default text-center">
										<div class="panel-heading">
											<img
												src="${movieItem.moviePoster}/${movieItem.movieCode}.jpg"
												class="img-responsive" width="230" height="320">
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
								<c:if test="${status.index % 4 == 3 }">
						</div>
						</c:if>
						</c:forEach>
					</div>
					<!-- ./row -->
					<c:if test="${rowEnd < movieListCountRecent}">
						<div class="row">
							<div class="col-lg-12">
								<button type="button"
									class="btn btn-outline btn-primary btn-lg btn-block"
									onclick="javascript:readMore('recent')">더보기</button>
								<br>
							</div>
						</div>
						<!-- ./row -->
					</c:if>
				</div>

					<!-- 상영 예정작 -->
					<div class="tab-pane fade" id="service-two">
						<div class="row">
							<div class="col-lg-12">
								<h2 class="page-header"></h2>
							</div>
							<c:forEach items="${movieListTobe}" var="movieItem"
								varStatus="status">
								<c:if test="${status.index % 4 == 0}">
									<div class="row">
								</c:if>
								<div class="col-md-3" data-role="movieItem">
									<div class="panel panel-default text-center">
										<div class="panel-heading">
											<img src="${movieItem.moviePoster}/${movieItem.movieCode}.jpg"
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
								<c:if test="${status.index % 4 == 3}">
									</div>
								</c:if>
							</c:forEach>
						</div>
						<!-- ./row -->
						<c:if test="${rowEnd < movieListCountTobe}">
							<div class="row">
								<div class="col-lg-12">
									<button type="button"
										class="btn btn-outline btn-primary btn-lg btn-block"
										onclick="javascript:readMore('tobe')">더보기</button>
									<br>
								</div>
							</div>
							<!-- ./row -->
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<!-- /.container -->
	
	<!-- footer -->
	<c:import url="/templates/footer.jsp" />



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
										<button type="submit" class="btn btn-danger" role="button"
											id="bookmarkButton" data-num="">
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
								<h3 style="text-align: left; font-weight: board; color: grey;">
									줄거리</h3>
								<br>
								<div style="min-height: 150px; font-size: 1.1em;"
									data-id="movieStoryline"></div>
							</div>
						</div>
					</div>
					
					<!-- 스틸컷 -->
					<div class="row" id="slider-text">
						<div class="col-md-6">
							<h2>Still Cut</h2>
						</div>
					</div>
					<div class="row">
						<div id='carousel-custom' class='carousel slide'
							data-ride='carousel'>
							<div class='carousel-outer'>
								<!-- me art lab slider -->
								<div class='carousel-inner ' id="steelcutCarousel">
									
								</div>

								<!-- sag sol -->
								<a class='left carousel-control' href='#carousel-custom'
									data-slide='prev'> <span
									class='glyphicon glyphicon-chevron-left'></span>
								</a> <a class='right carousel-control' href='#carousel-custom'
									data-slide='next'> <span
									class='glyphicon glyphicon-chevron-right'></span>
								</a>
							</div>

							<!-- thumb -->
							<ol class='carousel-indicators mCustomScrollbar meartlab' id="steelcutCarouselThumb">
								
							</ol>
						</div>
					</div>
					<hr>
					<!-- 트레일러 -->
					<div class="row" id="slider-text">
						<div class="col-md-6">
							<h2>Trailer</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="vid" style="text-align:center;" id="trailerBox">
								<!-- <iframe width="700" height="500"
									src="http://mvod.megabox.co.kr/encodeFile/3550/2017/06/01/a021352a34ab37c5024d242758bab69e_W.mp4"></iframe> -->
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
												class="rating input-group" min=0 max=10 step=1
												data-size="sm" disabled="disabled">
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
	{{#ifRowStart @index}}
		<div class="row">
	{{/ifRowStart}}
	<div class="col-md-3">
		<div class="panel panel-default text-center">
			<div class="panel-heading">
				<img
					src="{{moviePoster}}/{{movieCode}}.jpg"
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
	{{#ifRowEnd @index}}
		</div>
	{{/ifRowEnd}}
	{{/each}}
	</script>
	
	<script>
	// 더보기 카운트
	var boxofficeReadMoreCount = 0;
	var recentReadMoreCount = 0;
	var tobeReadMoreCount = 0;
	var reviewReadMoreCount = 0;
		
	// 영화 목록 더보기
	function readMore(type) {
		if (type = 'recent') {
			recentReadMoreCount++;
			var readUrl = '/movie/movieList/recent/' + recentReadMoreCount;
			var target = $("#service-one > .row:eq(0)");
			var target2 = $("#service-one > .row:eq(1)");
			var count = recentReadMoreCount;
			var totalCount = ${movieListCountRecent}
		} else if (type = 'tobe') {
			tobeReadMoreCount;
			var readUrl = '/movie/movieList/tobe/' + tobeReadMoreCount;
			var target = $("#service-two > .row:eq(0)");
			var target2 = $("#service-two > .row:eq(1)");
			var count = tobeReadMoreCount;
			var totalCount = ${movieListCountTobe}
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
				if ((count+1)*4 >= totalCount ) {
					target2.addClass("hide");
				}
				
				// 별점 초기화
				$(".ratingMore").rating('refresh', {
					showClear: false,
					hoverOnClear: false,
		            starCaptions: function(val) {
		                return val;
		            },
		            starCaptionClasses: function(val) {
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
	
	
	$(document).ready(function() {
		
		// 현재 URL 가져오기
	    var url = location.href;

	    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
	    var parameter = (url.slice(url.indexOf('?listType=') + 10, url.length));
		if (parameter == 'recent') {
			 $('#myTab > li:eq(0) > a').trigger("click"); 
		} else if (parameter == 'tobe') {
			 $('#myTab > li:eq(1) > a').trigger("click"); 
			 
		}
		
		$("#myTab > li").click("a", function() {
			if ($(this).index() == 0) {
				$("#pageType, #pageType2").text("최신개봉작");
			} else if ($(this).index() == 1) {
				$("#pageType, #pageType2").text("상영예정작");
			}
		});
		
		// 예매하기 클릭
		$("#resvButton").click(function(e) {
			e.preventDefault();
			location.href = "/reservation/resvMain";
		});
		
		// 별점 초기화
		$("#starRating").rating('refresh', {
			showClear: false,
			hoverOnClear: false,
            starCaptions: function(val) {
                return val;
            },
            starCaptionClasses: function(val) {
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
			showClear: true,
			hoverOnClear: false,
            starCaptions: function(val) {
                return val;
            },
            starCaptionClasses: function(val) {
            	if (val < 4) {
                    return 'label label-danger';
                } else if (val < 8) {
                    return 'label label-warning';
                } else {
                	return 'label label-success';
                }
            }
        });
		
		$("#bookmarkButton").on('click', function() {
			var movieNum = $(this).attr("data-num");
			if('${sessionScope.login.userId}' == '') {
				alert("로그인 후 사용가능합니다.")	;
				return false;
			}
					$.ajax({
						url : "/mypage/addBookmark",
						type : "POST",
						headers : {
							"Content-Type" : "application/json",
						},
						dataType : 'text',
						data : JSON.stringify({
							movieNumber: movieNum,
							userNumber: '${sessionScope.login.userNumber}'
						}),
						success : function(data) {
							if(data==0){
								 if(confirm("마이무비에 영화가 추가 되었습니다. 마이무비 페이지로 이동하시겠습니까?")) {
									location.href ="/mypage/mymovie?listType=2";
								}
								 return;
							}else{
								alert("이미 추가되었습니다");
							}
						}
					});
				
		});
		
		
		
	});
	</script>

</body>
</html>