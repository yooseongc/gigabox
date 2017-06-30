package com.gigabox.reservation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.movie.controller.MovieController;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);

	@RequestMapping(value = "/resvInfo", method = RequestMethod.GET)
	public String reservationGuide() {
		logger.info("RESERVATION GUIDE PAGE LOAD...");
		return "/reservation/reservationGuide";
	}
}
