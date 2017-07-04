package com.gigabox.bookmark.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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
import com.gigabox.review.controller.ReviewController;
import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.service.LoginService;

@Controller
@RequestMapping("/bookmark")
public class BookmarkController {
	
	@Inject
	private BookmarkService bookmarkService;
	
	@Inject
	private LoginService loginService;
	
	@Inject
	private MovieService movieService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	/* login, GET */
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	
	
	/* 마이무비 리스트 */
	@RequestMapping(value = "/bookmarkList", method = RequestMethod.GET)
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
		
		return "/bookmark/bookmarkList";
	}
	
/*	---- PutCart, POST-----카트에 상품넣기 */
	@RequestMapping(value="/addBookmark", method = RequestMethod.POST)
	public String add(@ModelAttribute BookmarkVO bVo,
			          @ModelAttribute("bookmark") List<BookmarkVO> bookmark) {
		bookmark.add(bVo);
		return "redirect:/bookmark/bookmarkList";
	}
	
}
