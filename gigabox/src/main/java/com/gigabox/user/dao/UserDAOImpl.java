package com.gigabox.user.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

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
