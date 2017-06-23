package com.gigabox.user.persistence;

import com.gigabox.user.vo.UserVO;

public interface JoinDAO {
	
	/*
	 * 구성 
	 * 1) 회원가입
	 * 2) 중복검사
	 * 3) 이메일 인증
	 * 4) 암호화
	 */
	
	public int userJoin(UserVO userVO);
	
	public int idDuplicationCheck(String id);
	
	public int userJoinAuthConfirm(UserVO userVO);
	
	public int pwEncryptionExec(UserVO userVO);
	
	public int emailAuthConfirm(String enc);
}
