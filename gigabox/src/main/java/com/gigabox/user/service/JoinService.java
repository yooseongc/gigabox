package com.gigabox.user.service;

import com.gigabox.user.vo.UserVO;

public interface JoinService {

	//회원가입
	public int userJoin(UserVO userVO);
	
	//아이디 중복확인
	public int idDuplicationCheck(String id);
	
	//약관동의
	public int userJoinAuthConfirm(UserVO userVO);
	
	//비밀번호 암호화
	public int pwEncryptionExec(UserVO userVO);
	
	//이메일인증(발송)
	public int emailAuthConfirm(String enc);
	
}
