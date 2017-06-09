package com.gigabox.notice.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService noticeService;

	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeListGET(Model model) throws Exception {
		logger.info("noticeList.jsp에 데이터를 출력");
		model.addAttribute("noticeList", noticeService.noticeList());
		return "/notice/noticeList";
	}
}
