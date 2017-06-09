package com.gigabox.faq.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.faq.service.FaqService;

@Controller
@RequestMapping("/faq")
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	@Inject
	private FaqService faqService;

	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
	public String faqListGET(Model model) throws Exception {
		logger.info("faqList.jsp 페이지에 데이터를 출력!");
		model.addAttribute("faqList", faqService.faqList());
		return "/faq/faqList";
	}
}
