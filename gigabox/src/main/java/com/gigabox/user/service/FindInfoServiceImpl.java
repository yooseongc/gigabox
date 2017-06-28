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
	public int findUserId(UserVO userVO) {
		// TODO Auto-generated method stub
		return findInfoDAO.findUserId(userVO);
	}

	//비밀번호 찾기
	@Override
	public int findUserPw(UserVO userVO) {
		// TODO Auto-generated method stub
		return findInfoDAO.findUserPw(userVO);
	}
	
}
