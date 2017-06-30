package com.gigabox.cc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.spec.IvParameterSpec;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gigabox.cc.service.InquiryService;
import com.gigabox.cc.vo.InquirySearchCriteria;
import com.gigabox.cc.vo.InquiryVO;
import com.gigabox.cc.vo.NoticeVO;
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

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(isc);
		pageMaker.setTotalCount(inquiryService.inquiryListCount(isc));
		model.addAttribute("pageMaker", pageMaker);

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

		if (read != null && (!read.equals(""))) {
			read.setInquiryContent(read.getInquiryContent().toString().replaceAll("\n", "<br>"));
		}
		model.addAttribute("inquiryRead", read);
		return "/cc/qna/qnaRead";
	}

	// 글쓰기폼
	@Transactional
	@RequestMapping(value = "/qnaWrite", method = RequestMethod.GET)
	public String inquiryWriteGET(@ModelAttribute InquirySearchCriteria isc, Model model) {
		logger.info("writeForm 호출 성공");

		List<InquiryVO> inquiryList = inquiryService.inquiryList(isc);

		model.addAttribute("inquiryList", inquiryList);

		return "cc/qna/qnaWrite";

	}

	@Transactional
	@ResponseBody
	@RequestMapping(value = "/qnaDetailQ/{inquiryNumber}", method = RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> noticeDetailQRest(@PathVariable("inquiryNumber") int inquiryNumber) {

		logger.info("=======================================================");
		logger.info("INQUIRY DETAIL QUESTION DATA REQUESTED");
		InquiryVO selectData = new InquiryVO();
		selectData.setInquiryNumber(inquiryNumber);
		InquiryVO selectedData = inquiryService.inquiryDetailQ(selectData);

		// 작성자 정보 가져오기
		logger.info("InquiryVO= " + selectedData.toString());

		// 맵
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("inquiry", selectedData);

		ResponseEntity<Map<String, Object>> selectedInquiryEntity = new ResponseEntity<Map<String, Object>>(resultMap,
				HttpStatus.OK);

		logger.info("INQUIRY DETAIL QUESTION DATA SENT TO JSON");
		logger.info("=======================================================");
		return selectedInquiryEntity;
	}

	@ResponseBody
	@RequestMapping(value = "/qnaDetailA/{inquiryGroupnumber}", method = RequestMethod.PUT)
	public ResponseEntity<InquiryVO> noticeDetailARest(@PathVariable("inquiryGroupnumber") int inquiryGroupnumber) {

		logger.info("=======================================================");
		logger.info("INQUIRY DETAIL ANSWER DATA REQUESTED");
		InquiryVO selectData = new InquiryVO();
		selectData.setInquiryGroupnumber(inquiryGroupnumber);
		InquiryVO selectedData = inquiryService.inquiryDetailA(selectData);
		logger.info("InquiryVO= " + selectedData.toString());
		ResponseEntity<InquiryVO> selectedInquiryEntity = new ResponseEntity<InquiryVO>(selectedData, HttpStatus.OK);

		logger.info("INQUIRY DETAIL ANSWER DATA SENT TO JSON");
		logger.info("=======================================================");
		return selectedInquiryEntity;
	}

	@ResponseBody
	@RequestMapping(value = "/qnaInsertA", method = RequestMethod.POST)
	public ResponseEntity<Map<String, String>> inquiryInsertARest(InquiryVO inquiryVO) {
		logger.info("=======================================================");
		logger.info("INQUIRY ANSWER INSERT REQUESTED");
		logger.info("InquiryVO= " + inquiryVO.toString());
		int result = inquiryService.inquiryInsertA(inquiryVO);
		Map<String, String> resultMap = new HashMap<String, String>();
		if (result == 1) {
			resultMap.put("result", "SUCCESS");
			logger.info("INSERT SUCCESS");
		} else {
			resultMap.put("result", "FAILED");
			logger.info("INSERT FAILED");
		}
		ResponseEntity<Map<String, String>> resultEntity = new ResponseEntity<Map<String, String>>(resultMap,
				HttpStatus.OK);
		logger.info("INQUIRY ANSWER INSERT RESULT SENT TO JSON");
		logger.info("=======================================================");
		return resultEntity;
	}

	@ResponseBody
	@RequestMapping(value = "/qnaUpdateA", method = RequestMethod.POST)
	public ResponseEntity<Map<String, String>> inquiryUpdateARest(InquiryVO inquiryVO) {

		logger.info("=======================================================");
		logger.info("INQUIRY ANSWER UPDATE REQUESTED");
		logger.info("InquiryVO= " + inquiryVO.toString());
		int result = inquiryService.inquiryUpdateA(inquiryVO);
		Map<String, String> resultMap = new HashMap<String, String>();
		if (result == 1) {
			resultMap.put("result", "SUCCESS");
			logger.info("UPDATE SUCCESS");
		} else {
			resultMap.put("result", "FAILED");
			logger.info("UPDATE FAILED");
		}
		ResponseEntity<Map<String, String>> resultEntity = new ResponseEntity<Map<String, String>>(resultMap,
				HttpStatus.OK);
		logger.info("INQUIRY ANSWER UPDATE RESULT SENT TO JSON");
		logger.info("=======================================================");
		return resultEntity;
	}

	@ResponseBody
	@RequestMapping(value = "/qnaDeleteA", method = RequestMethod.POST)
	public ResponseEntity<Map<String, String>> inquiryDeleteARest(InquiryVO inquiryVO) {

		logger.info("=======================================================");
		logger.info("INQUIRY ANSWER DELETE REQUESTED");
		logger.info("InquiryVO= " + inquiryVO.toString());
		int result = inquiryService.inquiryDeleteA(inquiryVO);
		Map<String, String> resultMap = new HashMap<String, String>();
		if (result == 1) {
			resultMap.put("result", "SUCCESS");
			logger.info("DELETE SUCCESS");
		} else {
			resultMap.put("result", "FAILED");
			logger.info("DELETE FAILED");
		}
		ResponseEntity<Map<String, String>> resultEntity = new ResponseEntity<Map<String, String>>(resultMap,
				HttpStatus.OK);
		logger.info("INQUIRY ANSWER DELETE RESULT SENT TO JSON");
		logger.info("=======================================================");
		return resultEntity;
	}
}