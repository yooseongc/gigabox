package com.gigabox.user.service;

import com.gigabox.user.vo.UserVO;

public interface FindInfoService {

	//아이디 찾기
	public UserVO findUserId(UserVO userVO);
	
	//비밀번호 찾기
	public UserVO findUserPw(UserVO userVO);
	
	//비밀번호 변경
	public int findChangePw(UserVO userVO);
	
	//새 비밀번호 암호화
	public int pwEncryptionExec(UserVO userVO); 
}
