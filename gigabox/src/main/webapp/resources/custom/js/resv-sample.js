var MovieTimeDatas = {
	init : function(){
		$('#slidebarItems').slideIndicator('#time-movie-list', function(result) {});
		MovieTimeDatas.getMovieTimes(true);
		$('#movieTimeList').on('click', 'li:not(.no_movie_list)', MovieTimeDatas.nextStep);
	},

	nextStepInit : function(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode, saleCloseYn, saleCloseNm){

		MovieCinemaDatas.selectedCinemaDatas['cinema_'+cinemaCode] = { 'cinemaCode' : cinemaCode };
		MovieDatas.selectedMovieTypes = {
				'movieTypeYn_all' : 'Y',
				'movieTypeYn_2D' : 'N',
				'movieTypeYn_3D' : 'N',
				'movieTypeYn_dubbing' : 'N',
				'movieTypeYn_caption' : 'N',
				'movieTypeYn_atmos' : 'N',
			};
		MovieDateData.selectedPlayDate = playDate;

		if(showMovieCode){
			$.ajax({
				url: '/DataProvider',
				type: 'POST',
				async: false,
				data: {_command: 'Movie.getDetail', 'code' : showMovieCode},
				dataType: 'json'
			}).success(function( data ) {
				if (data.resultCode === '0000') {
					var config = new Config();
					var poster = config.getImageUrl('poster', data.movie.posterCategory, data.movie.poster, "medium", "jpg");
					MovieDatas.selectedMovieDatas['movie_'+showMovieCode] = { 'movieCode' : showMovieCode, 'koreanTitle' : data.movie.koreanTitle, 'poster' : poster };
					MovieTimeDatas.nextStep3(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode, saleCloseYn, saleCloseNm);
				}
			});
		}else{
			MovieTimeDatas.nextStep3(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode, saleCloseYn, saleCloseNm);
		}
	},

	nextStep3: function(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode, saleCloseYn, saleCloseNm) {
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			data: {
				_command: 'Booking.checkCinemaPopup',
				cinemaCode: cinemaCode,
				korEngGubun: '1',
				siteCode: '36'
			}
		}).success(function( data ) {
			if (data.resultCode === '0000'){
				var result = data.result;
				if(result && result.popupMsg) {
					var popupMsg = result.popupMsg;
					if(result.popupType=='image') popupMsg = '<img src="'+result.popupMsg+'" class="layerPopupImgLoad" />';
					messageBox(popupMsg,function(){
						MovieTimeDatas.nextStep3(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode, saleCloseYn, saleCloseNm);
					});
				}else {
					MovieTimeDatas.nextStep3(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode, saleCloseYn, saleCloseNm);
				}
			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	nextStep3: function(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode, saleCloseYn, saleCloseNm) {
		if (saleCloseYn == 'Y') {
			// �덈ℓ媛� 留덇컧�섏뿀�ㅻ㈃
			if(saleCloseNm.indexOf('援ы솃�섏씠吏�삁留ㅺ���')>-1) $('#September_bk_Popup').show();
			else messageBox(saleCloseNm+'�쇰줈 吏꾪뻾�� 遺덇��� �⑸땲��.');
		} else {
			// 醫뚯꽍�좏깮�붾㈃ �몄텧
			if(BookingSeat.checkSeatRemains(cinemaCode, screenCode, playDate, showSeq, showMovieCode, startTime)) {
				var englishYn = 'N';
				// 鍮꾩��뺤쥖�앹뿬遺� �뺤씤
				BookingNonSeat.getSeatSelectionType(cinemaCode, screenCode, englishYn, function(data) {
					if (data.nonSeatyn === 'Y') {
						BookingNonSeat.showPage(cinemaCode, screenCode, playDate, showSeq, englishYn, data.filePath);
						BookingNonSeat.init(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode, englishYn, data.filePath);
					} else {
						BookingSeat.showPage();
						BookingSeat.init(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode);
					}
				});
			};
		}
	},

	nextStep: function(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode, saleCloseYn, saleCloseNm) {
		var movieData = $(this).data('movieData');
		var cinemaCode = movieData.cinemaCode;
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			data: {
				_command: 'Booking.checkCinemaPopup',
				cinemaCode: cinemaCode,
				korEngGubun: '1',
				siteCode: '36'
			}
		}).success(function( data ) {
			if (data.resultCode === '0000'){
				var result = data.result;
				if(result && result.popupMsg) {
					var popupMsg = result.popupMsg;
					if(result.popupType=='image') popupMsg = '<img src="'+result.popupMsg+'" class="layerPopupImgLoad" />';
					messageBox(popupMsg,function(){
						MovieTimeDatas.nextStep2(movieData);
					});
				}else {
					MovieTimeDatas.nextStep2(movieData);
				}
			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	nextStep2: function(movieData) {
		if (movieData.saleCloseYn == 'Y') {
			// �덈ℓ媛� 留덇컧�섏뿀�ㅻ㈃
			if(movieData.saleCloseNm.indexOf('援ы솃�섏씠吏�삁留ㅺ���')>-1) $('#September_bk_Popup').show();
			else messageBox(movieData.saleCloseNm+'�쇰줈 吏꾪뻾�� 遺덇��� �⑸땲��.');
		} else {
			var code = movieData.movieCode;
			var showMovieCode = movieData.showMovieCode;
			var cinemaCode = movieData.cinemaCode;
			var screenCode = movieData.screenCode;
			var screenName = movieData.screenName;
			var playDate = movieData.playDate;
			var startTime = movieData.startTime;
			var showSeq = movieData.showSeq;
			var vipGradeCode = movieData.vipGradeCode;

			// 醫뚯꽍�좏깮�붾㈃ �몄텧
			if(BookingSeat.checkSeatRemains(cinemaCode, screenCode, playDate, showSeq, showMovieCode, startTime)) {
				var englishYn = 'N';
				// 鍮꾩��뺤쥖�앹뿬遺� �뺤씤
				BookingNonSeat.getSeatSelectionType(cinemaCode, screenCode, englishYn, function(data) {
					if (data.nonSeatyn === 'Y') {
						BookingNonSeat.showPage(cinemaCode, screenCode, playDate, showSeq, englishYn, data.filePath);
						BookingNonSeat.init(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode, englishYn, data.filePath);
					} else {
						BookingSeat.showPage();
						BookingSeat.init(code, showMovieCode, cinemaCode, screenCode, screenName, playDate, startTime, showSeq, vipGradeCode);
					}
				});
			};
		}
	},

	checkShowingDates : function(initFlag){
		var ajaxData = MovieTimeDatas.getMovieTimesParam();
		ajaxData._command='Booking.getShowingDates2';
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			data: ajaxData,
			dataType: 'json'
		}).success(function(data) {
			if (data.resultCode === '0000') {
				var playDates=[];
				for (var i=0; i < data.list.length; i++) {
					playDates.push(data.list[i].playDate);
				}
				MovieDateData.playDates = playDates;
				var $selItems = $('.slidebar_item > ol', '#sel_date').find('li > a').addClass('no_click').end();
				$('#reservation .cal').datepicker('updateMarking', playDates);
				var view = false;
				var viewDate = '';
				if(data.list.length > 0){
					$.each(data.list, function(i, item){
						var $item = $selItems.find('li[data-item="'+item.playDate+'"]');
						if($item.length > 0) $item.find('a').removeClass('no_click');
						if(item.showSeqCnt > 0){
							if(!view && !viewDate) viewDate = item.playDate;
							if(item.playDate==ajaxData['playDate']) view = true;
						}
					});

					if(view){
						MovieTimeDatas.getMovieTimes(initFlag); // �곸쁺�ㅼ�伊� 遺덈윭�ㅺ린
					}else if(viewDate && MovieCinemaDatas.selectedCinemaDatas && Object.keys(MovieCinemaDatas.selectedCinemaDatas).length > 0){
						MovieTimeDatas.emptyMovieTimeList();
						$('#reservation .cal').trigger('click');
					}else{
						if(MovieDatas.selectedMovieDatas && Object.keys(MovieDatas.selectedMovieDatas).length > 0) {
							MovieTimeDatas.checkShowingCinema(initFlag);
						} else {
							MovieCinemaDatas.areaInit();
							$('#reservation .cal').trigger('click');
						}
						MovieTimeDatas.emptyMovieTimeList();
					}
				}else{
					if(!initFlag){
						confirmBox('�뚮┝', '�ㅻⅨ �곸쁺愿�뿉 �곸쁺以묒씤 �곹솕�낅땲��. �곸쁺以묒씤 �곹솕愿� 紐⑸줉�� �좏깮�섏떆寃좎뒿�덇퉴?', function(){
							MovieCinemaDatas.showTheaterModal();
						});
					}
					MovieTimeDatas.emptyMovieTimeList();
				}
			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	unCheckDates :function(){
		MovieDateData.playDates = [];
		var $selItems = $('.slidebar_item > ol', '#sel_date').find('li > a').addClass('no_click').end();
		$('#reservation .cal').datepicker('updateMarking', MovieDateData.playDates);
	},

	checkShowingCinema : function(initFlag){
		if(MovieCinemaDatas.selectedCinemaDatas && Object.keys(MovieCinemaDatas.selectedCinemaDatas).length == 0){
			if(!initFlag){
				confirmBox('�뚮┝', '�ㅻⅨ �곸쁺愿�뿉 �곸쁺以묒씤 �곹솕�낅땲��. �곸쁺以묒씤 �곹솕愿� 紐⑸줉�� �좏깮�섏떆寃좎뒿�덇퉴?', function(){
					MovieCinemaDatas.showTheaterModal();
				});
			}
			return;
		}
		var ajaxData = MovieTimeDatas.getMovieTimesParam();
		ajaxData._command='Booking.checkShowingCinemas';
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			data: ajaxData,
			dataType: 'json'
		}).success(function(data) {
			if (data.resultCode === '0000') {
				if(data.cnt > 0){
					if(!initFlag){
						confirmBox('�뚮┝', '�ㅻⅨ �곸쁺愿�뿉 �곸쁺以묒씤 �곹솕�낅땲��. �곸쁺以묒씤 �곹솕愿� 紐⑸줉�� �좏깮�섏떆寃좎뒿�덇퉴?', function(){
							MovieCinemaDatas.showTheaterModal();
						});
					}
				}
			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	getMovieTimes : function(initFlag){
		var ajaxData = MovieTimeDatas.getMovieTimesParam();
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			data: ajaxData,
			dataType: 'json'
		}).success(function(data) {
			if (data.resultCode === '0000') {
				if(data.screenList.length > 0){
					var $movieTimeList = $('#movieTimeList').empty();
					var sTime = '00';
					$.each(data.screenList, function(i, item){
						var startTime = item.startTime? item.startTime : '';
						if(i==0) sTime = startTime.split(':')[0];
						var $li = $('<li/>').attr('data-slide-indicator', startTime.split(':')[0]);
						// �곹솕 �쒓컙 �뺣낫
						var $viewingTime = $('<div class="viewing_time"/>');
						// �ъ빞, 議곗“, �쇰컲 �щ�
						var playTimeTypeTxt = MovieTimeDatas.getPlayTimeTypeTxt(item.playTimeType);
						if(playTimeTypeTxt) $viewingTime.append($('<p class="morning">').text(playTimeTypeTxt));
						$viewingTime.append($('<p class="time_table">').append($('<strong/>').text(startTime)).append($('<span/>').text('~ '+item.endTime)))
						$li.append($viewingTime);
						// �곹솕 �뺣낫
						var $movie = $('<div class="movie">');
						$movie.append($('<p class="title"/>').attr('title', item.koreanTitle)
								.append($('<span class="age '+megaMovie.getFilmRatingCss(item.filmRating)+'">').text(megaMovie.getFilmRatingText(item.filmRating)))
								.append($('<a href="javascript:void(0);">').attr("title", item.playDate + ' '+ item.startTime + ' ' + item.koreanTitle+' �좏깮').text(item.koreanTitle)));
						$movie.append($('<p class="subtitle"/>').text(item.movieTypeName));
						var $event = $('<p class="event"/>');
						for(var j = 1; j <= 4; j++){
							if(item['event'+j] && item['eventName'+j]) $event.append($('<span class="greeting'+j+'">').text(item['eventName'+j]));
						}
						if($event.find('span').length > 0) $movie.append($event);
						$li.append($movie);
						// �덈ℓ�곹깭 諛� 醫뚯꽍 �뺣낫
						var $theater = $('<div class="theater_wrap">');
						$theater.append($('<p class="theater"/>').html(item.cinemaName+'<br/>'+item.screenName));
						var saleCloseArr = item.sale_close_yn?item.sale_close_yn.split(','):['N'];
						item.saleCloseYn = saleCloseArr[0];
						item.saleCloseNm = saleCloseArr.length > 1?saleCloseArr[1]:'';
						if(item.saleCloseYn=='Y') $theater.append($('<p class="seat"/>').text(item.saleCloseNm));
						else $theater.append($('<p class="seat"/>').text(item.remainSeatCnt + ' / ' + item.totalSeatCnt));
						$li.append($theater);
						// 異붽�!
						$movieTimeList.append($li.data('movieData', item));
					});
					$('#slidebarItems').slideUpdateData('#movieTimeList');
					$('#slidebarItems').find('li > a.active').removeClass('active').end().find('li[data-select="'+sTime+'"]').find('a').addClass('active');
					$('#slidebarItems').moveSlideChange(sTime);
					$('#time-movie-list').scrollTop(0);
				}else{
					MovieTimeDatas.emptyMovieTimeList();
				}

				if(data.screenList.length == 0 && MovieDatas.selectedMovieDatas && Object.keys(MovieDatas.selectedMovieDatas).length > 0) {
					MovieTimeDatas.checkShowingCinema(initFlag);
				} else MovieCinemaDatas.areaInit();

			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	emptyMovieTimeList : function(){
		$('#movieTimeList').empty().append($('<li class="no_movie_list"/>').append($('<span class="blind"/>').text('議고쉶�� �곸쁺紐⑸줉�� �놁뒿�덈떎')));
	},

	getPlayTimeTypeTxt : function(playTimeType){
		if(playTimeType == '1') return '議곗“';
		else if(playTimeType == '2') return '�ъ빞';
		else return '';
	},

	getMovieTimesParam : function(){
		var ajaxData = { '_command': 'Booking.getFilteredBookingMovieList','siteCode': '36', 'startNo': '0', 'count': '999' };
		ajaxData.playDate = MovieDateData.selectedPlayDate ? MovieDateData.selectedPlayDate : MovieDateData.getToday();

		// �곹솕愿�젙蹂�
		var idx = 1;
		var sIdx = 1;
		$.each(MovieCinemaDatas.selectedCinemaDatas, function(i, item){
			ajaxData['cinemaCode'+(idx++)] = item.cinemaCode;
			if(item.screenCode){
				ajaxData['screenSpecialType'+(sIdx++)] = item.screenCode;
			}
		});

		// �곹솕�뺣낫
		idx = 1;
		$.each(MovieDatas.selectedMovieDatas, function(i, item){
			ajaxData['movieCode'+(idx++)] = item.movieCode;
		});

		// �곹솕�뺣낫
		$.each(MovieDatas.selectedMovieTypes, function(key, value){
			ajaxData[key] = value;
		});

		return ajaxData;
	}
}

// �곹솕 �뺣낫
var MovieDatas = {
	selectedDepth : '',
	selectedSort : 'rank',
	tempSelectedMovieDatas : {},
	selectedMovieDatas : {},
	selectedMovieTypes : {
		'movieTypeYn_all' : 'Y',
		'movieTypeYn_2D' : 'N',
		'movieTypeYn_3D' : 'N',
		'movieTypeYn_dubbing' : 'N',
		'movieTypeYn_caption' : 'N',
		'movieTypeYn_atmos' : 'N',
	},
	clear: function(){
		this.selectedDepth='';
		this.selectedSort='rank';
		this.tempSelectedMovieDatas={};
		this.selectedMovieDatas={};
		this.selectedMovieTypes={
				'movieTypeYn_all' : 'Y',
				'movieTypeYn_2D' : 'N',
				'movieTypeYn_3D' : 'N',
				'movieTypeYn_dubbing' : 'N',
				'movieTypeYn_caption' : 'N',
				'movieTypeYn_atmos' : 'N',
			};
	},

	init : function(){
		// �곹솕 �앹뾽 > �곹솕 �좏깮 �댁젣
		$('#movieSelected').on('click', 'a.a_in_block', function(){
			var movieCode = $(this).closest('p').attr('data-movieCode');
			MovieDatas.unSelectedMovie(movieCode, true);
		});

		// �곹솕 �앹뾽 > �곹솕 �좏깮 �꾨즺
		$('#btnMovieConfirm').click(MovieDatas.movieConfirm);

		// �곹솕 �앹뾽 > �곹솕 �좏깮
		$('#selectMovieList').on('click', 'li', MovieDatas.choiceMovie);

		// �곹솕 �좏깮 �앹뾽 �몄텧
		$('#showMovieListBtn').click(MovieDatas.showMovieListModal);
		$('#selectedMovieList').on('click', '.btn_add', MovieDatas.showMovieListModal);

		// �곹솕 �꾩껜 ��젣
		$('#refreshMovieBtn').click(MovieDatas.refreshMovie);

		// �곹솕 ��젣
		$('#selectedMovieList').on('click', '.close_small', MovieDatas.deleteMovie);

		// 紐⑤뱺�곹솕 �꾪솚
		$('#getAllMovieBtn').click(MovieDatas.getAllMovie);
		$('#selectAllMoovieBtn').click(MovieDatas.selectAllMoovie);

		// �곹솕愿� �앹뾽 > �� �뗮똿
		$('.sortBtn', '#select_movie').click(function(){
			var sortType = $(this).attr('data-sortType');
			if(sortType) {
				$('.sortBtn', '#select_movie').removeClass('active');
				$(this).addClass('active');
				MovieDatas.selectedSort = sortType;
				MovieDatas.drowMovieList();
			}
		});

		// �곹솕愿� �앹뾽 > �� �뗮똿
		$('.movieListTabBtn', '#select_movie').click(function(){
			var tabType = $(this).attr('data-tabType');
			if(tabType) {
				$('h3', '#select_movie .movie_header').removeClass('active');
				$(this).closest('h3').addClass('active');
				MovieDatas.selectedSort = 'rank';
				$('#select_movie').find('.sortBtn').removeClass('active').end().find('.sortBtn[data-sortType="rank"]').addClass('active');
				MovieDatas.selectedDepth = tabType;
				MovieDatas.drowMovieList();
			}
		});

		$('[for=movieTypeYnAtmos] i', '#selectedMovieList').on('mouseover focus',function(){
			$('#popAtmos').show();
		}).on('mouseout blur',function(){
			$('#popAtmos').hide();
		});

		$('.movieType', '#selectedMovieList').on('ifChecked', function(){
			var movieType = $(this).val();
			if(movieType=='all'){
				MovieDatas.selectedMovieTypes = {
						'movieTypeYn_all' : 'Y',
						'movieTypeYn_2D' : 'N',
						'movieTypeYn_3D' : 'N',
						'movieTypeYn_dubbing' : 'N',
						'movieTypeYn_caption' : 'N',
						'movieTypeYn_atmos' : 'N',
					};
				$(this).iCheck('disable');
				$(':checkbox:not([value="all"])', '#selectedMovieList').iCheck('uncheck');
			}else{
				MovieDatas.selectedMovieTypes['movieTypeYn_all'] = 'N';
				MovieDatas.selectedMovieTypes['movieTypeYn_'+movieType] = 'Y';
				$(':checkbox[value="all"]', '#selectedMovieList').iCheck('uncheck').iCheck('enable');
			}
			MovieTimeDatas.getMovieTimes();
		});

		$('.movieType', '#selectedMovieList').on('ifUnchecked', function(){
			var movieType = $(this).val();
			if(movieType=='all'){
				return false;
			}

			MovieDatas.selectedMovieTypes['movieTypeYn_'+movieType] = 'N';

			var flag = false;
			$.each(MovieDatas.selectedMovieTypes, function(key, value){
				if(value == 'Y') flag = true;
			});
			if(!flag){
				$(':checkbox[value="all"]', '#selectedMovieList').iCheck('check');
			}
			MovieTimeDatas.getMovieTimes();
		});
	},

	settingMovie : function(movieCode){
		if(!movieCode) return;
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			async: false,
			data: {_command: 'Movie.getDetail', 'code' : movieCode},
			dataType: 'json'
		}).success(function( data ) {
			if (data.resultCode === '0000') {
				var config = new Config();
				var poster = config.getImageUrl('poster', data.movie.posterCategory, data.movie.poster, "medium", "jpg");
				MovieDatas.selectedMovieDatas['movie_'+movieCode] = { 'movieCode' : movieCode, 'koreanTitle' : data.movie.koreanTitle, 'poster' : poster };
				MovieDatas.drawChoiceMovieList();
			}
		});
	},

	// �곹솕 �좏깮 �뺤씤
	movieConfirm : function(){
		MovieDatas.selectedMovieDatas = MovieDatas.tempSelectedMovieDatas;
		MovieDatas.drawChoiceMovieList();
		$('#select_movie').modal('hide');
		MovieTimeDatas.checkShowingDates();
	},

	// �곹솕愿� �앹뾽 > �곹솕愿� �좏깮
	choiceMovie: function(){
		var movieCode = $(this).attr('data-movieCode');
		var screenName = $(this).attr('data-screenName');
		// �대� �좏깮�� �곹솕愿�씤 寃쎌슦 ��젣
		if($(this).hasClass('selected')){
			MovieDatas.unSelectedMovie(movieCode, true);
			return;
		}

		if(MovieDatas.tempSelectedMovieDatas && Object.keys(MovieDatas.tempSelectedMovieDatas).length >= 4){
			messageBox('4媛쒓퉴吏�쭔 �좏깮�  �� �덉뒿�덈떎.');
			return;
		}

		var $movie = $(this).addClass('selected').find('a');
		$movie.attr('title', $movie.text()+' �좏깮��');
		var movieName = $movie.text();
		$('#movieSelected').append(
				$('<p class="selected_movie"/>').attr('data-movieCode', movieCode)
					.append($('<span/>').text(movieName+' '))
					.append($('<a href="javascript:void(0);" class="fa fa-times a_in_block"/>').append($('<span class="blind"/>').text(movieName+' �좏깮�댁젣'))));
		MovieDatas.tempSelectedMovieDatas['movie_'+movieCode] = { 'movieCode' : movieCode, 'koreanTitle' : movieName, 'poster' : $(this).find('img').attr('src') };
	},

	unSelectedMovie : function(movieCode, temp){
		$('p[data-movieCode="'+movieCode+'"]', '#movieSelected').remove();
		var $movie = $('li[data-movieCode="'+movieCode+'"]', '#selectMovieList').removeClass('selected').find('a');
		$movie.attr('title', $movie.text()+' �좏깮');
		if(temp) delete MovieDatas.tempSelectedMovieDatas['movie_'+movieCode]
		else delete MovieDatas.selectedMovieDatas['movie_'+movieCode]
	},

	// �곹솕愿� ��젣
	deleteMovie: function(){
		var movieCode = $(this).closest("li").attr('data-movieCode');
		MovieDatas.unSelectedMovie(movieCode, false);
		MovieDatas.drawChoiceMovieList();
		MovieTimeDatas.checkShowingDates();
	},

	showMovieListModal : function(){
		MovieDatas.tempSelectedMovieDatas = {};
		MovieDatas.drawTempMovieList();
		$('.movieListTabBtn:eq(0)', '#select_movie').trigger('click');
		$('#select_movie').modal('show');
	},

	drawTempMovieList : function(){
		var cinemaDatas = MovieDatas.selectedMovieDatas;
		var $movieSelected = $('#movieSelected').find(".selected_movie").remove().end();
		$.each(cinemaDatas, function(i, item){
			$movieSelected.append(
					$('<p class="selected_movie"/>').attr('data-movieCode', item.movieCode)
						.append($('<span/>').text(item.koreanTitle+' '))
						.append($('<a href="javascript:void(0);" class="fa fa-times a_in_block"/>').append($('<span class="blind"/>').text(item.koreanTitle+' �좏깮�댁젣'))));
			MovieDatas.tempSelectedMovieDatas['movie_'+item.movieCode] = { 'movieCode' : item.movieCode, 'koreanTitle' : item.koreanTitle, 'poster' : item.poster };
		});
	},

	drowMovieList : function(){
		var ajaxData = { 'siteCode': '36', 'startNo': '0', 'count': '100' };
		ajaxData.playDate = MovieDateData.getToday();
		ajaxData.sortBy = MovieDatas.selectedSort ? MovieDatas.selectedSort : 'rank';
		if(MovieDatas.selectedDepth=='special') ajaxData._command = 'Booking.getBookingSpecialMovieListByDate';
		else ajaxData._command = 'Booking.getBookingMovieListByDate';

		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			data: ajaxData,
			dataType: 'json'
		}).success(function(data) {
			if (data.resultCode === '0000') {
				var $movieList = $('#selectMovieList').empty();
				var config 	   = new Config();
				$.each(data.movieList, function(i, item){
					var poster = config.getImageUrl('poster', item.posterCategory, item.poster, "medium", "jpg");
					var $li = $("<li/>").attr('data-movieCode', item.movieCode)
									.append($('<a href="javascript:void(0);" title="'+item.koreanTitle+' �좏깮" />').append($('<span class="blind"/>').text(item.koreanTitle)))
									.append($('<div class="poster"/>').append($('<img/>').attr('alt', item.koreanTitle).attr('src', poster)))
									.append($('<p class="title"/>').attr('title', item.koreanTitle).append($('<span class="age '+megaMovie.getFilmRatingCss(item.filmRating)+'">').text(megaMovie.getFilmRatingText(item.filmRating))).append($('<span>').text(item.koreanTitle)));
					$movieList.append($li);
				});

				$.each(MovieDatas.tempSelectedMovieDatas, function(i, item){
					var $movie = $movieList.find('li[data-movieCode="'+item.movieCode+'"]');
					if($movie.length>0){
						$movie.addClass('selected').find('a').attr('title', item.koreanTitle+' �좏깮��');
					}
				});
			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	refreshMovie: function(){
		if(MovieDatas.selectedMovieDatas && Object.keys(MovieDatas.selectedMovieDatas).length > 0){
			MovieDatas.selectedMovieDatas = {};
			MovieDatas.drawChoiceMovieList();
		}else{
			MovieDatas.getAllMovie();
		}
		MovieTimeDatas.checkShowingDates();

	},

	getAllMovie: function(){
		MovieDatas.selectedMovieDatas = {};
		MovieDatas.drawChoiceMovieList();
		MovieTimeDatas.checkShowingDates();
	},

	selectAllMoovie : function(){
		$('#select_movie').modal('hide');
		MovieDatas.selectedMovieDatas = {};
		MovieDatas.drawChoiceMovieList();
		MovieTimeDatas.checkShowingDates();
	},

	/*
	 * �좏깮�� �곹솕愿� �곗씠�� 洹몃━湲�
	 * */
	drawChoiceMovieList: function() {
		var movieDatas = MovieDatas.selectedMovieDatas;
		if(movieDatas && Object.keys(movieDatas).length == 0){
			$('#getAllMovieBtn').addClass('active');
			$('#selectedAllMovie').show();
			$('#selectedMovieList').hide();
		}else{
			var $ul = $('ul','#selectedMovieList').empty();
			var index = 0;
			$.each(movieDatas, function(i, item){
				var $li = $('<li class="poster"/>').attr('data-movieCode', item.movieCode)
							.append($('<div class="poster">')
								.append($('<button type="button" class="close_small" title="' + item.koreanTitle + ' �좏깮�댁젣"/>'))
								.append($("<img/>").attr('alt', item.koreanTitle).attr('src', item.poster)));
				$ul.append($li);
				index++;
			});
			for (; index < 4; index++) {
				var $li = $('<li/>').append($('<div class="poster">').append($('<button type="button" class="btn_add" title="洹뱀옣�좏깮 鍮덊봽�덉엫"/>')));
				$ul.append($li);
			}
			$('#getAllMovieBtn').removeClass('active');
			$('#selectedAllMovie').hide();
			$('#selectedMovieList').show();
		}
		MovieDatas.selectedMovieTypes = {
				'movieTypeYn_all' : 'Y',
				'movieTypeYn_2D' : 'N',
				'movieTypeYn_3D' : 'N',
				'movieTypeYn_dubbing' : 'N',
				'movieTypeYn_caption' : 'N',
				'movieTypeYn_atmos' : 'N',
			};
		$(':checkbox[value="all"]', '#selectedMovieList').iCheck('check');
	}
}

// �곹솕愿� �뺣낫
var MovieCinemaDatas = {
	initData : [],
	myCinemaDatas: [],
	areaDatas : {},
	cinemaDatas : [],
	screenDatas : [],
	selectedDepth : '',
	tempSelectedCinemaDatas : {},
	selectedCinemaDatas : {},
	clear : function(){
		this.myCinemaDatas=[];
		this.areaDatas={};
		this.cinemaDatas=[];
		this.screenDatas=[];
		this.selectedDepth='';
		this.tempSelectedCinemaDatas={};
		this.selectedCinemaDatas={};
	},

	init : function(){
		// �곹솕愿� �앹뾽 > 吏�뿭 �뗮똿
		MovieCinemaDatas.cinemaSetting();
		// �곹솕愿� �앹뾽 > �밸퀎愿� �뗮똿
		MovieCinemaDatas.screenSetting();
		// �곹솕愿� �앹뾽 > �먯＜媛�뒗�곹솕愿� �뗮똿
		MovieCinemaDatas.myCinemaSetting();

		// �곹솕愿� �앹뾽 > �곹솕愿� �좏깮 �댁젣
		$('#cinemaSelected').on('click', 'a.a_in_block', function(){
			var cinemaCode = $(this).closest('p').attr('data-cinemaCode');
			MovieCinemaDatas.unSelectedCinema(cinemaCode, true);
		});

		// �곹솕愿� �앹뾽 �몄텧
		$('#cinemaList').on('click', '.btn_add', MovieCinemaDatas.showTheaterModal);

		// 吏�뿭 ��젣
		$('#cinemaList').on('click', '.close_small', MovieCinemaDatas.deleteTheater);

		// 吏�뿭 �꾩껜 ��젣
		$('#refreshCinemaBtn').click(MovieCinemaDatas.refreshCinema);

		// �좏샇�곹솕愿� 媛�졇�ㅺ린
		$("#getMyCinemaBtn").click(MovieCinemaDatas.getMyCinema);

		// �곹솕愿� �좏깮 �꾨즺
		$('#btnCinemaConfirm').click(MovieCinemaDatas.cinemaConfirm);

		// �곹솕愿� �앹뾽 > 吏�뿭蹂� > 洹뱀옣 �좏깮
		$('#body_theater1 .theater_list .depth2')
			.on('mouseover', 'li', function(){
				if($(this).hasClass('no_click') == false){
					var cinemaCode = $(this).attr('data-cinemaCode');
					var $map = $('li[data-cinemaCode="'+cinemaCode+'"]', '#body_theater1 .map > ul');
					if($map.length > 0){
						$map.find("a").addClass("active");
					}
				}
			}).on('mouseout', 'li', function(){
				$('li .active', '#body_theater1 .map > ul').removeClass('active');
			});

		// �곹솕愿� �앹뾽 > 洹뱀옣 �좏깮
		$('#select_theater .theater_list .depth2').on('click', 'li', MovieCinemaDatas.choiceCinema);

		// �곹솕愿� �앹뾽 > �밸퀎愿� �좏깮
		$('#body_theater2 .depth1').on('click', 'li', MovieCinemaDatas.choiceScreen);

		// �곹솕愿� �앹뾽 > 吏�뿭 �좏깮
		$('#body_theater1 .depth1').on('click', 'li:not(.blind)', MovieCinemaDatas.choiceArea);

		// �곹솕愿� �앹뾽 > �� �뗮똿
		$('.theaterTabBtn', '#select_theater').click(function(){
			var tabType = $(this).attr('href');
			if(tabType) {
				MovieCinemaDatas.selectedDepth = '';
				$(tabType).find('.depth1 li:not(.blind):eq(0)').trigger('click');
			}
		});
	},

	refreshCinema : function(){
		if(MovieCinemaDatas.selectedCinemaDatas && Object.keys(MovieCinemaDatas.selectedCinemaDatas).length > 0){
			MovieCinemaDatas.selectedCinemaDatas = {};
			MovieCinemaDatas.drawChoiceCinemaList();
			MovieTimeDatas.checkShowingDates();
		}
	},

	getMyCinema : function(){
		MovieCinemaDatas.selectedCinemaDatas = {};
		for(var i = 1; i <= 3; i++){
			var cinemaCode = MovieCinemaDatas.myCinemaDatas['cinemaCode'+i];
			var cinemaName = MovieCinemaDatas.myCinemaDatas['cinemaName'+i];
			if(cinemaCode && cinemaName){
				MovieCinemaDatas.selectedCinemaDatas['cinema_'+cinemaCode] = { 'cinemaCode' : cinemaCode, 'cinemaName' : cinemaName, 'screenCode' : '', 'screenName' : '' };
			}
		}
		MovieCinemaDatas.drawChoiceCinemaList();
	},

	myCinemaSetting : function(){
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			async: false,
			data: {_command: 'User.getFavoriteCinema'},
			dataType: 'json'
		}).success(function( data ) {
			if (data.resultCode === '0000') {
				MovieCinemaDatas.myCinemaDatas = data.cinemas;
				if((!MovieDatas.selectedMovieDatas || Object.keys(MovieDatas.selectedMovieDatas).length == 0)
						&& (!MovieCinemaDatas.selectedCinemaDatas || Object.keys(MovieCinemaDatas.selectedCinemaDatas).length == 0)){
					MovieCinemaDatas.getMyCinema();
				}
			}else{
				$("#getMyCinemaBtn").hide();
				$('.depth1, .map', '#body_theater1').find('li:eq(0)').addClass('blind');
			}
		});
	},

	drawMyCinema : function(){
		var $cinemaUl = $('.depth2', '#body_theater1 .theater_list').empty();
		for(var i = 1; i <= 3; i++){
			var cinemaCode = MovieCinemaDatas.myCinemaDatas['cinemaCode'+i];
			var cinemaName = MovieCinemaDatas.myCinemaDatas['cinemaName'+i];
			if(cinemaCode && cinemaName){
				$cinemaUl
				.append($('<li/>').attr('data-cinemaCode', cinemaCode).attr('data-screenCode', '').attr('data-screenName', '')
						.append($('<a href="javascript:void(0);" title="'+cinemaName+' �좏깮"/>').text(cinemaName)));
			}
		}

		$.each(MovieCinemaDatas.tempSelectedCinemaDatas, function(i, item){
			var $cinema = $cinemaUl.find('li[data-cinemaCode="'+item.cinemaCode+'"][data-screenCode="'+item.screenCode+'"]');
			if($cinema.length>0){
				$cinema.addClass('active').find('a').attr('title', item.cinemaName+' �좏깮��');
			}
		});

		var $depth1 = $('li.active', '#body_theater1 .depth1').removeClass('active').find('a');
		$depth1.attr('title', $depth1.text()+' �좏깮');
		$depth1 = $('li[data-depthType="myCinema"]', '#body_theater1 .depth1').addClass('active').find('a');
		$depth1.attr('title', $depth1.text()+' �좏깮��');
		MovieCinemaDatas.selectedDepth = 'myCinema';
	},

	// �곹솕愿� �앹뾽 > 吏�뿭 �좏깮
	choiceArea: function(){
		var areaCode = $(this).attr('data-areaCode');
		if(!areaCode){
			if($(this).attr('data-depthType')=='myCinema') MovieCinemaDatas.drawMyCinema();
			return;
		}
		if(MovieCinemaDatas.selectedDepth == areaCode) return;

		if(MovieDatas.selectedMovieDatas && Object.keys(MovieDatas.selectedMovieDatas).length > 0) MovieCinemaDatas.showingCinemas(areaCode);
		else{
			var $area = $('li.active', '#body_theater1 .depth1').removeClass('active').find('a');
			$area.attr('title', $area.text()+' �좏깮');
			$area = $(this).addClass('active').find('a');
			$area.attr('title', $area.text()+' �좏깮��');
			var $map = $('.map > ul', '#body_theater1').find('li.mapArea').hide().end().find('li[data-areaCode="'+areaCode+'"]');
			var $cloneCinema = $map.find('ul').clone();
			$.each(MovieCinemaDatas.tempSelectedCinemaDatas, function(i, item){
				var $cinema = $cloneCinema.find('li[data-cinemaCode="'+item.cinemaCode+'"][data-screenCode="'+item.screenCode+'"]');
				if($cinema.length>0){
					$cinema.addClass('active').find('a').attr('title', item.cinemaName+' �좏깮��');
				}
			});
			$map.show();
			$('.depth2', '#body_theater1 .theater_list').empty().append($cloneCinema.find('li').attr('style', ''));
			MovieCinemaDatas.selectedDepth = areaCode;
		}
	},

	showingCinemas : function(areaCode){
		var ajaxData = MovieTimeDatas.getMovieTimesParam();
		ajaxData._command='Booking.getShowingCinemas2';
		ajaxData.areaGroupCode = areaCode;
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			data: ajaxData,
			dataType: 'json'
		}).success(function(data) {
			if (data.resultCode === '0000') {
				var $cinemaUl = $('.depth2', '#body_theater1 .theater_list').empty();
				$.each(data.list, function(i, cinema){
					var style = "no_click";
					if(cinema.showSeqCnt > 0) style = "";
					$cinemaUl
						.addClass('area_'+areaCode)
						.append($('<li/>').attr('data-cinemaCode', cinema.cinemaCode).attr('data-screenCode', '').addClass(style)
							.append($('<a href="javascript:void(0);" title="'+cinema.cinemaName+' �좏깮" />').text(cinema.cinemaName)));
				});

				$('.map > ul', '#body_theater1').find('li.mapArea').hide().end().find('li[data-areaCode="'+areaCode+'"]').show();
				MovieCinemaDatas.selectedDepth = areaCode;

			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	// �곹솕愿� �앹뾽 > �밸퀎愿� �뗮똿
	choiceScreen : function(){
		var $this = $(this);
		var screenCode = $this.attr('data-screenCode');
		if(MovieCinemaDatas.selectedDepth == screenCode) return;

		var screenImg = MovieCinemaDatas.screenDatas[screenCode];
		if(!screenImg) screenImg = MovieCinemaDatas.screenDatas['etc'];
		$('.detail_wrap', '#body_theater2').empty()
			.append($('<img/>').attr('src', screenImg.imageSrc).attr('alt', screenImg.textAlt))
			.append($('<div class="skip_box '+screenImg.ck_class+'"/>')
						.append($('<h4 class="blind"/>').text(screenImg.tx_title))
						.append($('<p class="blind"/>').text(screenImg.desc))
						.append($('<a class="icon detail" target="_blank"/>').attr('href', '/?menuId=special&screenType=' + screenCode)
								.attr('title', screenImg.tx_title+'諛붾줈媛�린' ).append($('<img/>').attr('src', screenImg.BtnimageSrc).attr('alt', screenImg.tx_title))));

		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			data: {_command: 'Cinema.getSpecialCinemaList', siteCode: '36', specialScreenType: screenCode},
			dataType: 'json'
		}).success(function(data) {
			if (data.resultCode === '0000') {
				var $cinemaUl = $('.depth2', '#body_theater2').empty();
				var screenName = $this.find('a').text();
				$.each(data.list, function(i, cinema){
					$cinemaUl
						.append($('<li/>').attr('data-cinemaCode', cinema.cinemaCode).attr('data-screenCode', screenCode).attr('data-screenName', screenName)
								.append($('<a href="javascript:void(0);" title="'+cinema.cinemaName+' �좏깮"/>').text(cinema.cinemaName)));
				});

				$.each(MovieCinemaDatas.tempSelectedCinemaDatas, function(i, item){
					var $cinema = $cinemaUl.find('li[data-cinemaCode="'+item.cinemaCode+'"][data-screenCode="'+item.screenCode+'"]');
					if($cinema.length>0){
						$cinema.addClass('active').find('a').attr('title', item.cinemaName+' �좏깮��');
					}
				});

				var $screen = $('li.active', '#body_theater2 .depth1').removeClass('active').find('a');
				$screen.attr('title', $screen.text()+' �좏깮');
				$screen = $this.addClass('active').find('a');
				$screen.attr('title', $screen.text()+' �좏깮��');
				MovieCinemaDatas.selectedDepth = screenCode;
			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	// �곹솕愿� �앹뾽 > �곹솕愿� �좏깮
	choiceCinema: function(){
		var cinemaCode = $(this).attr('data-cinemaCode');
		var screenCode = $(this).attr('data-screenCode');
		var screenName = $(this).attr('data-screenName');
		// case1 �좏깮�� �곹솕愿�씠 �덈뒗 寃쎌슦 ��젣
		if($(this).hasClass('active')){
			MovieCinemaDatas.unSelectedCinema(cinemaCode, true);
			return;
		}
		// case2 �ㅻⅨ �밸퀎愿�쓽 �곹솕愿�씠 �좏깮�� �곹깭
		if(MovieCinemaDatas.tempSelectedCinemaDatas['cinema_'+cinemaCode]){
			MovieCinemaDatas.unSelectedCinema(cinemaCode, true);
		}

		if(MovieCinemaDatas.cinemaDatas['cinema_'+cinemaCode] && MovieCinemaDatas.cinemaDatas['cinema_'+cinemaCode].popupYn=='Y'){
			if(MovieCinemaDatas.cinemaDatas['cinema_'+cinemaCode].popupMsg){
				messageBox(MovieCinemaDatas.cinemaDatas['cinema_'+cinemaCode].popupMsg);
				if(MovieCinemaDatas.cinemaDatas['cinema_'+cinemaCode].hasNext != 'Y'){
					return;
				}
			}
		}

		if($(this).hasClass('no_click')){
			messageBox('�좏깮�� �곹솕愿�� �대떦 �곹솕(肄섑뀗��) �쒓컙�쒓� �놁뒿�덈떎.');
			return;
		}

		if(MovieCinemaDatas.tempSelectedCinemaDatas && Object.keys(MovieCinemaDatas.tempSelectedCinemaDatas).length >= 4){
			messageBox('4媛쒓퉴吏�쭔 �좏깮�  �� �덉뒿�덈떎.');
			return;
		}

		var $cinema = $(this).addClass('active').find('a');
		$cinema.attr('title', $cinema.text()+' �좏깮��');
		var cinemaName = $cinema.text();
		if(screenCode) cinemaName += ' '+screenName;
		$('#cinemaSelected').append(
				$('<p class="selected_movie"/>').attr('data-cinemaCode', cinemaCode)
					.append($('<span/>').text(cinemaName+' '))
					.append($('<a href="javascript:void(0);" class="fa fa-times a_in_block"/>').append($('<span class="blind"/>').text(cinemaName+' �좏깮�댁젣'))));
		MovieCinemaDatas.tempSelectedCinemaDatas['cinema_'+cinemaCode] = { 'cinemaCode' : cinemaCode, 'cinemaName' : $cinema.text(), 'screenCode' : screenCode, 'screenName' : screenName };
	},

	// �곹솕愿� ��젣
	deleteTheater: function(){
		var cinemaCode = $(this).closest("li").attr('data-cinemaCode');
		MovieCinemaDatas.unSelectedCinema(cinemaCode, false);
		MovieCinemaDatas.drawChoiceCinemaList();
		MovieTimeDatas.checkShowingDates();
	},

	// �곹솕愿� �앹뾽 �몄텧
	showTheaterModal: function(){
		MovieCinemaDatas.selectedDepth = '';
		MovieCinemaDatas.tempSelectedCinemaDatas = {};
		if(MovieDatas.selectedMovieDatas && Object.keys(MovieDatas.selectedMovieDatas).length > 0) MovieCinemaDatas.showingRegions();
		else MovieCinemaDatas.areaInit();
		MovieCinemaDatas.drawTempCinemaList();
		$('.theaterTabBtn:eq(0)', '#select_theater').trigger('click');
		$('#select_theater').modal('show');
	},

	showingRegions: function(){
		var ajaxData = MovieTimeDatas.getMovieTimesParam();
		ajaxData._command='Booking.getShowingRegions2';
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			data: ajaxData,
			dataType: 'json'
		}).success(function(data) {
			if (data.resultCode === '0000' && data.list.length > 0) {
				$.each(data.list, function(i, area){
					$('.depth1', '#body_theater1').find('li[data-areaCode="'+area.groupCode+'"]').attr('title', area.groupName+' ('+area.playCnt+'/'+area.totalCnt+')').text(area.groupName+' ('+area.playCnt+'/'+area.totalCnt+')');
				});
			}else {
				$.each(MovieCinemaDatas.areaDatas, function(i, area){
					$('.depth1', '#body_theater1').find('li[data-areaCode="'+area.groupCode+'"]').attr('title', area.groupName+' (0/'+area.cnt+')').text(area.groupName+' (0/'+area.cnt+')');
				});
			}
		});
	},

	// �곹솕愿� �좏깮 �뺤씤
	cinemaConfirm : function(){
		MovieCinemaDatas.selectedCinemaDatas = MovieCinemaDatas.tempSelectedCinemaDatas;
		MovieCinemaDatas.drawChoiceCinemaList();
		$('#select_theater').modal('hide');
		MovieTimeDatas.checkShowingDates();
	},

	// �곹솕愿� �앹뾽 > �좏깮�� �곹솕愿� ��젣
	unSelectedCinema :function(cinemaCode, temp){
		$('p[data-cinemaCode="'+cinemaCode+'"]', '#cinemaSelected').remove();
		var $cinema = $('li[data-cinemaCode="'+cinemaCode+'"]', '#select_theater .depth2').removeClass('active').find('a');
		$cinema.attr('title', $cinema.text()+' �좏깮');
		if(temp) delete MovieCinemaDatas.tempSelectedCinemaDatas['cinema_'+cinemaCode]
		else delete MovieCinemaDatas.selectedCinemaDatas['cinema_'+cinemaCode]
	},

	// �곹솕愿� �앹뾽 > 吏�룄 �꾩씠肄� 醫뚰몴媛�
	cinemaSetting : function(){
		var config = new Config();
		$.ajax({
			url: config.IMAGE_URL + 'mop/base/cinemaMapData.html',
			type: 'get',
			async: false,
			dataType: 'json'

		}).success(function( cinemaMapData ) {
			MovieCinemaDatas.drawRegions(cinemaMapData);
		});
	},

	// �곹솕愿� �앹뾽 > 吏�뿭 �뗮똿1
	drawRegions : function(cinemaMapData){
		var ajaxData = { 'siteCode': '36', 'reservationYn': 'Y' };
		ajaxData._command = 'Cinema.getRegions';

		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			async: false,
			data: ajaxData,
			dataType: 'json'

		}).success(function( data ) {
			if (data.resultCode === '0000') {
				MovieCinemaDatas.areaDatas = data.areas;
				$.each(data.areas, function(i, area){
					MovieCinemaDatas.drawCinema(ajaxData, area, cinemaMapData);
				});
			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	// �곹솕愿� �앹뾽 > 吏�뿭 �뗮똿2
	drawCinema: function(ajaxData, area, cinemaMapData){
		ajaxData.areaGroupCode = area.groupCode;
		ajaxData.korEngGubun = '1';
		ajaxData._command = 'Cinema.getCinemasInRegion2';
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			async: false,
			data: ajaxData,
			dataType: 'json'

		}).success(function( data ) {
			if (data.resultCode === '0000') {
				$('.depth1', '#body_theater1')
					.append($('<li/>').attr('data-areaCode', area.groupCode)
							.append($('<a href="javascript:void(0);" title="'+area.groupName+' ('+area.cnt+') �좏깮"/>').text(area.groupName+' ('+area.cnt+')'))
							.append($('<span/>').append($('<i class="fa fa-angle-right"/>'))));
				var $regionLi = $('<li class="mapArea"/>').attr('data-areaCode', area.groupCode);
				$regionLi.append($('<a href="javascript:void(0);" title="'+area.groupName+' �좏깮"/>').text(area.groupName))
				var $cinemaUl = $("<ul class='depth2' style='top: 0; left: 0;'/>");
				$.each(data.cinemaList, function(i, cinema){
					MovieCinemaDatas.cinemaDatas['cinema_'+cinema.cinemaCode] = { 'popupYn' : cinema.popupYn, 'popupMsg' : cinema.popupMsg, 'hasNext' : cinema.hasNext }
					var left = cinemaMapData[cinema.cinemaCode].left ? cinemaMapData[cinema.cinemaCode].left : 0;
					var top = cinemaMapData[cinema.cinemaCode].top ? cinemaMapData[cinema.cinemaCode].top : 0;
					var letterSpacing = cinemaMapData[cinema.cinemaCode].letterSpacing ? cinemaMapData[cinema.cinemaCode].letterSpacing : 'inherit';
					$cinemaUl
						.addClass('area_'+area.groupCode)
						.append($('<li/>').attr('data-cinemaCode', cinema.cinemaCode).attr('data-screenCode', '')
							.append($('<a href="javascript:void(0);" title="'+cinema.cinemaName+' �좏깮" style="left: '+left+'; top: '+top+'; letter-spacing: '+letterSpacing+';"/>').text(cinema.cinemaName)));

					$.each(MovieCinemaDatas.initData, function(i, code){
						if(cinema.cinemaCode == code){
							MovieCinemaDatas.selectedCinemaDatas['cinema_'+cinema.cinemaCode] = { 'cinemaCode' : cinema.cinemaCode, 'cinemaName' : cinema.cinemaName, 'screenCode' : '', 'screenName' : '' };
						}
					});
				});
				$('.map > ul', '#body_theater1').append($regionLi.append($cinemaUl));
				if(MovieCinemaDatas.selectedCinemaDatas && Object.keys(MovieCinemaDatas.selectedCinemaDatas).length > 0) MovieCinemaDatas.drawChoiceCinemaList();
			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	// �곹솕愿� �앹뾽 > �밸퀎愿� �대�吏�
	screenSetting : function(){
		var config = new Config();
		$.ajax({
			url: config.IMAGE_URL + 'mop/base/screenImgData.html',
			type: 'get',
			async: false,
			dataType: 'json'

		}).success(function( screenData ) {
			MovieCinemaDatas.screenDatas = screenData;
			MovieCinemaDatas.specialScreenSetting();
		});
	},

	// �곹솕愿� �앹뾽 > �밸퀎愿� �뗮똿
	specialScreenSetting : function(){
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			async: false,
			data: {_command: 'Cinema.getSpecialScreenTypes', siteCode: '36'},
			dataType: 'json'
		}).success(function( data ) {
			if (data.resultCode === '0000') {
				var $depth1 = $('.depth1', "#body_theater2")
				$.each(data.types, function(i, screen){
					var $li = $("<li/>").attr('data-screenCode', screen.specialScreenType)
									.append($('<a href="javascript:void(0);" title="'+screen.specialScreenTypeName+' �좏깮" />').text(screen.specialScreenTypeName))
									.append($('<span/>').append($('<i class="fa fa-angle-right"/>')));
					$depth1.append($li);
				});
			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	/*
	 * �좏깮�� �곹솕愿� �곗씠�� 洹몃━湲�
	 * */
	drawChoiceCinemaList: function() {
		var cinemaDatas = MovieCinemaDatas.selectedCinemaDatas;
		var $ul = $('<ul/>');
		var index = 0;
		$.each(cinemaDatas, function(i, item){
			var className = '';
			switch (index) {
				case 0:	className = 'mr13 mb10'; break;
				case 1:	className = 'mb10'; break;
				case 2:	className = 'mr13'; break;
			}

			var cinemaName = item.cinemaName;
			if(item.screenCode) cinemaName += ' '+ item.screenName;

			var $li = $('<li class="selected '+className+'"/>').attr('data-cinemaCode', item.cinemaCode)
						.append($('<button type="button" class="close_small" title="' + cinemaName + ' �좏깮�댁젣"/>'))
						.append($("<span/>").text(cinemaName));
			$ul.append($li);
			index++;
		});
		for (; index < 4; index++) {
			var className = '';
			switch (index) {
				case 0:	className = 'mr13 mb10'; break;
				case 1:	className = 'mb10'; break;
				case 2:	className = 'mr13'; break;
			}
			var $li = $('<li class="none_select '+className+'"/>').append($('<button type="button" class="btn_add" title="洹뱀옣�좏깮 鍮덊봽�덉엫"/>'));
			$ul.append($li);
		}
		$('#cinemaList').empty().append($ul);
	},

	/*
	 * �곹솕愿� �좏깮 �앹뾽 : �좏깮�� �곹솕愿� �곗씠�� 洹몃━湲�
	 * */
	drawTempCinemaList: function() {
		var cinemaDatas = MovieCinemaDatas.selectedCinemaDatas;
		var $cinemaSelected = $('#cinemaSelected').empty();
		$.each(cinemaDatas, function(i, item){
			var $cinema = $('li[data-cinemaCode="'+item.cinemaCode+'"]','#body_theater1 .map .depth2');
			if($cinema.length == 0) return;
			$cinema.addClass('active').find('a');
			$cinema.attr('title', $cinema.text()+' �좏깮��');
			$('li[data-cinemaCode="'+item.cinemaCode+'"][data-screenCode="'+item.screenCode+'"]', '.map > ul', '#body_theater1').addClass('active');

			var cinemaName = item.cinemaName;
			if(item.screenCode) cinemaName += ' '+ item.screenName;
			cinemaName += ' ';

			$cinemaSelected.append(
					$('<p class="selected_movie"/>').attr('data-cinemaCode', item.cinemaCode)
						.append($('<span/>').text(cinemaName))
						.append($('<a href="javascript:void(0);" class="fa fa-times a_in_block"/>').append($('<span class="blind"/>').text(cinemaName+' �좏깮�댁젣'))));
			MovieCinemaDatas.tempSelectedCinemaDatas['cinema_'+item.cinemaCode] = { 'cinemaCode' : item.cinemaCode, 'cinemaName' : item.cinemaName, 'screenCode' : item.screenCode, 'screenName' : item.screenName };
		});
	},

	areaInit : function(){
		$.each(MovieCinemaDatas.areaDatas, function(i, area){
			$('.depth1', '#body_theater1').find('li[data-areaCode="'+area.groupCode+'"]').attr('title', area.groupName+' ('+area.cnt+')').text(area.groupName+' ('+area.cnt+')');
		});
	}
}

var MovieDateData = {
	today : '',
	allPlayDates: [],
	playDates: [],
	selectedPlayDate: '',
	clear : function(){
		this.allPlayDates = [];
		this.playDates = [];
		this.selectedPlayDate = '';
	},

	init : function(today){
		MovieDateData.today = today;

		// �덈ℓ 媛�뒫 �좎쭨 �뗮똿
		this.getScreeningDates();

		// �щ씪�대뱶 �좎쭨, �쒓컙 �뗮똿
		this.slide('#sel_date');
		this.slide('#sel_time');

		//�щ젰 �뗮똿
		$('#reservation .cal').datepicker().on('changeDate', function(ev) {
			var $this = $(this);
			var selDate = formatDate(ev.date, '-');
			var isCalValidate = false;
			$.each(MovieDateData.playDates, function(i, playDate){
				if (playDate == selDate) {
					$('#datepicker_wrap button').focus();
					$this.datepicker('hide');
					isCalValidate = true;
					MovieDateData.selectedPlayDate = playDate;
					MovieDateData.moveSlide('#sel_date', selDate);
					MovieTimeDatas.getMovieTimes(); // �곸쁺�ㅼ�伊� 遺덈윭�ㅺ린
					return false;
				}
			});

			if (!isCalValidate) {
				messageBox('�덈ℓ媛�뒫�� �좎쭨媛� �꾨떃�덈떎.');
			}
		});

		$('#sel_date .slidebar_item ol li a').click(function() {
			var $this = $(this);
			var selDate = $(this).closest('li').data('item');
			var isCalValidate = false;
			$('#sel_date .slidebar_item ol li a.active').removeClass('active').removeAttr('title');
			$.each(MovieDateData.playDates, function(i, playDate){
				if (playDate == selDate) {
					// MovieTimeList.selectedBookingDate(screeningDate,'1');
					$this.addClass('active').attr('title','�좏깮��');
					isCalValidate = true;
					MovieDateData.selectedPlayDate = playDate;
					MovieDateData.moveSlide('#sel_date', selDate);
					$('#reservation .cal').datepicker('update', selDate);
					MovieTimeDatas.getMovieTimes();
					return false;
				}
			});

			if (!isCalValidate) {
				messageBox('�덈ℓ媛�뒫�� �좎쭨媛� �꾨떃�덈떎.');
			}
		});

	},

	getToday : function(){
		if(!MovieDateData.today) {
			var dateUtil = new DateUtil();
			MovieDateData.today = dateUtil.getToday('-');
		};
		return MovieDateData.today;
	},

	moveSlide : function(id, selItem) {
		var $base = $(id + ' .slidebar_item');
		var slideWidth = $base.width();
		var itemWidthSum = $base.find('ol').width();
		var movableLeft = itemWidthSum - slideWidth;

		$base.find('ol > li')
			.find('a').removeClass('active').removeAttr('title').end()
			.each(function(){
				var item = $(this).data('item');
				if (selItem == item) {
					$(this).children('a').addClass('active').attr('title','�좏깮��');
					var left = $(this).position().left;
					if (movableLeft < left) {
						left = movableLeft;
					}
					$(this).parent('ol').animate({left: '-'+left+'px'}, 'fast');
					return false;
				}
			});
	},

	slideDateSetting :function(){
		$('#sel_date .slidebar_item li').find('a').addClass('no_click');
		$('#sel_date .slidebar_item li').each(function() {
			var $this = $(this);
			$.each(MovieDateData.playDates, function(i, playDate){
				if($this.data('item') == playDate){
					$this.find('a').removeClass('no_click');
					return false;
				}
			});
		});
	},

	// �덈ℓ 媛�뒫 �좎쭨 �뗮똿
	getScreeningDates: function(){
		MovieDateData.allPlayDates = [];
		$.ajax({
			url: '/DataProvider',
			type: 'POST',
			async: false,
			data: {_command: 'Booking.getScreeningDates', siteCode: '36'}
		}).success(function( data ) {
			if (data.resultCode === '0000') {
				var result = data.result;
				for (var i=0; i < result.length; i++) {
					MovieDateData.allPlayDates.push(result[i].playDate);
				}
				MovieDateData.playDates = MovieDateData.allPlayDates;
				MovieDateData.slideDateSetting();
				$('#reservation .cal').datepicker({
					markingDates: MovieDateData.playDates
				});
			} else {
				messageBox(data.resultMessage);
			}
		});
	},

	slide : function(id) {
		var isMovable = true;

		$(id + ' .slidebar_item ol').width($(id+' .slidebar_item li').width()*$(id+' .slidebar_item li').length);
		var view_area = parseInt($(id + ' .slidebar_item').width()) - parseInt($(id + ' .slidebar_item ol').width());

		$(id + ' .slidebar_control .prev').on('click', function(){
			var item_left = $(id + ' .slidebar_item ol').css('left');
			var move_width = $(id + ' .slidebar_item li').width();
			if (parseInt(item_left) >= 0) {
				$(id + ' .slidebar_item ol').css('left','0px');
			} else {
				if (isMovable) {
					isMovable = false;
					$(id + ' .slidebar_item ol').animate({left:'+='+move_width+'px'}, 'fast', function() {
						isMovable = true;
					});
				}
			}
		});

		$(id + ' .slidebar_control .next').click(function(){
			var item_left = $(id + ' .slidebar_item ol').css('left');
			var move_width = $(id + ' .slidebar_item li').width();
			if (parseInt(item_left) <= view_area) {
				$(id + ' .slidebar_item ol').css('left',view_area);
			} else {
				if (isMovable) {
					isMovable = false;
					$(id + ' .slidebar_item ol').animate({left:'-='+move_width+'px'}, 'fast', function() {
						isMovable = true;
					});
				}
			}
		});
	}
}