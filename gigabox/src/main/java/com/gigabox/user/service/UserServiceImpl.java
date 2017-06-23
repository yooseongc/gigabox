package com.gigabox.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.user.persistence.UserDAO;
import com.gigabox.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO userDAO;
	
	@Override
	public UserVO userDetail(UserVO userVO) {
		return userDAO.userDetail(userVO);
	}

}
