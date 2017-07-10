package com.gigabox.cc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gigabox.cc.service.InquiryService;
import com.gigabox.cc.vo.InquirySearchCriteria;
import com.gigabox.cc.vo.InquiryVO;
import com.gigabox.common.PageMaker;
import com.gigabox.user.service.UserService;
import com.gigabox.user.vo.UserVO;

@Controller
@RequestMapping("/cc/qna")
public class InquiryController {

	@Inject
	private InquiryService inquiryService;

	@Inject
	private UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);

	// 본 메소드는 QNA 중 회원의 질문만을 들고오는 메소드이다.
	@Transactional
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String inquiryListGET(@ModelAttribute("isc") InquirySearchCriteria isc, Model model) {
		logger.info("=======================================================");
		logger.info("INQUIRY MAIN PAGE LOADING...");
		logger.info("INITIAL PAGING= " + isc.toString());
		logger.info("PAGE START= " + isc.getPageStart());
		logger.info("PAGE END= " + isc.getPageEnd());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(isc);
		pageMaker.setTotalCount(inquiryService.inquiryListCount(isc));
		model.addAttribute("pageMaker", pageMaker);
		
		List<InquiryVO> inquiryList = inquiryService.inquiryList(isc);
		// logger.info("INQUIRY LIST FIRST ITEM= " +
		// inquiryList.get(0).toString());
		List<Map<String, Object>> inquiryMapList = new ArrayList<Map<String, Object>>();
		for (InquiryVO eachInquiry : inquiryList) {

			// 질문 정보
			Map<String, Object> inquiryMap = new HashMap<String, Object>();
			inquiryMap.put("inquiry", eachInquiry);

			// 회원 정보
			int userNumber = eachInquiry.getUserNumber();
			UserVO initInquiryUser = new UserVO();
			initInquiryUser.setUserNumber(userNumber);
			UserVO inquiryUser = userService.userDetail(initInquiryUser);
			inquiryMap.put("user", inquiryUser);

			// 답변 여부
			/*
			 * InquiryVO answerInquiry =
			 * inquiryService.inquiryDetailA(eachInquiry); if (answerInquiry ==
			 * null) { // 답변이 없으면 0 inquiryMap.put("answerExist", new
			 * Integer(0)); } else { // 답변이 있으면 1 inquiryMap.put("answerExist",
			 * new Integer(1)); }
			 */

			// List에 저장
			inquiryMapList.add(inquiryMap);
		}
		model.addAttribute("inquiryList", inquiryMapList);

	
		logger.info("pageMaker= " + pageMaker.toString());

		logger.info("INQUIRY MAIN PAGE LOADING END");
		logger.info("=======================================================");

		return "/cc/qna/qnaList";
	}

	/* 글 상세보기 구현 */
	@RequestMapping(value = "/qnaRead", method = RequestMethod.GET)
	public String qnaRead(@ModelAttribute InquiryVO ivo, Model model) {
		logger.info("qnaRead 호출성공");
		logger.info("서버로부터 받은 NoticeVO= " + ivo.getInquiryNumber());

		InquiryVO read = new InquiryVO();
		read = inquiryService.inquiryRead(ivo);
		UserVO read1 = new UserVO();
		read1 = userService.userDetail(read1);

		if (read != null && (!read.equals(""))) {
			read.setInquiryContent(read.getInquiryContent().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("userDetail", read1);
		model.addAttribute("inquiryRead", read);
		return "/cc/qna/qnaRead";
	}

	// 글쓰기폼
	@Transactional
	@RequestMapping(value = "/qnaWriteForm", method = RequestMethod.GET)
	public String inquiryinsertGET(@ModelAttribute InquiryVO ivo, Model model) {
		logger.info("writeForm 호출 성공");

		model.addAttribute("inquiryWrite", ivo);
		return "cc/qna/qnaWriteForm";

	}

	// 글쓰기 구현
	@RequestMapping(value = "/qnaWrite", method = RequestMethod.POST)
	public String inquiryInsert(@ModelAttribute InquiryVO ivo, Model model) {
		System.out.println("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆");
		logger.info(ivo.toString());
		logger.info("inquiryInsert 호출성공");

		int result = 0;
		String url = "";

		result = inquiryService.inquiryInsert(ivo);
		if (result == 1) {
			url = "/cc/qna/qnaList";
		}

		return "redirect:" + url;
	}
	
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
			System.out.println(ivo.getInquiryNumber());
			System.out.println(ivo.getInquiryContent());
			System.out.println(ivo.getInquiryTitle());
			
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