package com.gigabox.user.service;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.vo.UserVO;

public interface LoginService {
	
	public UserVO login(LoginDTO loginDTO) throws Exception;
	
	public int idCheck(UserVO userVO);

}
