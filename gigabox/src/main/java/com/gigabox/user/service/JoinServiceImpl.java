package com.gigabox.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.user.persistence.JoinDAO;
import com.gigabox.user.vo.UserVO;

@Service
public class JoinServiceImpl implements JoinService {

	@Inject
	JoinDAO joinDAO;
	
	@Override
	public int userJoin(UserVO userVO) {
		return joinDAO.userJoin(userVO);
	}

	@Override
	public int idDuplicationCheck(String id) {
		return joinDAO.idDuplicationCheck(id);
	}

	@Override
	public int userJoinAuthConfirm(UserVO userVO) {
		return joinDAO.userJoinAuthConfirm(userVO);
	}

}
