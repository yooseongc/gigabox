package com.gigabox.login.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.vo.UserVO;

public class LoginDAOImpl implements LoginDAO{

	@Inject
	private SqlSession session;
	
	private static final String namespace=
			"com.gigabox.mapper.UserMapper";
		
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".login", dto);
	}

}
