package com.gigabox.cc.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.cc.service.InquiryService;
import com.gigabox.cc.vo.InquiryVO;
import com.gigabox.user.vo.UserVO;

@Controller
@RequestMapping("/user")
public class InquiryModifyDeleteController {

	private static final Logger logger = LoggerFactory.getLogger(InquiryModifyDeleteController.class);

	@Inject
	private InquiryService inquiryService;

	// 수정 폼
	@RequestMapping(value = "/qnaUpdateForm", method = RequestMethod.GET)
	public String inquiryUpdateFormGET(@ModelAttribute InquiryVO ivo, Model model, HttpSession session,
			HttpServletRequest request, @PathVariable int userNumber) {
		logger.info("qnaupdteform 호출성공");
		logger.info("userNumber : " + userNumber);
		logger.info("inquiry 나오게 하기 ==========" + ivo.getInquiryNumber());

		InquiryVO update = new InquiryVO();
		update = inquiryService.inquiryRead(ivo);

		UserVO userVO = new UserVO();
		userVO.getUserNumber();
		model.addAttribute("inquiryUpdate", update);

		return "/user/qnaUpdateForm";
	}

	// 수정 구현
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public String inquiryUpdatePOST(@ModelAttribute InquiryVO ivo, @PathVariable String userId) {
		logger.info("========QNA UPDATE 성공=========");

		UserVO userVO = new UserVO();
		userVO.getUserId();

		// 이 변수는 입력 성공에 대한 상태값 담는다 (1 or 0)
		int result = 0;
		String url = "";

		result = inquiryService.inquiryUpdate(ivo);
		if (result == 1) {
			url = "/cc/qna/qnaList"; // 수정 후 목록 이동
			url = "/cc/qna/qnaRead?inquiryNumber=" + ivo.getInquiryNumber(); //수정후 상세페이지 이동
		}

		return "redirect: " + url;
	}

	// 삭제
	@RequestMapping(value = "/qnaDelete", method = RequestMethod.POST)
	public String inquiryDelete(@ModelAttribute InquiryVO ivo) {
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		logger.info("========게시글 삭제 성공==========");

		UserVO userVO = new UserVO();
		userVO.getUserNumber();

		// 이 변수는 입력 성공에 대한 상태값 담는다 (1 or 0)
		int result = 0;
		String url = "";
		
		
		result = inquiryService.inquiryDelete(ivo.getInquiryNumber());
		if (result == 1) {
			url = "/cc/qna/qnaList";
		}

		return "redirect: " + url;
	}
}
