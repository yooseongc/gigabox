package com.gigabox.user.dao;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.vo.UserVO;

public interface UserDAO {
	public UserVO login(LoginDTO dto) throws Exception;
}
