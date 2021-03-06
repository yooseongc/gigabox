package com.gigabox.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.enc.utils.BCrypt;
import com.gigabox.user.enc.utils.SHA256;
import com.gigabox.user.service.ModifyService;
import com.gigabox.user.vo.UserVO;

@Controller
@RequestMapping("/user")
public class ModifyController {

	private static final Logger logger = LoggerFactory.getLogger(ModifyController.class);

	@Inject
	private ModifyService modifyService;

	// 회원정보 수정 폼 출력
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyFormGET(Model model, HttpSession session, 
			HttpServletRequest request) {
		logger.info("MODIFYFORM PAGE LOADING...");
		
		UserVO sessionVO = (UserVO) session.getAttribute("login");
		logger.info("userId= " + sessionVO.getUserId());

		UserVO userVO = new UserVO();
		userVO = modifyService.userDetail(sessionVO);

		model.addAttribute("userInfo", userVO);

		return "/user/modifyForm";
	}

	// 회원정보 수정 구현하기
	@RequestMapping(value = "/modifyForm", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> modifyFormPOST(@ModelAttribute UserVO userVO, LoginDTO loginDTO) {
		logger.info("MODIFY LOADING...");
		logger.info("INPUT DATA= " + userVO.toString());

		Map<String, Object> resultMap = new HashMap<String, Object>();
		UserVO pwCheckUserVO = new UserVO();
		pwCheckUserVO.setUserPw(userVO.getUserPw());
		String orgPass = userVO.getUserPw();
		try {
			SHA256 sha = SHA256.getInsatnce();
			String shaPass = sha.getSha256(orgPass.getBytes());
			String dbPass = modifyService.userDetail(userVO).getUserPw();
			boolean pwCheckResult = BCrypt.checkpw(shaPass, dbPass);
			if (pwCheckResult) {
				// 비밀번호 일치
				logger.info("LOGIN SUCCESS (" + userVO.getUserId() + ")");
				resultMap.put("pwCheckResult", 1);
				resultMap.put("message", "Check-SUCCESS");

				modifyService.userModify(userVO);

				return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
			} else {
				// 비밀번호 불일치
				logger.info("LOGIN FAILED (" + userVO.getUserId() + ")");
				resultMap.put("pwCheckResult", 0);
				resultMap.put("message", "PW-WRONG");
				return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.info("MODIFY PROCESS - ERROR");
			resultMap.put("message", "ERROR");
			return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		}
	}

	// 비밀번호 변경 폼 출력
	@RequestMapping(value = "/changePwForm/{userId}", method = RequestMethod.GET)
	public String changePwFormGET(Model model, HttpSession session, HttpServletRequest request,
			@PathVariable String userId) {
		logger.info("CHANGE FORM LOADING... ");
		logger.info("userId= " + userId);

		UserVO userVO = new UserVO();
		userVO.setUserId(userId);
		userVO = modifyService.userDetail(userVO);

		model.addAttribute("userInfo", userVO);

		return "/user/changePwForm";
	}

	// 비밀번호 변경 구현
	@RequestMapping(value = "/changePwForm", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> changePwPOST(@RequestParam String newPw, @ModelAttribute UserVO userVO,
			LoginDTO loginDTO) {
		logger.info("CHANGE FORM LOADING... ");
		logger.info("INPUT DATA= " + userVO.toString());

		Map<String, Object> resultMap = new HashMap<String, Object>();
		UserVO pwCheckUserVO = new UserVO();
		pwCheckUserVO.setUserPw(userVO.getUserPw());
		String orgPass = userVO.getUserPw();
		try {
			SHA256 sha = SHA256.getInsatnce();
			String shaPass = sha.getSha256(orgPass.getBytes());
			String dbPass = modifyService.userDetail(userVO).getUserPw();
			boolean pwCheckResult = BCrypt.checkpw(shaPass, dbPass);
			if (pwCheckResult) {
				// 비밀번호 일치
				logger.info("LOGIN SUCCESS (" + userVO.getUserId() + ")");
				resultMap.put("pwCheckResult", 1);
				resultMap.put("message", "Check-SUCCESS");
				userVO.setUserPw(newPw);

				// 새 비밀번호 암호화
				int pwEncryptionResult = 0;
				String orgPass1 = userVO.getUserPw();

				String shaPass1 = "";
				try {
					SHA256 sha1 = SHA256.getInsatnce();
					shaPass1 = sha1.getSha256(orgPass1.getBytes());
					String bcPass1 = BCrypt.hashpw(shaPass1, BCrypt.gensalt());
					userVO.setUserPw(bcPass1);
					pwEncryptionResult = modifyService.pwEncryptionExec(userVO);

					logger.info("PW ENCRYPTION RESULT= " + pwEncryptionResult);

				} catch (Exception e) {
					e.printStackTrace();
				}

				// 새 비밀번호로 변경
				modifyService.changePw(userVO);

				return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
			} else {
				// 비밀번호 불일치
				logger.info("LOGIN FAILED (" + userVO.getUserId() + ")");
				resultMap.put("pwCheckResult", 0);
				resultMap.put("message", "PW-WRONG");
				return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.info("CHANGEPW PROCESS - ERROR");
			resultMap.put("message", "ERROR");
			return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		}
	}

	// 회원탈퇴 폼 출력
	@RequestMapping(value = "/userLeaveForm", method = RequestMethod.GET)
	public String userLeaveFormGET(Model model, HttpSession session,
			HttpServletRequest request) {
		logger.info("USERLEAVE FORM LOADING... ");

		UserVO sessionVO = (UserVO) session.getAttribute("login");
		logger.info("userId= " + sessionVO.getUserId());
		
		UserVO userVO = new UserVO();
		userVO.setUserId(sessionVO.getUserId());
		
		userVO = modifyService.userDetail(sessionVO);

		model.addAttribute("userInfo", userVO);

		logger.info("UserVO = " + userVO);
		return "/user/userLeaveForm";
	}

	// 회원 탈퇴 구현
	@RequestMapping(value = "/userLeaveForm", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> userLeaveForm(HttpSession session, 
			HttpServletResponse response) {
		logger.info("LEAVE LOADING... ");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		UserVO sessionVO = (UserVO) session.getAttribute("login");

		try {
				logger.info("CHECK SUCCESS (" + sessionVO.getUserId() + ")");
				logger.info("BYE~ BYE~");
				
				resultMap.put("mileageCheckResult", 1);
				resultMap.put("message", "CHECK-SUCCESS");
				
				modifyService.userLeave(sessionVO);

				return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		
				
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("USERLEAVE PROCESS - ERROR");
			resultMap.put("message", "ERROR");
			return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		}
	}
	
}
