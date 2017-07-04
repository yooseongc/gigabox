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

import com.gigabox.user.enc.utils.BCrypt;
import com.gigabox.user.enc.utils.SHA256;
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

		UserVO findUserVO = findInfoService.findUserId(userVO);
		if (findUserVO != null) {
			logger.info("FINDID = " + findUserVO.getUserId());
			logger.info("FINREG = " + findUserVO.getUserReg());
			model.addAttribute("userInformation", findUserVO);
			model.addAttribute("alert", "id");
		} else {
			model.addAttribute("alert", "iderror");
		}
 		
		return "/user/findInfoForm";
	}
	
	// 비밀번호 찾기 구현 ->비밀번호 변경 페이지로 이동
	@RequestMapping(value = "/findPwForm", method = RequestMethod.POST)
	public String findUserPwFormPOST(@ModelAttribute UserVO userVO, Model model) {
		logger.info("FIND_USERPW LOADING...");
		logger.info("INPUT DATA =" + userVO.toString());

		UserVO findUserVO = findInfoService.findUserPw(userVO);
		if (findUserVO == null) {
			model.addAttribute("alert", "pwerror");
		} else {
			model.addAttribute("findUserPw", findUserVO);
			logger.info("FIND_USERPW_FORM PAGE LOADING...");
			return "/user/findUserPwForm";
		}
		return "/user/findInfoForm";
	}
	
	// 비밀번호 변경 구현
	@RequestMapping(value = "/findUserPwForm", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> findUserPwFormPOST(@ModelAttribute UserVO userVO){
		logger.info("FINDUSERPW_FORM LOADING...");
		logger.info("INPUT DATA =" + userVO.toString());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 새 비밀번호 암호화
		int pwEncryptionResult = 0;
		String orgPass = userVO.getUserPw();

		String shaPass = "";
		try {
			SHA256 sha1 = SHA256.getInsatnce();
			shaPass = sha1.getSha256(orgPass.getBytes());
			String bcPass1 = BCrypt.hashpw(shaPass, BCrypt.gensalt());
			userVO.setUserPw(bcPass1);
			pwEncryptionResult = findInfoService.pwEncryptionExec(userVO);

			logger.info("PW ENCRYPTION RESULT= " + pwEncryptionResult);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//새 비밀번호로 변경
		findInfoService.findChangePw(userVO);
		logger.info("CHANGE SUCCESS!!");
		resultMap.put("pwCheckResult", 1);
		resultMap.put("message", "CHANGE-SUCCESS");
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}
}
