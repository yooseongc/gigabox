package com.gigabox.user.service;

import com.gigabox.user.vo.UserVO;

public interface JoinService {
	public int userJoin(UserVO userVO);

	public int idDuplicationCheck(String id);

	public int userJoinAuthConfirm(UserVO userVO);
}
