package com.gigabox.user.service;

import com.gigabox.user.vo.UserVO;

public interface FindInfoService {

	//아이디 찾기
	public UserVO findUserId(UserVO userVO);
	
	//비밀번호 찾기
	public int findUserPw(UserVO userVO);
}
