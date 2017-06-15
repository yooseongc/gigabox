package com.gigabox.user.enc.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.user.enc.persistence.EncDAO;
import com.gigabox.user.vo.UserVO;

@Service
public class EncServiceImpl implements EncService{

	@Inject
	private EncDAO encDAO;
	
	@Override
	public int idCheck(UserVO userVO) {
		return encDAO.idCheck(userVO);
	}
	
	@Override
	public int pwEncryptionCheck(UserVO userVO) {
		return encDAO.pwEncryptionCheck(userVO);
	}

	@Override
	public int pwEncryptionExec(UserVO userVO) {
		return encDAO.pwEncryptionExec(userVO);
	}
}
