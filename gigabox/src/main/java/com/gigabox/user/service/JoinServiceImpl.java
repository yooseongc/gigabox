package com.gigabox.user.service;

import javax.inject.Inject;

<<<<<<< HEAD
import org.springframework.stereotype.Service;

import com.gigabox.user.persistence.JoinDAO;
import com.gigabox.user.vo.UserVO;

@Service
public class JoinServiceImpl implements JoinService {
=======
import com.gigabox.user.persistence.JoinDAO;
import com.gigabox.user.vo.UserVO;

public class JoinServiceImpl implements JoinService{
>>>>>>> 940a3cfdef42d0d9865f290c8bd3f3209f5ecca3

	@Inject
	JoinDAO joinDAO;
	
	@Override
	public int userJoin(UserVO userVO) {
<<<<<<< HEAD
=======
		// TODO Auto-generated method stub
>>>>>>> 940a3cfdef42d0d9865f290c8bd3f3209f5ecca3
		return joinDAO.userJoin(userVO);
	}

	@Override
	public int idDuplicationCheck(String id) {
<<<<<<< HEAD
=======
		// TODO Auto-generated method stub
>>>>>>> 940a3cfdef42d0d9865f290c8bd3f3209f5ecca3
		return joinDAO.idDuplicationCheck(id);
	}

	@Override
	public int userJoinAuthConfirm(UserVO userVO) {
<<<<<<< HEAD
=======
		// TODO Auto-generated method stub
>>>>>>> 940a3cfdef42d0d9865f290c8bd3f3209f5ecca3
		return joinDAO.userJoinAuthConfirm(userVO);
	}

}
