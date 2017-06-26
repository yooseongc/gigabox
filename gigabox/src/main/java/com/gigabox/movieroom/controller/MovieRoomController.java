package com.gigabox.movieroom.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.movie.controller.MovieController;
import com.gigabox.movieroom.service.MovieRoomService;

@Controller
@RequestMapping("/movieRoom")
public class MovieRoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Inject
	private MovieRoomService service;
	
	@RequestMapping(value = "/movieRoomList", method = RequestMethod.GET)
	public void movieRoomList(Model model) {
		logger.info("movieRoomList.jsp ENTER...");
		model.addAttribute("movieRoomList", service.movieRoomList());
	}
}
