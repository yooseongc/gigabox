package com.gigabox.review.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.review.vo.ReviewVO;
import com.gigabox.review.vo.RownumVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.gigabox.mapper.ReviewMapper";
	
	@Override
	public List<ReviewVO> reviewList(RownumVO rownumVO) {
		return sqlSession.selectList(namespace + ".reviewList", rownumVO);
	}

	@Override
	public int reviewListCount(int movieNumber) {
		return sqlSession.selectOne(namespace + ".reviewListCount", movieNumber);
	}
	
	@Override
	public int reviewInsert(ReviewVO reviewVo) {
		return sqlSession.insert(namespace + ".reviewInsert", reviewVo);
	}

	@Override
	public int reviewUpdate(ReviewVO reviewVo) {
		return sqlSession.update(namespace + ".reviewUpdate", reviewVo);
	}

	@Override
	public int reviewDelete(ReviewVO reviewVO) {
		return sqlSession.delete(namespace + ".reviewDelete", reviewVO);
	}

	@Override
	public int reviewRatingAverage(int movieNumber) {
		return sqlSession.selectOne(namespace + ".reviewRatingAverage", movieNumber);
	}


}
