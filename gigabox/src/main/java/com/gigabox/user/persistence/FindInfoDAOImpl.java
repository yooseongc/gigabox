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
	public int findUserId(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".findUserId", userVO);
	}

	//비밀번호 찾기
	@Override
	public int findUserPw(UserVO userVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
