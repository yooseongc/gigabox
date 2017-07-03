package com.gigabox.user.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.user.vo.UserVO;

@Repository
public class FindInfoDAOImpl implements FindInfoDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace =
			"com.gigabox.mapper.FindInfoMapper";
	
	//아이디 찾기
	@Override
	public UserVO findUserId(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".findUserId", userVO);
	}

	//비밀번호 찾기
	@Override
	public UserVO findUserPw(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".findUserPw", userVO);
	}

	//비밀번호 변경
	@Override
	public int findChangePw(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".findChangePw", userVO);
	}

	//새 비밀번호 암호화
	@Override
	public int pwEncryptionExec(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".pwEncryptionExec", userVO);
	}

}
