package com.gigabox.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.user.persistence.FindInfoDAO;
import com.gigabox.user.vo.UserVO;

@Service
public class FindInfoServiceImpl implements FindInfoService{

	@Inject
	private FindInfoDAO findInfoDAO;

	//아이디 찾기
	@Override
	public UserVO findUserId(UserVO userVO) {
		// TODO Auto-generated method stub
		return findInfoDAO.findUserId(userVO);
	}

	//비밀번호 찾기
	@Override
	public UserVO findUserPw(UserVO userVO) {
		// TODO Auto-generated method stub
		return findInfoDAO.findUserPw(userVO);
	}

	//비밀번호 변경
	@Override
	public int findChangePw(UserVO userVO) {
		// TODO Auto-generated method stub
		return findInfoDAO.findChangePw(userVO);
	}

	//새 비밀번호 암호화
	@Override
	public int pwEncryptionExec(UserVO userVO) {
		// TODO Auto-generated method stub
		return findInfoDAO.pwEncryptionExec(userVO);
	}
	
}
