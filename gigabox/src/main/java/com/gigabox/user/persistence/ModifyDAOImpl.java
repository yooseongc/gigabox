package com.gigabox.user.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.user.vo.UserVO;

@Repository
public class ModifyDAOImpl implements ModifyDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.gigabox.mapper.ModifyMapper";

	//회원상세보기
	@Override
	public UserVO userDetail(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".userDetail", userVO);
	}

	//회원정보수정
	@Override
	public int userModify(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".userModify", userVO);
	}

	//비밀번호 변경
	@Override
	public int changePw(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".changePw", userVO);
	}

}
