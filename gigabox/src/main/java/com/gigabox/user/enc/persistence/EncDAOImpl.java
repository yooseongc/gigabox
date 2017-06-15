package com.gigabox.user.enc.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.user.vo.UserVO;

@Repository
public class EncDAOImpl implements EncDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.gigabox.admin.mapper.AdminMapper";

	@Override
	public int idCheck(UserVO userVO) {
		return sqlSession.selectOne(namespace + ".idCheck", userVO);
	}

	@Override
	public int pwEncryptionCheck(UserVO userVO) {
		return sqlSession.selectOne(namespace + ".pwEncryptionCheck", userVO);
	}

	@Override
	public int pwEncryptionExec(UserVO userVO) {
		return sqlSession.update(namespace + ".pwEncryptionExec", userVO);
	}
}
