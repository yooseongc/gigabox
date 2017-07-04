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
			console.log("clicked!!");
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
				$("#hiddenForm input[type='text']").trigger("change");
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
					$("#hiddenForm input[type='text']").trigger("change");
					console.log("지점 선택 완료!");
				} else if (l1 == ".movie-title") {
					$("#scheduleTypeSelectCheck").attr("value", "1");
					$("#scheduleType").val($(this).text());
					$("#hiddenForm input[type='text']").trigger("change");
					console.log("상영 타입 선택 완료!");
				}
				
			} /*else {
				allWellsItems.removeClass('active');
				if (l1 == ".cinema-location") {
					$("#branchSelectCheck").attr("value", "0");
					console.log("지점 선택 취소!");
				} else if (l1 == ".movie-title") {
					$("#scheduleTypeSelectCheck").attr("value", "0");
					$("#hiddenForm input[type='text']").trigger("change");
					console.log("상영 타입 선택 취소!");
				}
			}*/
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
	        
	        // 요소 재생성
	        Reservation.afterSelect(reqData);
	    });;
	    
	    // 각 패널 초기화
	    $('div[data-role="resv-cinema-panel"] .panel-body ul').html("");
	    $('div[data-role="resv-movie-panel"] .panel-body ul').html("");
	    $('div[data-role="resv-schedule-panel"] .panel-body ul').html("");
	    
	    /*var resData = Reservation.getResData();
	    Reservation.makeList(resData);
	    var branchSelector = new TwoLevelSelector();
		branchSelector.init(".cinema-location", ".cinema-branchName");
		var movieSelector = new TwoLevelSelector();
		movieSelector.init(".movie-title", ".schedule-type");
		var scheduleSelector = new OneLevelSelector();
		scheduleSelector.init(".movie-schedule");*/
	},
	
	getResData: function(reqData) {
		
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
		var moviePanel =  $('div[data-role="resv-movie-panel"] .panel-body');
		// 영화
		var movieTitleList = $("<ul></ul>").addClass('col-sm-8 nav nav-pills nav-stacked movie-title');
		moviePanel.html(movieTitleList);
		for (var i = 0; i < resData.movieData.length; i++) {
			var eachLi = $("<li></li>").append('<a href="#" data-target-id="mn'+ resData.movieData[i].movieNumber
					+'"><strong class="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">'
					+makeRatingTag(resData.movieData[i].movieRating)+' '+ resData.movieData[i].movieTitle
					+'</strong><span class="glyphicon glyphicon-chevron-right pull-right"></span></a>');
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
		var schedulePanel =  $('div[data-role="resv-schedule-panel"] .panel-body');
		// 상영 일정
		var scheduleList = $("<ul></ul>").addClass('col-sm-12 nav nav-pills nav-stacked movie-schedule');
		schedulePanel.html(scheduleList);
		for (var i = 0; i < resData.scheduleData.length; i++) {
			var eachLi = $("<li></li>").append('<a href="#" data-target-id="sc'+ resData.scheduleData[i].scheduleNumber
					+'" data-movieroom="'+resData.scheduleData[i].movieroomNumber+'"><strong>'
					+makeRatingTag(resData.scheduleData[i].movieRating)+' '+ resData.scheduleData[i].movieTitle
					+'</strong></a>');
			scheduleList.append(eachLi);
		}
		var scheduleSelector = new OneLevelSelector();
		scheduleSelector.init(".movie-schedule");
	},
	
	makeList: function(resData) {
		
		var branchPanel =  $('div[data-role="resv-cinema-panel"] .panel-body');
		var moviePanel =  $('div[data-role="resv-movie-panel"] .panel-body');
		var schedulePanel =  $('div[data-role="resv-schedule-panel"] .panel-body');
		
		// 지점 
		/*var cinemaLocationList = $("<ul></ul>").addClass('col-sm-6 nav nav-pills nav-stacked cinema-location');
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
		}*/
		
		// 영화
		var movieTitleList = $("<ul></ul>").addClass('col-sm-8 nav nav-pills nav-stacked movie-title');
		moviePanel.html(movieTitleList);
		for (var i = 0; i < resData.movieData.length; i++) {
			var eachLi = $("<li></li>").append('<a href="#" data-target-id="mn'+ resData.movieData[i].movieNumber
					+'"><strong class="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">'
					+makeRatingTag(resData.movieData[i].movieRating)+' '+ resData.movieData[i].movieTitle
					+'</strong><span class="glyphicon glyphicon-chevron-right pull-right"></span></a>');
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
		
		// 상영 일정
		/*var scheduleList = $("<ul></ul>").addClass('col-sm-12 nav nav-pills nav-stacked movie-schedule');
		schedulePanel.html(scheduleList);
		for (var i = 0; i < resData.scheduleData.length; i++) {
			var eachLi = $("<li></li>").append('<a href="#" data-target-id="sc'+ resData.scheduleData[i].scheduleNumber
					+'"><strong>'+makeRatingTag(resData.scheduleData[i].movieRating)+' '+ resData.scheduleData[i].movieTitle
					+'</strong></a>');
			scheduleList.append(eachLi);
		}*/
	},
	
	afterSelect: function(reqData) {
		// 요소 재생성
        var resData = Reservation.getResData(reqData);
	    Reservation.makeList(resData);
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

