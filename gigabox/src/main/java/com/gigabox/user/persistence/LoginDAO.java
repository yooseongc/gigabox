package com.gigabox.user.persistence;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.vo.UserVO;

public interface LoginDAO {
	
	public UserVO login(LoginDTO loginDTO) throws Exception;
	
	public int idCheck(UserVO userVO);

}
