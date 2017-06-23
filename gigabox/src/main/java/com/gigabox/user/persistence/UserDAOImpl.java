package com.gigabox.user.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.gigabox.mapper.UserMapper";

	@Override
	public UserVO userDetail(UserVO userVO) {
		return sqlSession.selectOne(namespace + ".userDetail", userVO);
	}

}
