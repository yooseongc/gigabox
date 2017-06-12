package com.gigabox.user.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
<<<<<<< HEAD
import org.springframework.stereotype.Repository;

import com.gigabox.user.vo.UserVO;

@Repository
public class JoinDAOImpl implements JoinDAO {
=======

import com.gigabox.user.vo.UserVO;

public class JoinDAOImpl implements JoinDAO{
>>>>>>> 940a3cfdef42d0d9865f290c8bd3f3209f5ecca3

	@Inject
	private SqlSession sqlSession;
	
<<<<<<< HEAD
	private static final String namespace = 
			"com.gigabox.mapper.JoinMapper";
	
	
=======
	private static final String namespace =
			"com.gigabox.mapper.JoinMapper";
	
>>>>>>> 940a3cfdef42d0d9865f290c8bd3f3209f5ecca3
	@Override
	public int userJoin(UserVO userVO) {
		int result = sqlSession.insert(namespace + ".userJoinInsert", userVO);
		return result;
	}

	/**
	 * ID 중복 체크하는 메소드<br>
	 * @param 중복 체크할 ID
	 * @return 회원 고유 number
	 */
	@Override
	public int idDuplicationCheck(String id) {
		int result = sqlSession.selectOne(namespace + ".idDuplicationCheckSelect", id);
		return result;
	}

	@Override
	public int userJoinAuthConfirm(UserVO userVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
