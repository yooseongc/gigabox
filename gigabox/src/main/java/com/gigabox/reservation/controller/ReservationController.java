package com.gigabox.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gigabox.reservation.service.ReservationService;
import com.gigabox.reservation.vo.ReservationVO;
import com.gigabox.schedule.service.ScheduleService;
import com.gigabox.schedule.vo.ScheduleSearchCriteria;
import com.gigabox.schedule.vo.ScheduleVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);

	@Inject 
	private ReservationService resvService;
	
	/*@Inject
	private BranchService branchService;
	
	@Inject
	private MovieRoomService movieRoomService;
	
	@Inject 
	private UserService userService;
	
	@Inject
	private MovieService movieService;*/
	
	@Inject
	private ScheduleService scheduleService;
	
	@RequestMapping(value = "/resvInfo", method = RequestMethod.GET)
	public String reservationGuide() {
		logger.info("RESERVATION GUIDE PAGE LOAD...");
		return "/reservation/reservationGuide";
	}
	
	@RequestMapping(value = "/resvMain", method = RequestMethod.GET)
	public String reservationMainGET() {
		logger.info("RESERVATION START PAGE LOAD...");
		return "/reservation/reservationMain";
	}
	
	@RequestMapping(value = "/resvSeat", method = RequestMethod.POST)
	public String reservationSeatPOST(Model model, int scheduleNumber, int movieroomNumber) {
		logger.info("RESERVATION SEAT SELECT PAGE LOAD...");
		logger.info("SCHEDULE NUMBER= " + scheduleNumber);
		logger.info("MOVIEROOM NUMBER= " + movieroomNumber);
		model.addAttribute("movieroomNumber", movieroomNumber);
		model.addAttribute("scheduleNumber", scheduleNumber);
		return "/reservation/reservationSeat";
	}
	
	
	@RequestMapping(value="/resvPayment", method=RequestMethod.POST) 
	public String reservationPaymentPOST(Model model, ReservationVO resvVO) {
		logger.info("RESERVATION PAYMENT PAGE LOAD...");
		logger.info("RESERVATION VO=" + resvVO.toString());
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setScheduleNumber(resvVO.getScheduleNumber());
		ScheduleVO info = scheduleService.scheduleDetail(scheduleVO);
		// 예매 코드 TR-(영화5자리)-(영화관3자리)-(상영관2자리)-(1706280630;시작시간)
		logger.info(info.toString());
		resvVO.setReservationCode("TR-" + info.getMovieNumber() + 
				"-" + info.getBranchNumber() + "-" 
				+ info.getMovieroomNumber() + "-" 
				+ formattedDate(info.getScheduleStart(), "yyMMddHHmm"));

		int result = resvService.reservationSeatInsert(resvVO);
		logger.info("result= " + result);
		return "/reservation/reservationPayment";
	}
	
	// 좌석 예약 정보 받아오기
	@ResponseBody
	@RequestMapping(value = "/resvList", method = RequestMethod.GET)
	public ResponseEntity<List<ReservationVO>> reservationListForResv(int scheduleNumber) throws ParseException {
		logger.info("==============================================================");
		logger.info("AJAX => reservation LIST INFORMATION REQUEST");
		
		logger.info("scheduleNumber= " + scheduleNumber);
		
		ReservationVO targetVO = new ReservationVO();
		targetVO.setScheduleNumber(scheduleNumber);
		List<ReservationVO> resvList = resvService.reservationList(targetVO);
		
		logger.info("==============================================================");
		return new ResponseEntity<List<ReservationVO>>(resvList, HttpStatus.OK);
	}
	
	// 극장 정보 가져오기
	@ResponseBody
	@RequestMapping(value = "/branchList", method = RequestMethod.GET)
	public ResponseEntity<List<Map<String, Object>>> branchListforResv(ScheduleSearchCriteria ssc, 
			String scheduleDateStr, String scheduleStartStr) throws ParseException {
		logger.info("==============================================================");
		logger.info("AJAX => BRANCH LIST INFORMATION REQUEST");
		if (scheduleDateStr != null && !"".equals(scheduleDateStr)) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date scheduleDate = transFormat.parse(scheduleDateStr);
			ssc.setScheduleDate(scheduleDate);
		}
		if (scheduleStartStr != null && !"".equals(scheduleStartStr)) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date scheduleStart = transFormat.parse(scheduleStartStr);
			ssc.setScheduleStart(scheduleStart);
		}
		
		logger.info("Searching Condition= " + ssc.toString());
		
		List<Map<String, Object>> resultList = new ArrayList<>();
		
		List<ScheduleVO> scheduleList = scheduleService.scheduleBranchList(ssc);
		
		List<String> location = new ArrayList<>();
		for (ScheduleVO each : scheduleList) {
			location.add(each.getBranchName().split(" ")[0]);
		}
		findDuplicateValue(location);
		for (String loc : location) { 
			Map<String, Object> eachLocMap = new HashMap<>();
			List<Map<String, Object>> branchList = new ArrayList<>();
			Map<String, Object> branchItem = new HashMap<>();
			for (ScheduleVO each : scheduleList) {
				if (each.getBranchName().startsWith(loc)) {
					branchItem.put("branchName", each.getBranchName());
					branchItem.put("branchNumber", each.getBranchNumber());
					branchList.add(branchItem);
				}
			}
			eachLocMap.put("branchList", branchList);
			eachLocMap.put("location", loc);
			resultList.add(eachLocMap);
		}
		
		logger.info("==============================================================");
		return new ResponseEntity<List<Map<String,Object>>>(resultList, HttpStatus.OK);
	}
	
	private void findDuplicateValue(List<String> list) {
		for (int i = 0; i < list.size(); i++) {
			String str1 = list.get(i);
			for (int j = 0; j < list.size(); j++) {
				if (i == j)
					continue;
				String str2 = list.get(j);
				if (str1.equals(str2)) {
					list.remove(j);
					i = 0;
					continue;
				}
			}
		}
	}
	
	// 영화 정보 가져오기
	@ResponseBody
	@RequestMapping(value = "/movieList", method = RequestMethod.GET)
	public ResponseEntity<List<Map<String, Object>>> movieListForResv(ScheduleSearchCriteria ssc, 
			String scheduleDateStr, String scheduleStartStr) throws ParseException {
		logger.info("==============================================================");
		logger.info("AJAX => MOVIE LIST INFORMATION REQUEST");
		if (scheduleDateStr != null && !"".equals(scheduleDateStr)) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date scheduleDate = transFormat.parse(scheduleDateStr);
			ssc.setScheduleDate(scheduleDate);
		}
		if (scheduleStartStr != null && !"".equals(scheduleStartStr)) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date scheduleStart = transFormat.parse(scheduleStartStr);
			ssc.setScheduleStart(scheduleStart);
		}
		
		logger.info("Searching Condition= " + ssc.toString());
		
		List<Map<String, Object>> resultList = new ArrayList<>();
		
		List<ScheduleVO> scheduleList = scheduleService.scheduleMovieList(ssc);
		
		List<Integer> movieNumberList = new ArrayList<>();
		for (ScheduleVO each : scheduleList) {
			movieNumberList.add(each.getMovieNumber());
		}
		for (int movieNumber : movieNumberList) { 
			Map<String, Object> eachMovieMap = new HashMap<>();
			for (ScheduleVO each : scheduleList) {
				if (each.getMovieNumber() == movieNumber) {
					eachMovieMap.put("movieNumber", movieNumber);
					eachMovieMap.put("movieTitle", each.getMovieTitle());
					eachMovieMap.put("movieType", each.getMovieType());
					eachMovieMap.put("movieStatus", each.getMovieStatus());
					eachMovieMap.put("movieReleasedate", each.getMovieReleasedate());
					eachMovieMap.put("movieScreentime", each.getMovieScreentime());
					eachMovieMap.put("movieRating", each.getMovieRating());
				}
			}
			resultList.add(eachMovieMap);
		}
		
		logger.info("==============================================================");
		return new ResponseEntity<List<Map<String,Object>>>(resultList, HttpStatus.OK);
	}
	
	// 영화 상영 일정 정보 가져오기
	@ResponseBody
	@RequestMapping(value = "/scheduleList", method = RequestMethod.GET)
	public ResponseEntity<List<ScheduleVO>> movieScheduleListForResv(ScheduleSearchCriteria ssc, 
			String scheduleDateStr, String scheduleStartStr) throws ParseException {
		logger.info("==============================================================");
		logger.info("AJAX => Schedule LIST INFORMATION REQUEST");
		if (scheduleDateStr != null && !"".equals(scheduleDateStr)) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date scheduleDate = transFormat.parse(scheduleDateStr);
			ssc.setScheduleDate(scheduleDate);
		}
		if (scheduleStartStr != null && !"".equals(scheduleStartStr)) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date scheduleStart = transFormat.parse(scheduleStartStr);
			ssc.setScheduleStart(scheduleStart);
		}
		
		logger.info("Searching Condition= " + ssc.toString());
		
		List<ScheduleVO> scheduleList = scheduleService.scheduleList(ssc);
		
		logger.info("==============================================================");
		return new ResponseEntity<List<ScheduleVO>>(scheduleList, HttpStatus.OK);
	}
	
	public static String formattedDate(Date date, String format) {
		SimpleDateFormat toFormat = new SimpleDateFormat(format);
		return toFormat.format(date);
	}
	
}
