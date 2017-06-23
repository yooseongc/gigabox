package com.gigabox.cc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.cc.vo.FaqSearchCriteria;
import com.gigabox.cc.vo.FaqVO;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.gigabox.mapper.FaqMapper";

	/*
	 * @Override public List<FaqVO> faqList() { // TODO Auto-generated method
	 * stub return sqlSession.selectList(namespace + ".faqList"); }
	 */

	@Override
	public List<FaqVO> faqList(FaqSearchCriteria fsc) {
		return sqlSession.selectList(namespace + ".faqList", fsc);
	}

	@Override
	public int faqListCount(FaqSearchCriteria fsc) {
		return sqlSession.selectOne(namespace + ".faqListCount", fsc);
	}
}
