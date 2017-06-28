package com.gigabox.user.persistence;

import com.gigabox.user.vo.UserVO;

public interface FindInfoDAO {
	
	//아이디 찾기
	public int findUserId(UserVO userVO);

	//비밀번호 찾기
	public int findUserPw(UserVO userVO);
}
