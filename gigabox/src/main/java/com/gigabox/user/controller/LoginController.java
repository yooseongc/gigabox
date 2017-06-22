package com.gigabox.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.enc.utils.BCrypt;
import com.gigabox.user.enc.utils.SHA256;
import com.gigabox.user.service.LoginService;
import com.gigabox.user.vo.UserVO;

@Controller
@RequestMapping("/user")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Inject
	private LoginService loginService;

	/*// 로그인 폼 출력
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("dto") LoginDTO dto) {
		logger.info("LOGIN PAGE LOADING....");
		return "/user/login";
	}*/

	// 로그인 구현하기
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> loginPOST(LoginDTO loginDTO, HttpSession session) {
		logger.info("LOGIN PROCESSING...");

		Map<String, Object> resultMap = new HashMap<String, Object>();

		logger.info("LOGIN... " + loginDTO.toString());

		// 1. 아이디 존재 체크
		UserVO idCheckUserVO = new UserVO();
		idCheckUserVO.setUserId(loginDTO.getUserId());
		idCheckUserVO.setUserPw(loginDTO.getUserPw());
		int idCheckResult = loginService.idCheck(idCheckUserVO);
		if (idCheckResult == 0) {
			// 해당 계정이 존재하지 않음.
			logger.info("ACCOUNT (" + loginDTO.getUserId() + ") NOT EXISTS.");

			resultMap.put("idCheckResult", idCheckResult);
			resultMap.put("message", "ID-MISSING");

			return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);

		} else {
			// 해당 계정이 존재.
			// 2. 비밀번호 확인
			logger.info("ACCOUNT (" + loginDTO.toString() + ") EXISTS.");
			logger.info("PASSWORD CHECKING PROCEED...");

			String orgPass = loginDTO.getUserPw();
			try {
				SHA256 sha = SHA256.getInsatnce();
				String shaPass = sha.getSha256(orgPass.getBytes());
				String dbPass = loginService.login(loginDTO).getUserPw();
				boolean pwCheckResult = BCrypt.checkpw(shaPass, dbPass);
				if (pwCheckResult) {
					// 비밀번호 일치
					logger.info("LOGIN SUCCESS (" + loginDTO.getUserId() + ")");
					resultMap.put("pwCheckResult", 1);
					resultMap.put("message", "LOGIN-SUCCESS");

					return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
				} else {
					// 비밀번호 불일치
					logger.info("LOGIN FAILED (" + loginDTO.getUserId() + ")");
					resultMap.put("pwCheckResult", 0);
					resultMap.put("message", "PW-WRONG");
					return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
				}
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("LOGIN PROCESS - ERROR");
				resultMap.put("message", "ERROR");
				return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
			}
		}
	}

	@RequestMapping(value = "/loginSession", method = RequestMethod.POST)
	public void loginSessionCreation(LoginDTO dto, HttpSession session, Model model) throws Exception {
		logger.info("LOGIN PROCESS - Create Session");
		UserVO userVO = new UserVO();
		userVO = loginService.login(dto);
		model.addAttribute("userVO", userVO);
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("LOGOUT PROCESS - Remove Session and Cookie");
		session.removeAttribute("login");
		session.invalidate();
		return "redirect:/";
	}
	
	//회원정보 수정
	
}
