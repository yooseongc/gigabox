package com.gigabox.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.cc.service.NoticeService;
import com.gigabox.cc.vo.NoticeSearchCriteria;
import com.gigabox.movie.service.MovieService;
import com.gigabox.movie.vo.RownumVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private MovieService movieService;
	
	@Inject
	private NoticeService noticeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		movieService.movieListRecent(new RownumVO());
		
		model.addAttribute("movieList", movieService.movieListRecent(new RownumVO()));
		
		NoticeSearchCriteria nsc = new NoticeSearchCriteria();
		nsc.setPage(1);
		nsc.setPerPageNum(10);
		model.addAttribute("noticeList", noticeService.noticeList(nsc));
		
		return "index";
	}
	
}
