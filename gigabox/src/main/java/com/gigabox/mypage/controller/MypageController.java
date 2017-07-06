package com.gigabox.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.bookmark.service.BookmarkService;
import com.gigabox.bookmark.vo.BookmarkVO;
import com.gigabox.movie.service.MovieService;
import com.gigabox.movie.vo.MovieVO;
import com.gigabox.user.service.UserService;
import com.gigabox.user.vo.UserVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	private UserService userService;
	
	@Inject
	private BookmarkService bookmarkService;
	
	@Inject
	private MovieService movieService;
	
	@RequestMapping(value = "/mileageInfo", method = RequestMethod.GET)
	public String mileageInfoGET(HttpSession session, Model model) {
		logger.info("=======================================================");
		logger.info("MYPAGE - MILEAGE INFO");
		UserVO loginUser = (UserVO) session.getAttribute("login");
		
		model.addAttribute("userInfo", userService.userDetail(loginUser));
		
		
		return "/mypage/mileageInfo";
	}
	
	/* 마이무비 리스트 */
	@RequestMapping(value = "/mymovie", method = RequestMethod.GET)
	public String bookmarkList(Model model) {
		//logger.info("bookmarkList.jsp ENTER...");
		
		List<BookmarkVO> bookmarkList = bookmarkService.BookmarkList();
		
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
			
			//List에 저장
			bookmarkMapList.add(bookmarkMap);
		}
		model.addAttribute("bookmarkList", bookmarkMapList);
		
		return "/mypage/mymovie";
	}
	
	/*	---- PutCart, POST-----카트에 상품넣기 */
	@RequestMapping(value="/addBookmark", method = RequestMethod.POST)
	public String add(@ModelAttribute BookmarkVO bVo,
			          @ModelAttribute("bookmark") List<BookmarkVO> bookmark) {
		bookmark.add(bVo);
		return "redirect:/mypage/mymovie";
	}
	
	/*예매확인/취소 폼 출력*/
	@RequestMapping(value = "/resvInfo", method = RequestMethod.GET)
	public String resvInfoGET (HttpSession session, Model model){
	logger.info("LOADING resvInfo FORM....");
	
	return "/mypage/resvInfo";
	}
}
