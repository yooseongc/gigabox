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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gigabox.cc.service.InquiryService;
import com.gigabox.cc.vo.InquiryVO;
import com.gigabox.user.vo.UserVO;

@Controller
@RequestMapping("/cc/qna")
public class InquiryModifyDeleteController {

	private static final Logger logger = LoggerFactory.getLogger(InquiryModifyDeleteController.class);

	@Inject
	private InquiryService inquiryService;

	// 수정 폼
	@RequestMapping(value = "/qnaUpdateForm", method = RequestMethod.GET)
	public String inquiryUpdateFormGET(@ModelAttribute InquiryVO ivo, Model model) {
		InquiryVO update = new InquiryVO();
		update = inquiryService.inquiryRead(ivo);

		model.addAttribute("inquiryUpdate", update);
		
		return "/cc/qna/qnaUpdateForm";
	}

	// 수정 구현
	@ResponseBody
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public String inquiryUpdatePOST(@RequestBody InquiryVO ivo) {
		int result = 0;
		
		result = inquiryService.inquiryUpdate(ivo);

		return result + "";
	}

	// 삭제

	@ResponseBody
	@RequestMapping(value = "/qnaDelete", method = RequestMethod.POST)
	public String inquiryDelete(@RequestBody InquiryVO ivo) {
		logger.info("========게시글 삭제 성공==========");
		System.out.println(ivo.getInquiryNumber());
		// 이 변수는 입력 성공에 대한 상태값 담는다 (1 or 0)
		int result = 0;
	
		result = inquiryService.inquiryDelete(ivo);

		return result+"";
		
	}
}
