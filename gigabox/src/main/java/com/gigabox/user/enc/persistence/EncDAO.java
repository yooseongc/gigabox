package com.gigabox.user.enc.persistence;

import com.gigabox.user.vo.UserVO;

public interface EncDAO {

	public int idCheck(UserVO userVO);

	public int pwEncryptionCheck(UserVO userVO);

	public int pwEncryptionExec(UserVO userVO);
}
