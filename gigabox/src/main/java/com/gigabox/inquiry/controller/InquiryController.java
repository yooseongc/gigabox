package com.gigabox.inquiry.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.inquiry.service.InquiryService;
import com.gigabox.inquiry.vo.InquiryVO;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);

	@Inject
	private InquiryService inquiryService;

	/* 글 목록 구현 */
	@RequestMapping(value = "/inquiryList", method = RequestMethod.GET)
	public String inquiryList(@ModelAttribute InquiryVO ivo, Model model) throws Exception {
		logger.info("inquiryList 호출성공");

		List<InquiryVO> inquiryList = inquiryService.inquiryList();
		model.addAttribute("inquiryList", inquiryList);
		return "/inquiry/inquiryList";
	}

	// 글 상세
	@RequestMapping(value = "/inquiryRead", method = RequestMethod.GET)
	public String inquiryRead(@ModelAttribute InquiryVO ivo, Model model) {
		logger.info("inquiryRead 호출성공");
		logger.info("서버로부터 받은 inquiryVO= " + ivo.getInquiryNumber());

		return "";

	}

	/* 글쓰기 폼 */
	@RequestMapping(value = "/qnaWrite", method = RequestMethod.GET)
	public String qnaWrite() {
		logger.info("qnaWrite 호출 성공");

		return "qna/qnaWrite";
	}

	/* 글쓰기 구현 */
	/*
	 * @RequestMapping(value = "/inquiryInsert", method = RequestMethod.POST)
	 * public String inquiryInsert(@ModelAttribute InquiryVO ivo) throws
	 * Exception { logger.info("inquiryInsert 호출 성공");
	 * 
	 * int result = 0; String url = "";
	 * 
	 * result = inquiryService.inquiryInsert(ivo); if (result == 1) { url =
	 * "/qna/qnaList"; } return "redirect: " + url; }
	 */

	@RequestMapping(value = "/inquiryInsert", method = RequestMethod.POST)
	public String inquiryInsert(@ModelAttribute InquiryVO ivo, HttpServletRequest request) throws Exception {
		logger.info("inquiry글쓰기 호출 성공");
		logger.info("inquiryTitle: " + ivo.getInquiryTitle());

		int result = 0;
		String url = "";

		result = inquiryService.inquiryInsert(ivo);
		if (result == 1) {
			url = "/qna/qnaList";
		}
		return "redirect: " + url;
	}
	/* 수정 폼 */
	
}
