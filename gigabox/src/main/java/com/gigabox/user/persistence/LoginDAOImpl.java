package com.gigabox.user.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.user.dto.LoginDTO;
import com.gigabox.user.vo.UserVO;

@Repository
public class LoginDAOImpl implements LoginDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = 
			"com.gigabox.mapper.LoginMapper";
	
	//로그인
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".login", loginDTO);
	}

	//가입 아이디 체크
	@Override
	public int idCheck(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".idCheck", userVO);
	}

	//탈퇴 여부 체크
	@Override
	public int statusCheck(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".statusCheck", userVO);
	}

}
