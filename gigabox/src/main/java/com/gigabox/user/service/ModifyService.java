package com.gigabox.user.service;

import com.gigabox.user.vo.UserVO;

public interface ModifyService {
	
	//회원 상세정보
	public UserVO userDetail(UserVO userVO);
	
	//회원정보 수정
	public int userModify(UserVO userVO);

	//회원 비밀번호 변경
	public int changePw(UserVO userVO);
	
	//새 비밀번호 암호화
	public int pwEncryptionExec(UserVO userVO);
}
