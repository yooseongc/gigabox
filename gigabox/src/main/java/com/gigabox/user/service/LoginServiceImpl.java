package com.gigabox.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.persistence.LoginDAO;
import com.gigabox.user.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Inject
	private LoginDAO loginDAO;
	
	//로그인
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.login(loginDTO);
	}

	//가입 아이디 체크
	@Override
	public int idCheck(UserVO userVO) {
		// TODO Auto-generated method stub
		return loginDAO.idCheck(userVO);
	}

	//탈퇴 여부 체크
	@Override
	public int statusCheck(UserVO userVO) {
		// TODO Auto-generated method stub
		return loginDAO.statusCheck(userVO);
	}

}
