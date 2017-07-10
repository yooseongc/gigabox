


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
	
	var printDataReadMore = function (data, target, templateObject) {
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
		  var s =
		    leadingZeros(d.getFullYear(), 4) + '-' +
		    leadingZeros(d.getMonth() + 1, 2) + '-' +
		    leadingZeros(d.getDate(), 2) + ' ' +

		    leadingZeros(d.getHours(), 2) + ':' +
		    leadingZeros(d.getMinutes(), 2) + ':' +
		    leadingZeros(d.getSeconds(), 2);

		  return s;
		}

	
	
	
	
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

				$("#reviewAddBtn").attr("data-num",	data.movieNumber);
				$("input").attr("value",data.movieNumber);
				$("div[data-id=movieTitle]").html(makeRatingTag(data.movieRating) + " " + data.movieTitle);
				$("div[data-id=movieType]").text(data.movieType);
				$("div[data-id=movieReleasedate]").text(makeReleasedateFormat(data.movieReleasedate));
				$("div[data-id=movieDirector]").text(data.movieDirector);
				$("div[data-id=movieCast]").text(data.movieCast);
				$("div[data-id=movieScreentime]").text(data.movieScreentime + "분");
				$("div[data-id=movieGenre]").html(makeGenreTag(data.movieGenre));
				$("div[data-id=movieStoryline]").html(data.movieStoryline);
				$("div[data-id=movieEngname]").text(data.movieEngname);
				$("img[data-id=moviePoster]").attr("src", data.moviePoster + "/" + data.movieCode + ".jpg");
				$("#bookmarkButton").attr("data-num",data.movieNumber);

				
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
				$("#detailStarRating").rating('update', data.reviewStarscore);
				
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
						if (data.length == 0) {
							$("#review").html("");
							return;
						}
						dataArray = {arr: data, movieNumber: data[0].review.movieNumber};
						reviewReadMoreCount = 0;
						Handlebars.registerHelper("canReadMore", function(movieNumber, block) { 
							var accum = '';
							if ((reviewReadMoreCount*10) <= data.length) {
								accum += block.fn(this);
							}
							return accum;
						});
						printData(dataArray, $("#review"), $("#replyTemplate"));
						
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
				
				// 스틸컷
				var scBox = $("#steelcutCarousel");
				var scThumb = $("#steelcutCarouselThumb");
				scBox.html("");
				scThumb.html("");
				$.ajax({
					url : data.movieSteelcut + "/fileList", 
					type: "GET",
					async: false,
					success: function(sdata) {
						var count = 0;
						for (var i = 0; i < sdata.fileList.length; i++) {
							if (sdata.fileList[i] != 'thumb') {
								var div = $("<div></div").addClass("item");
								var img = $("<img>").attr("src", data.movieSteelcut + "/" + sdata.fileList[i]);
								div.append(img);
								scBox.append(div);
								
								var li = $("<li></li>").attr("data-target", "#carousel-custom")
									.attr("data-slide-to", count);
								var img2 = $("<img>").attr("src", data.movieSteelcut + "/" + sdata.fileList[i]);
								li.append(img2);
								scThumb.append(li);
								count++;
							}
						}
						scBox.children("div:eq(0)").addClass("active");
						scThumb.children("li:eq(0)").addClass("active");
					}
				});
				
				// 트레일러
				var tBox = $("#trailerBox");
				tBox.html("");
				$.ajax({
					url : data.movieTrailer + "/fileList", 
					type: "GET",
					success: function(tdata) {
						var vSrc = data.movieTrailer + "/" + tdata.fileList[0];
						var vBox = $("<video></video>").attr("controls", "controls").attr("preload", "metadata")
							.attr("width", "100%").attr("height", "100%");
						var vSBox = $("<source></source>").attr("src", vSrc).attr("type", "video/mp4");
						vBox.append(vSBox);
						tBox.append(vBox);
					}
				});
				
				// 모달
				$('#movieDetailModal').modal({
					show : true,
					keyboard : true
				});
				$('#movieDetailModal').on('hidden.bs.modal', function () {
					tBox.find("video").get(0).pause();
				});
			}

		});
		
	}
	
	
	
	// 감상평 더보기
	function reviewReadMore(movieNumber) {
		reviewReadMoreCount++;
		$.ajax({
			url : "/review/list/"
					+ movieNumber + "/" + reviewReadMoreCount,
			type : "GET",
			headers : {
				"Content-Type" : "application/json",
			},
			error : function() {
				console.log("댓글 불러오기 오류입니다.");
			},
			success : function(data) {
				dataArray = {arr: data, movieNumber: data[0].review.movieNumber};
				Handlebars.registerHelper("canReadMore", function(movieNumber, block) { 
					var accum = '';
					if ((reviewReadMoreCount*10) <= data.length) {
						accum += block.fn(this);
					}
					return accum;
				});
				$("#review").html("");
				printData(dataArray, $("#review"), $("#replyTemplate"));
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
		var content = $(that).parents("div[data-id="+reviewNum+"]").find("div[data-role=reviewContent] > p").text();
		var starScore = $(that).parents("div[data-id="+reviewNum+"]").find("input[data-role=reviewStarscore]").val();
		$("#reviewUpdateContent").val(content);
		$("#reviewUpdateStarscore").rating("update", starScore);
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
		$.ajax({
			type: 'PUT',
			url: '/review/update/' + $(that).attr("data-num"),
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data: JSON.stringify({
				reviewNumber: $(that).attr("data-num"),
				reviewContent: $("#reviewUpdateContent").val(),
				reviewStarscore: $("#reviewUpdateStarscore").val()
			}),
			dataType: 'text',
			success: function(result) {
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