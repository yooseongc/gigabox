package com.gigabox.user.service;

import com.gigabox.user.vo.UserVO;

public interface ModifyService {
	
	public UserVO userDetail(UserVO userVO);
	
	public int userModify(UserVO userVO);

	public int changePw(UserVO userVO);
}
