package com.gigabox.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class FindInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);	
	
	// 아이디/비밀번호 찾기 폼 출력
	@RequestMapping(value = "/findInfoForm", method = RequestMethod.GET)
	public String findInfoFormGET(){
		logger.info("FINDINFOFORM PAGE LOADING...");
		return "/user/findInfoForm";
	}

	// 아이디 찾기 구현
	
}
