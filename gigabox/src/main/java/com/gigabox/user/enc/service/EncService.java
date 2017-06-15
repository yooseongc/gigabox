package com.gigabox.user.enc.service;

import com.gigabox.user.vo.UserVO;

public interface EncService {

	public int idCheck(UserVO userVO);

	public int pwEncryptionCheck(UserVO userVO);

	public int pwEncryptionExec(UserVO userVO);
}
