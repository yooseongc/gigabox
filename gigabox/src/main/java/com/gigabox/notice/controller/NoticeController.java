package com.gigabox.notice.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.notice.page.PageMaker;
import com.gigabox.notice.service.NoticeService;
import com.gigabox.notice.vo.NoticeSearchCriteria;
import com.gigabox.notice.vo.NoticeVO;



	/* 글 목록 구현 */
	/*
	 * @RequestMapping(value = "/noticeList", method = RequestMethod.GET) public
	 * String noticeListGET(Model model) throws Exception{
	 * logger.info("noticeList.jsp 나오기");
	 * 
	 * List<NoticeVO> noticeList = noticeService.noticeList(); //List 뽑아와서
	 * instance 만들기 //log4j에서 패키지 추가 후 리스트에 있는 것을 vo명으로?? 뽑기 for (NoticeVO vo :
	 * noticeList) { logger.info(vo.toString()); }
	 * model.addAttribute("noticeList", noticeList); return
	 * "/notice/noticeList"; }
	 */

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService noticeService;

	
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeListGET(@ModelAttribute("nsc") NoticeSearchCriteria nsc, Model model) {
		logger.info("=======================================================");
		logger.info("NOTICE MAIN PAGE LOADING...");
		logger.info("INITIAL PAGING= " + nsc.toString());
		logger.info("검색타입"+nsc.getSearchType());
		logger.info("PAGE START= " + nsc.getPageStart());
		logger.info("PAGE END= " + nsc.getPageEnd());
		
		model.addAttribute("noticeList", noticeService.noticeList(nsc));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(nsc);
		pageMaker.setTotalCount(noticeService.noticeListCount(nsc));
		model.addAttribute("pageMaker", pageMaker);
		
		logger.info("pageMaker= " + pageMaker.toString());
		
		logger.info("NOTICE MAIN PAGE LOADING END");
		logger.info("=======================================================");
		
		return "/notice/noticeList";
	}

	/* 글 상세보기 구현 */

	@RequestMapping(value = "/noticeRead", method = RequestMethod.GET)
	public String noticeRead(@ModelAttribute NoticeVO nvo, Model model) {
		logger.info("noticeRead 호출성공");
		logger.info("서버로부터 받은 NoticeVO= " + nvo.getNoticeNumber());

		NoticeVO read = new NoticeVO();
		read = noticeService.noticeRead(nvo);

		if (read != null && (!read.equals(""))) {
			read.setNoticeContent(read.getNoticeContent().toString().replaceAll("\n", "<br>"));
		}
		model.addAttribute("noticeRead", read);
		return "/notice/noticeRead";
	}

}
