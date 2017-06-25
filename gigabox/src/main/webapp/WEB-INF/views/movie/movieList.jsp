<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/movieRatingTag.tld" %>
<%@ page session="true" %>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.10/handlebars.min.js">
</script>

<!-- bootstrap star rating -->
<link rel="stylesheet" href="/resources/bootstrap-star-rating/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<script src="/resources/bootstrap-star-rating/js/star-rating.js" type="text/javascript"></script>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<style type="text/css">
.modal-dialog,
.modal-content {
    /* 80% of window height */
    height: 90%;
    width: 80%;
    margin: 5% auto;
}

.modal-body {
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
					영화 <small id="pageType">박스오피스</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>영화</li>
					<li class="active" id="pageType2">박스오피스</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Service Tabs -->
		<div class="row">
			<div class="col-lg-12">

				<ul id="myTab" class="nav nav-tabs nav-justified" style="font-size: 1.2em;">
					<li class="active"><a href="#service-one" data-toggle="tab"><i
							class="fa"></i> 박스오피스</a></li>
					<li class=""><a href="#service-two" data-toggle="tab"><i
							class="fa"></i> 최신개봉작</a></li>
					<li class=""><a href="#service-three" data-toggle="tab"><i
							class="fa"></i> 상영예정작</a></li>
				</ul>

				
				<div id="movieDetailList" class="tab-content">
				
					<!-- 박스오피스 -->
					<div class="tab-pane fade active in" id="service-one" data-role="boxoffice">
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
												<h4 style="width: 100%; height:1.35em; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
													<tag:rating rating="${movieItem.movieRating}"/> ${movieItem.movieTitle}
												</h4>
												<div class="rating">
													<input id="starRating" value="${movieItem.reviewStarscore}" type="number" data-show-clear="false" data-show-caption="false" 
														class="rating" min="0" max="10" step="0.1" data-size="xs" disabled="disabled">
												</div>
												<button class="btn btn-primary" onclick="viewDetail('${movieItem.movieNumber}')"
													data-id="${movieItem.movieNumber}">상세보기</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<button type="button" class="btn btn-outline btn-primary btn-lg btn-block"
									onclick="javascript:readMore('boxoffice')">더보기</button>
								<br>
							</div>
						</div>
						<!-- ./row -->
					</div>
					
					<!-- 최신 상영작 -->
					<div class="tab-pane fade" id="service-two" data-role="recent">
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
												<h4 style="width: 100%; height:1.35em; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
													<tag:rating rating="${movieItem.movieRating}"/> ${movieItem.movieTitle}
												</h4>
												<div class="rating">
													<input id="starRating" value="${movieItem.reviewStarscore}" type="number" data-show-clear="false" data-show-caption="false" 
														class="rating" min=0 max=10 step=0.1 data-size="xs" disabled="disabled">
												</div>
												<button class="btn btn-primary" onclick="viewDetail('${movieItem.movieNumber}')"
													data-id="${movieItem.movieNumber}">상세보기</button>
											</div>
										</div>
									</div>
					        	</div>
							</c:forEach>
						</div>
						<!-- ./row -->
						<div class="row">
							<div class="col-lg-12">
								<button type="button" class="btn btn-outline btn-primary btn-lg btn-block"
									onclick="javascript:readMore('recent')">더보기</button>
								<br>
							</div>
						</div>
						<!-- ./row -->
					</div>
					
					<!-- 상영 예정작 -->
					<div class="tab-pane fade" id="service-three">
						<div class="row">
							<div class="col-lg-12">
								<h2 class="page-header"></h2>
							</div>
							<c:forEach items="${movieListTobe}" var="movieItem">
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
													<tag:rating rating="${movieItem.movieRating}"/> ${movieItem.movieTitle}
												</h4>
												<div class="rating">
													<input id="starRating" value="${movieItem.reviewStarscore}" type="number" data-show-clear="false" data-show-caption="false" 
														class="rating" min=0 max=10 step=0.1 data-size="xs" disabled="disabled">
												</div>
												<button class="btn btn-primary" onclick="viewDetail('${movieItem.movieNumber}')"
													data-id="${movieItem.movieNumber}">상세보기</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- ./row -->
						
						<div class="row">
							<div class="col-lg-12">
								<button type="button" class="btn btn-outline btn-primary btn-lg btn-block"
									onclick="javascript:readMore('tobe')">더보기</button>
								<br>
							</div>
						</div>
						<!-- ./row -->
						
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
						<div style="font-size: 28px; font-weight: board;"
							class="col-lg-10" data-id="movieTitle"></div>
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
									class="img-responsive" width="270" height="376">
							</div>
							<div class="col-md-8">
							
								<div class="rating">
									<input id="starRating" value="0" type="number" data-show-clear="false" data-show-caption="true"
									class="rating" min=0 max=10 step=0.1 data-size="md" disabled="disabled">
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
									<div class="btn-group btn-group-justified" role="group" aria-label="group button">
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-danger" role="button" id="bookmarkButton">
												<span class="glyphicon glyphicon-heart"></span> 보고싶어
											</button>
										</div>
										
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-primary" role="button" id="resvButton">
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
									<h3 style="text-align: left; font-weight: board; color: grey;"> 줄거리 </h3>
									<br>
									<div style="min-height: 150px; font-size: 1.1em;" data-id="movieStoryline"></div>
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
										<textarea name="reviewContent" class="form-control" readonly="readonly"
											style="resize: none; height: 78.73px;" 
											placeholder="로그인 후 작성할 수 있습니다."></textarea>
										<span class="input-group-btn">
											<button type="button" class="btn btn-default"
													data-num="" disabled="disabled" style="padding: 2.05em;">
												<span class="glyphicon glyphicon-search"></span> 등록
											</button>
										</span>
									</div>
									<div class="rating input-group">
										<input name="reviewRating" value="0" type="number" 
											class="rating input-group" min=0 max=10 step=1 data-size="sm" disabled="disabled"> 
									</div>
								</c:if>
								<c:if test="${sessionScope.login != null}">
									<div class="input-group">
										<textarea name="reviewContent" class="form-control" style="resize: none; height: 78.73px;" 
											id="newReviewContent" placeholder="감상평을 입력하세요."></textarea>
										<span class="input-group-btn">
											<button type="button" class="btn btn-default"
													id="reviewAddBtn" data-num="" onclick="reviewWrite(this);" style="padding: 2.05em;">
												<span class="glyphicon glyphicon-search"></span> 등록
											</button>
										</span>
									</div>
									<div class="rating input-group">
										<input id="reviewStarRating" name="reviewStarscore" value="5" type="number" 
										class="rating input-group" min=0 max=10 step=1 data-size="sm"> 
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

		<!-- 댓글 modify 모달 -->
		<div class="modal" id="reviewControlModal" aria-hidden="true"
			style="display: none; z-index: 1060;">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header"></div>
					<div class="container"></div>
					<div class="modal-body">
						<input type='text' id='reviewContent'>
					</div>
					<div class="modal-footer">
						<button type="button" id="reviewUpdateButton">수정</button>
						<button type="button" id="reviewDeleteButton">삭제</button>
						<button type="button" id="reviewControlModalCloseButton">닫기</button>
					</div>
				</div>
			</div>
		</div>



	</div>
	<!-- /.container -->

	<!-- footer -->
	<c:import url="/templates/footer.jsp"/>


	<!-- 댓글 템플릿 -->
	
	
	<script id="replyTemplate" type="text/x-handlerbars-template">
	{{#each .}}
	<div class="row">
        <div class="col-sm-12" data-num={{user.userNumber}}>
            <div class="panel panel-white post panel-shadow">
                <div class="col-sm-12">
                    <div class="pull-left image">
                        <i class="fa fa-user fa-2x"></i> &nbsp;&nbsp;
                    </div>
                    <div class="pull-left meta">
                        <div class="title h5" style="font-size: 1.1em;">
                            <b>{{user.userName}}</b> ({{user.userId}}) &nbsp;&nbsp;
							<span class="text-muted time"><i class="fa fa-clock-o"></i> &nbsp;{{prettifyDate review.reviewRegisterdate}}</span>
                        	{{#eqReplyer user.userId}}
								&nbsp;&nbsp;
								<a class="btn btn-default btn-xs" onclick="updateReply({{review.reviewNumber}})">
								<i class="fa fa-cog"></i></a>&nbsp;
								<a class="btn btn-default btn-xs" onclick="deleteReply({{review.reviewNumber}})">
								<i class="fa fa-times"></i></a>
							{{/eqReplyer}}
						</div>
                    </div>
                    <div class="pull-right image">
                         <input name="reviewStarscore" value="{{review.reviewStarscore}}" type="number" 
							class="rating" disabled="disabled" min="0" max="10" step="1" data-size="xs"> 
                    </div>
                </div> 
				<br>
                <div class="col-sm-12"> 
                    <p style="font-size: 1.2em;">{{review.reviewContent}}</p>
                </div>
            </div>
        </div>
    </div>
	{{/each}}
	</script>

	<script>
		
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
		for(var g = 0 ; g < genreArray.length ; g++){
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
	
	var printData = function (data, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(data);
		target.html(html);
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
		  var s =
		    leadingZeros(d.getFullYear(), 4) + '-' +
		    leadingZeros(d.getMonth() + 1, 2) + '-' +
		    leadingZeros(d.getDate(), 2) + ' ' +

		    leadingZeros(d.getHours(), 2) + ':' +
		    leadingZeros(d.getMinutes(), 2) + ':' +
		    leadingZeros(d.getSeconds(), 2);

		  return s;
		}

	Handlebars.registerHelper("eqReplyer", function(replyer, block) {
		var accum = '';
		if (replyer == '${sessionScope.login.userId}') {
			accum += block.fn();
		}
		return accum;
	});
	
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		return getTimeStamp(dateObj);
	});
	

	
	function viewDetail(movieNum) {
		$.ajax({
			url : "/movie/movieDetail/"
					+ movieNum,
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

				$("div[data-id=movieTitle]").html(makeRatingTag(data.movieRating) + " " + data.movieTitle);
				$("div[data-id=movieType]").text(data.movieType);
				$("div[data-id=movieReleasedate]").text(makeReleasedateFormat(data.movieReleasedate));
				$("div[data-id=movieDirector]").text(data.movieDirector);
				$("div[data-id=movieCast]").text(data.movieCast);
				$("div[data-id=movieScreentime]").text(data.movieScreentime + "분");
				$("div[data-id=movieGenre]").html(makeGenreTag(data.movieGenre));
				$("div[data-id=movieStoryline]").html(data.movieStoryline);
				$("div[data-id=movieEngname]").text(data.movieEngname);
				
				// 평균점 구하기
								
				// 댓글 불러오기
				$.ajax({
					url : "/review/list/"
							+ data.movieNumber + "/0",
					type : "GET",
					headers : {
						"Content-Type" : "application/json",
					},
					error : function() {
						console.log("댓글 불러오기 오류입니다.");
					},
					success : function(data) {
						printData(data, $("#review"), $("#replyTemplate"));
						
						// 별점 초기화
						$("#review .rating").rating({
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
				
				// 모달
				$('#movieDetailModal').modal({
					show : true,
					keyboard : true
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
				movieNumber: movieNum,
				userNumber: userNum,
				reviewContent: reviewContentVal,
				reviewStarscore: reviewStarRating
			}),
			success : function(result) {
				if (result == 'SUCCESS') {
					$("#newReviewContent").val("");
					$("#reviewStarRating").rating("refresh");
					alert("등록 되었습니다.");
					$.getJSON("/review/list/" + movieNum + "/0", function(data) {
						var str = "";
						console.log(data);
						
						$(data).each(function() {
							str += "<div data-rno='" +this.reviewNumber+"' class='reviewLi'>"
								+ this.reviewNumber
								+ ":"
								+ this.reviewContent
								+ "<button>MOD</button></div>";
						});
						
						$("#review").html(str);

					});
				} else {
					alert("댓글 등록에 실패했습니다.");
				}
			}
		});		
	}
	
	
	$(document).ready(function() {
		
		// 현재 URL 가져오기
	    var url = location.href;

	    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
	    var parameter = (url.slice(url.indexOf('?listType=') + 10, url.length));
		console.log(parameter);
		if (parameter == 'boxoffice') {
			 $("#pageType, #pageType2").text("박스오피스");
			 $('#myTab > li:eq(0) > a').trigger("click"); 
		} else if (parameter == 'recent') {
			 $("#pageType, #pageType2").text("최신개봉작");
			 $('#myTab > li:eq(1) > a').trigger("click"); 
		} else if (parameter == 'tobe') {
			 $("#pageType, #pageType2").text("상영예정작");
			 $('#myTab > li:eq(2) > a').trigger("click"); 
			 
		}
		
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
		
		$("#reviewStarRating").rating('refresh', {
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
		
		// 모달 닫기
		$("#closeBtn").on("click", function (){
			$("#modDiv").hide("slow");
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