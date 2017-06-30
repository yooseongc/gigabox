package com.gigabox.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.user.service.FindInfoService;
import com.gigabox.user.vo.UserVO;

@Controller
@RequestMapping("/user")
public class FindInfoController {

	@Inject
	private FindInfoService findInfoService;

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	// 아이디/비밀번호 찾기 폼 출력
	@RequestMapping(value = "/findInfoForm", method = RequestMethod.GET)
	public String findInfoFormGET() {
		logger.info("FINDINFOFORM PAGE LOADING...");
		return "/user/findInfoForm";
	}

	// 아이디 찾기 구현
	@RequestMapping(value = "/findUserIdForm", method = RequestMethod.POST)
	public String findUserIdPOST(@ModelAttribute UserVO userVO, Model model) {
		logger.info("FINDUSERID LOADING...");
		logger.info("INPUT DATA =" + userVO.toString());

		/*Map<String, Object> resultMap = new HashMap<String, Object>();*/
		
		UserVO findUserVO = findInfoService.findUserId(userVO);
		logger.info("FINDID = " + findUserVO.getUserId());
		logger.info("FINREG = " + findUserVO.getUserReg());
		
		model.addAttribute("userInformation", findUserVO);
		/*String findidResult = findUserVO.getUserId();
		try {
			
			if (findidResult != "") {
				resultMap.put("findidResult", findidResult);
				resultMap.put("message", "FIND-ID");
				model.addAttribute("userInformation", findUserVO);
				return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
			} else {

				resultMap.put("findidResult", findidResult);
				resultMap.put("message", "NOT FIND-ID");
				return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("FIND PROCESS - ERROR");
			resultMap.put("message", "ERROR");
			return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		}*/
		
		return "/user/findInfoForm";
			
	}
}
