package com.gigabox.bookmark.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.bookmark.service.BookmarkService;
import com.gigabox.bookmark.vo.BookmarkVO;
import com.gigabox.review.controller.ReviewController;
import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.service.LoginService;

@Controller
@RequestMapping("/bookmark")
public class BookmarkController {
	
	@Inject
	private BookmarkService bookmarkService;
	
	@Inject
	private LoginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	/* login, GET */
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	
	
	/* 찜목록 리스트 */
	@RequestMapping(value = "/bookmarkList", method = RequestMethod.GET)
	public String bookmarkList(Model model) {
		if(!model.containsAttribute("bookmark")) {
			model.addAttribute("bookmark", bookmarkService.BookmarkList());
		}
		return "/bookmark/bookmarkList";
	}
	
	/*---- PutCart, POST-----카트에 상품넣기*/
	@RequestMapping(value="addBookmark", method = RequestMethod.POST)
	public String add(@ModelAttribute BookmarkVO bVo,
			          @ModelAttribute("bookmark") List<BookmarkVO> bookmark) {
		bookmark.add(bVo);
		return "redirect:/";
	}
	
}
