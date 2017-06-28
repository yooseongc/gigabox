package com.gigabox.user.service;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.vo.UserVO;

public interface LoginService {
	
	//로그인
	public UserVO login(LoginDTO loginDTO) throws Exception;
	
	//가입 아디디 체크
	public int idCheck(UserVO userVO);

	//탈퇴 여부 체크
	public int statusCheck(UserVO userVO);
}
