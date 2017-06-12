package com.gigabox.user.persistence;

import com.gigabox.user.vo.UserVO;

public interface JoinDAO {
<<<<<<< HEAD
	
=======
>>>>>>> 940a3cfdef42d0d9865f290c8bd3f3209f5ecca3
	/*
	 * 회원가입 절차는 
	 * 1) 약관 동의
	 * 2) 회원가입 정보 입력
	 * 3) 이메일 인증
	 */
	
	public int userJoin(UserVO userVO);
	
	public int idDuplicationCheck(String id);
	
	public int userJoinAuthConfirm(UserVO userVO);
<<<<<<< HEAD
	
=======
>>>>>>> 940a3cfdef42d0d9865f290c8bd3f3209f5ecca3
}
