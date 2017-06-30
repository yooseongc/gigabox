package com.gigabox.user.persistence;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.vo.UserVO;

public interface LoginDAO {
	
	//로그인 구현
	public UserVO login(LoginDTO loginDTO) throws Exception;
	
	//가입된 아이디 체크
	public int idCheck(UserVO userVO);
	
	//탈퇴여부 체크
	public int statusCheck(UserVO userVO);
	
}
