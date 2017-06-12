package com.gigabox.login.dao;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.vo.UserVO;

public interface LoginDAO {
	public UserVO login(LoginDTO dto) throws Exception;
}
