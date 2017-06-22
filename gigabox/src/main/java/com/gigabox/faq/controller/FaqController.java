package com.gigabox.faq.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.faq.page.PageMaker;
import com.gigabox.faq.service.FaqService;
import com.gigabox.faq.vo.FaqSearchCriteria;

@Controller
@RequestMapping("/faq")
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	@Inject
	private FaqService faqService;

	/*
	 * @RequestMapping(value = "/faqList", method = RequestMethod.GET) public
	 * String faqListGET(Model model) throws Exception {
	 * logger.info("faqList.jsp 페이지에 데이터를 출력!");
	 * 
	 * model.addAttribute("faqList", faqService.faqList()); return
	 * "/faq/faqList"; }
	 */

	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
	public String faqListGET(@ModelAttribute("fsc") FaqSearchCriteria fsc, Model model) {
		logger.info("=======================================================");
		logger.info("FAQ MAIN PAGE LOADING...");
		logger.info("INITIAL PAGING= " + fsc.toString());
		logger.info("PAGE START= " + fsc.getPageStart());
		logger.info("PAGE END= " + fsc.getPageEnd());

		model.addAttribute("faqList", faqService.faqList(fsc));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(fsc);
		pageMaker.setTotalCount(faqService.faqListCount(fsc));
		model.addAttribute("pageMaker", pageMaker);

		logger.info("pageMaker= " + pageMaker.toString());

		logger.info("FAQ MAIN PAGE LOADING END");
		logger.info("=======================================================");

		return "/faq/faqList";
	}
}
