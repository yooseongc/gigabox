var OneLevelSelectorPrototype = {
	init: function(l) {
		var navItems = $(l + ' li > a');
		var navListItems = $(l + ' li');
		navItems.on("click", function(e) {
			e.preventDefault();
			navListItems.removeClass('active');
			$(this).closest('li').addClass('active');
			$("#scheduleNumber").val($(this).closest('a').attr("data-target-id").substring(2));
			$("#movieroomNumber").val($(this).closest('a').attr("data-movieroom"));
		});
		
	}
}

var TwoLevelSelectorPrototype =  {
	
	init: function(l1, l2) {
		var navItems = $(l1 + ' li > a');
		var navListItems = $(l1 + ' li');
		var allWells = $(l2);
		var allWellsItems = $(l2 + ' li');
		allWells.hide();
		navItems.on("click", function(e) {
			e.preventDefault();
			navListItems.removeClass('active');
			$(this).closest('li').addClass('active');
			allWells.hide();
			var target = $(this).attr('data-target-id');
			$('#' + target).show();
			if (l1 == ".cinema-location") {
				// do nothing
				console.log("지역 선택!");
			} else if (l1 == ".movie-title") {
				$("#movieSelectCheck").attr("value","1");
				$("#movieNumber").val(target.substring(2));
				console.log("영화 선택!");
	
			}
		});
		allWells.on("click", "li",function(e) {
			e.preventDefault();
			if (!$(this).closest('li').hasClass('active')) {
				allWellsItems.removeClass('active');
				$(this).closest('li').addClass('active');
				
				if (l1 == ".cinema-location") {
					$("#branchSelectCheck").attr("value", "1");
					$("#branchNumber").val($(this).find("a").attr("data-num"));
					console.log("지점 선택 완료!");
					$("#branchSelectCheck").trigger("change");
				} else if (l1 == ".movie-title") {
					$("#scheduleTypeSelectCheck").attr("value", "1");
					$("#scheduleType").val($(this).text());
					console.log("상영 타입 선택 완료!");
					$("#movieSelectCheck").trigger("change");
				}
				
			} 
		});
	}
}

function OneLevelSelector() {
	  var obj = Object.create(OneLevelSelectorPrototype);
	  return obj;
}

function TwoLevelSelector() {
	  var obj = Object.create(TwoLevelSelectorPrototype);
	  return obj;
}

var Reservation = {
	
	init: function() {
		console.log("예약 모듈을 초기화합니다...");
		
		// 데이트 피커 초기화
		$('#datepicker').datepicker({
            format: "yyyy-mm-dd",
            locale: "ko",
            language: "ko",
            todayHighlight: true
	    }).on('changeDate', function(e) {
	        // Set the value for the date input
	    	$("#hiddenForm").clearForm();
	        $("#selectedDate").val($("#datepicker").datepicker('getFormattedDate'));
	        // 날짜 데이터 전송
	        var reqData = {scheduleDateStr: $("#selectedDate").val()}
	        
	        if ($("#selectedDate").val() != '') {
	        	// 요소 재생성
	        	$('div[data-role="resv-cinema-panel"] .panel-body ul').html("");
	    	    $('div[data-role="resv-movie-panel"] .panel-body ul').html("");
	    	    $('div[data-role="resv-schedule-panel"] .panel-body ul').html("");
	        	console.log("날짜가 선택되었습니다. 영화 정보를 가져옵니다...");
	        	Reservation.afterSelect(reqData);
	        } else {
	        	// 초기화
	        	$('div[data-role="resv-cinema-panel"] .panel-body ul').html("");
	    	    $('div[data-role="resv-movie-panel"] .panel-body ul').html("");
	    	    $('div[data-role="resv-schedule-panel"] .panel-body ul').html("");
	        }
	        
	    });;
	    
	    
	    // 각 패널 초기화
	    console.log("각 패널을 초기화 합니다...");
	    $("#hiddenForm").clearForm();
	    $('div[data-role="resv-cinema-panel"] .panel-body ul').html("");
	    $('div[data-role="resv-movie-panel"] .panel-body ul').html("");
	    $('div[data-role="resv-schedule-panel"] .panel-body ul').html("");
	   
	    
	},
	
	getResData: function(reqData) {
		
		console.log("데이터를 서버로부터 불러옵니다...");
		var resData = {
			branchData: {},
			movieData: {},
			scheduleData: {}
		};
		$.ajax({
			url: '/reservation/branchList',
			type: 'GET',
			data: reqData,
			async: false,
			dataType: 'json'
		}).success(function(data) {
			resData.branchData = data;
		});
		$.ajax({
			url: '/reservation/movieList',
			type: 'GET',
			data: reqData,
			async: false,
			dataType: 'json'
		}).success(function(data) {
			resData.movieData = data;
		});
		$.ajax({
			url: '/reservation/scheduleList',
			type: 'GET',
			data: reqData,
			async: false,
			dataType: 'json'
		}).success(function(data) {
			resData.scheduleData = data;
		});
		return resData;
	},
	
	makeBranchList: function(resData) {
		
		console.log("지점 목록을 생성합니다...");
		$('div[data-role="resv-cinema-panel"] .panel-body ul').html("");
		var branchPanel =  $('div[data-role="resv-cinema-panel"] .panel-body');
		// 지점 
		var cinemaLocationList = $("<ul></ul>").addClass('col-sm-6 nav nav-pills nav-stacked cinema-location');
		branchPanel.html(cinemaLocationList);
		for (var i = 0; i < resData.branchData.length; i++) {
			var eachLi = $("<li></li>").append('<a href="#" data-target-id="'+ resData.branchData[i].location
					+'">'+ resData.branchData[i].location 
					+'<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>');
			cinemaLocationList.append(eachLi);
			var cinemaBranchNameList = $("<ul></ul>").addClass('col-sm-6 nav nav-pills nav-stacked cinema-branchName')
				.prop("id", resData.branchData[i].location);
			for (var j = 0; j < resData.branchData[i].branchList.length; j++) {
				var eachLi2 = $("<li></li>").append('<a href="#" data-num="'+resData.branchData[i].branchList[j].branchNumber
						+'">'+ resData.branchData[i].branchList[j].branchName 
						+ '</a>');
				cinemaBranchNameList.append(eachLi2);
			}
			branchPanel.append(cinemaBranchNameList);
		}
		var branchSelector = new TwoLevelSelector();
	    branchSelector.init(".cinema-location", ".cinema-branchName");
	},
	
	makeMovieList: function(resData) {
		
		console.log("영화 목록을 생성합니다...");
		$('div[data-role="resv-movie-panel"] .panel-body ul').html("");
		var moviePanel =  $('div[data-role="resv-movie-panel"] .panel-body');
		// 영화
		var movieTitleList = $("<ul></ul>").addClass('col-sm-8 nav nav-pills nav-stacked movie-title');
		moviePanel.html(movieTitleList);
		for (var i = 0; i < resData.movieData.length; i++) {
			var eachLi = $("<li></li>").append('<a href="#" data-target-id="mn'+ resData.movieData[i].movieNumber
					+'" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">'
					+ '<strong style="display: inline-block; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width: 250px; float: left;">'
					+makeRatingTag(resData.movieData[i].movieRating)+' '+ resData.movieData[i].movieTitle
					+'</strong><span class="glyphicon glyphicon-chevron-right pull-right" style="display: inline-block;"></span></a>');
			movieTitleList.append(eachLi);
			
			var trim = resData.movieData[i].movieType.replace(" ", "");
			var typeArr = trim.split(",");
			
			var scheduleTypeList = $("<ul></ul>").addClass('col-sm-4 nav nav-pills nav-stacked schedule-type')
				.prop("id", "mn"+resData.movieData[i].movieNumber);
			for (var j = 0; j < typeArr.length; j++) {
				var eachLi2 = $("<li></li>").append('<a href="#"><strong>'+ typeArr[j] 
					+ '</strong></a>');
				scheduleTypeList.append(eachLi2);
			}
			moviePanel.append(scheduleTypeList);
		}
		var movieSelector = new TwoLevelSelector();
		movieSelector.init(".movie-title", ".schedule-type");
	},
	
	makeScheduleList: function(resData) { 
		console.log("상영 일정 목록을 생성합니다...");
		$('div[data-role="resv-schedule-panel"] .panel-body ul').html("");
		var schedulePanel =  $('div[data-role="resv-schedule-panel"] .panel-body');
		// 상영 일정
		var scheduleList = $("<ul></ul>").addClass('col-sm-12 nav nav-pills nav-stacked movie-schedule');
		schedulePanel.html(scheduleList);
		
		for (var i = 0; i < resData.scheduleData.length; i++) {
			
			// 시간
			var startTime = new Date(resData.scheduleData[i].scheduleStart);
			var endTime = new Date(resData.scheduleData[i].scheduleEnd);
			var startStr = startTime.format("HH:mm");
			var endStr = endTime.format("HH:mm");
			
			// 기존 예약 좌석 수 
			var resvSeat = new Array();
			$.ajax({
				url: '/reservation/resvList',
				type: 'GET',
				data: {scheduleNumber: resData.scheduleData[i].scheduleNumber},
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
			var cnt;
			// 총 좌석 수
			$.ajax({
				url: "http://choiys3574.cafe24.com/upload/gigabox/movieroom/" + resData.scheduleData[i].movieroomNumber + "/seatdata",
				type: "GET",
				async: false,
				error: function() {
					console.log("좌석 정보 로딩 실패");
				},
				success: function(data) {
					var map = data.map;
					cnt = 0;
					for (var r = 0; r < map.length; r++) {
						for (var c = 0; c < map[r].length; c++) {
							if (map[r].charAt(c) != 'w') {
								cnt = cnt + 1;
							}
						}
					}
				}
			});
			
			var eachLi = $("<li></li>").append('<a href="#" data-target-id="sc'+ resData.scheduleData[i].scheduleNumber
					+'" data-movieroom="'+resData.scheduleData[i].movieroomNumber+'"><strong>'
					+makeRatingTag(resData.scheduleData[i].movieRating)+' '+ resData.scheduleData[i].movieTitle
					+'</strong></a>');
			var eachLi2 = $('<div class="alert alert-info alert-dismissable"></div>');
			eachLi2.append('&nbsp; <span class="glyphicon glyphicon-time "> ' + startStr + ' ~ ' + endStr + '</span> ');
			eachLi2.append('&nbsp; <span class="glyphicon glyphicon-home "> ' + resData.scheduleData[i].branchName + ' ' + resData.scheduleData[i].movieroomName + '</span> ');
			eachLi2.append('&nbsp; <span class="glyphicon glyphicon-user "> ' + resvSeat.length + '/' + cnt + '</span> ');
			eachLi.append(eachLi2);
			scheduleList.append(eachLi);
		}
		var scheduleSelector = new OneLevelSelector();
		scheduleSelector.init(".movie-schedule");
	},
	
	afterSelect: function(reqData) {
		
		console.log("날짜 선택이 끝났습니다. 영화 리스트를 생성합니다...");
		var branchPanel =  $('div[data-role="resv-cinema-panel"] .panel-body');
		var moviePanel =  $('div[data-role="resv-movie-panel"] .panel-body');
		var schedulePanel =  $('div[data-role="resv-schedule-panel"] .panel-body');
		// 요소 재생성
        var resData = Reservation.getResData(reqData);
	    Reservation.makeMovieList(resData);
	    var branchSelector = new TwoLevelSelector();
	    branchSelector.init(".cinema-location", ".cinema-branchName");
		var movieSelector = new TwoLevelSelector();
		movieSelector.init(".movie-title", ".schedule-type");
		var scheduleSelector = new OneLevelSelector();
		scheduleSelector.init(".movie-schedule");
	}

}

function makeRatingTag(value) {
	if (value == "전체관람가" || value == "전체 관람가") {
		return "<span class='label label-success'>전체</span>";
	} else if (value == "12세 관람가") {
		return "<span class='label label-primary' style='background-color: blue;'>12</span>";
	} else if (value == "15세 관람가") {
		return "<span class='label label-warning'>15</span>";
	} else if (value == "청소년 관람불가") {
		return "<span class='label label-danger'>청불</span>";
	} else if (value == "미정") {
		return "<span class='label label-default'>미정</span>";
	}
}

$.fn.clearForm = function() {
    return this.each(function() {
        var type = this.type, tag = this.tagName.toLowerCase();
        if (tag === 'form'){
            return $(':input',this).clearForm();
        }
        if (type === 'text' || type === 'password' || type === 'hidden' || tag === 'textarea'){
            this.value = '';
        }else if (type === 'checkbox' || type === 'radio'){
            this.checked = false;
        }else if (tag === 'select'){
            this.selectedIndex = -1;
        }
    });
};

Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

