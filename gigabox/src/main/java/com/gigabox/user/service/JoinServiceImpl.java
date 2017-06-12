package com.gigabox.user.service;

import javax.inject.Inject;

import com.gigabox.user.persistence.JoinDAO;
import com.gigabox.user.vo.UserVO;

public class JoinServiceImpl implements JoinService{

	@Inject
	JoinDAO joinDAO;
	
	@Override
	public int userJoin(UserVO userVO) {
		// TODO Auto-generated method stub
		return joinDAO.userJoin(userVO);
	}

	@Override
	public int idDuplicationCheck(String id) {
		// TODO Auto-generated method stub
		return joinDAO.idDuplicationCheck(id);
	}

	@Override
	public int userJoinAuthConfirm(UserVO userVO) {
		// TODO Auto-generated method stub
		return joinDAO.userJoinAuthConfirm(userVO);
	}

}
