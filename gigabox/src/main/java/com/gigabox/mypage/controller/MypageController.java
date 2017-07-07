package com.gigabox.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gigabox.bookmark.service.BookmarkService;
import com.gigabox.bookmark.vo.BookmarkVO;
import com.gigabox.cc.service.InquiryService;
import com.gigabox.cc.vo.InquiryVO;
import com.gigabox.movie.service.MovieService;
import com.gigabox.movie.vo.MovieVO;
import com.gigabox.reservation.service.ReservationService;
import com.gigabox.reservation.vo.ReservationVO;
import com.gigabox.user.service.UserService;
import com.gigabox.user.vo.UserVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	private InquiryService inquiryService;
	
	@Inject
	private BookmarkService bookmarkService;
	
	@Inject
	private MovieService movieService;
	
	@Inject
	private ReservationService reservationService;
	
	@Inject
	private UserService userService;

	
	/* 마이무비 리스트 */
	@RequestMapping(value = "/mymovie", method = RequestMethod.GET)
	public String bookmarkList(HttpServletRequest request, HttpSession session, Model model) {
		// logger.info("bookmarkList.jsp ENTER...");
		
		UserVO loginSessionVO = (UserVO) session.getAttribute("login");
		BookmarkVO userBookmark = new BookmarkVO();
		userBookmark.setUserNumber(loginSessionVO.getUserNumber());
		List<BookmarkVO> bookmarkList = bookmarkService.BookmarkList(userBookmark);

		List<Map<String, Object>> bookmarkMapList = new ArrayList<>();
		for (BookmarkVO eachBookmark : bookmarkList) {

			// 마이무비 정보
			Map<String, Object> bookmarkMap = new HashMap<>();
			bookmarkMap.put("bookmark", eachBookmark);

			// 영화 정보
			int movieNumber = eachBookmark.getMovieNumber();
			MovieVO initBookmarkMovie = new MovieVO();
			initBookmarkMovie.setMovieNumber(movieNumber);
			MovieVO bookmarkMovie = movieService.movieDetail(initBookmarkMovie);
			bookmarkMap.put("movie", bookmarkMovie);

			// List에 저장
			bookmarkMapList.add(bookmarkMap);
		}
		
		model.addAttribute("bookmarkList", bookmarkMapList);
		request.setAttribute("listType", 2);
		
		//예매 확인,취소
		ReservationVO resvInfoVO = new ReservationVO();
		resvInfoVO.setUserNumber(loginSessionVO.getUserNumber());
		List<ReservationVO> resvInfoList = reservationService.reservationList(resvInfoVO);
		model.addAttribute("resvInfoList", resvInfoList);
		
		//1:1 문의내역
		InquiryVO inquiryVO = new InquiryVO();
		inquiryVO.setUserNumber(loginSessionVO.getUserNumber());
		List<InquiryVO> inquiryList = inquiryService.inquiryListByUser(inquiryVO);
		model.addAttribute("inquiryListByUser", inquiryList);
		

		List<Map<String, Object>> inquiryMapList = new ArrayList<>();
		for (InquiryVO eachInquiry : inquiryList) {
			
			// 질문 정보
			Map<String, Object> inquiryMap = new HashMap<>();
			inquiryMap.put("inquiry", eachInquiry);
			
			// 회원 정보
			int userNumber = eachInquiry.getUserNumber();
			UserVO initInquiryUser = new UserVO();
			initInquiryUser.setUserNumber(userNumber);
			UserVO inquiryUser = userService.userDetail(initInquiryUser);
			inquiryMap.put("user", inquiryUser);
			
			// 답변 여부
			InquiryVO answerInquiry = inquiryService.inquiryDetailA(eachInquiry);
			if (answerInquiry == null) {
				// 답변이 없으면 0
				inquiryMap.put("answerExist", new Integer(0));
			} else {
				// 답변이 있으면 1
				inquiryMap.put("answerExist", new Integer(1));
			}
			
			// List에 저장
			inquiryMapList.add(inquiryMap);
		}
		model.addAttribute("inquiryList", inquiryMapList);
		
		
		return "/mypage/mymovie";
	}

	//북마크 추가
	@ResponseBody
	@RequestMapping(value = "/addBookmark", method = RequestMethod.POST)
	public int addBookmark(@RequestBody BookmarkVO bvo) {
		int result = 0;
		
		result = bookmarkService.countBookmark(bvo);
		if(result ==0){
			bookmarkService.addBookmark(bvo);
		}else{
			result= 1;
		}
		
		return result;
	}

	//북마크 삭제
	@ResponseBody
	@RequestMapping(value = "/bookmarkDelete", method = RequestMethod.POST)
	public int delete(@RequestBody BookmarkVO bookmarkNumber) {

		int result = 0;
		result = bookmarkService.delete(bookmarkNumber);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/reservationDelete", method = RequestMethod.POST)
	public String reservationDeletePOST(@RequestParam("reservationNumber") int reservationNumber){
		logger.info("SUCCESS RESERVATION_DELETE");
		logger.info("RESERVATION NUMBER= " + reservationNumber);
		ReservationVO resvVO = new ReservationVO();
		resvVO.setReservationNumber(reservationNumber);
		int result = reservationService.reservationDelete(resvVO);
		logger.info("DELETE RESULT= " + result);
		return result + "";
	}
	
}
