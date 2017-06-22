package com.gigabox.review.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.review.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.gigabox.mapper.REVIEWMapper";

	@Override
	public List<ReviewVO> list(int mno) throws Exception {
		return session.selectList(namespace + ".list", mno);
	}

	@Override
	public void create(ReviewVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public void update(ReviewVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int rno) throws Exception {
		session.delete(namespace + ".delete", rno);
	}

}
