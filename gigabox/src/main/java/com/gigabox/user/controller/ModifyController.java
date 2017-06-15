package com.gigabox.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class ModifyController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyFormGET(){
		logger.info("MODIFYFORM PAGE LOADING...");
		return "/user/modifyForm";
	}
	
}
