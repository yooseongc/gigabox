package com.gigabox.faq.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.faq.vo.FaqVO;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.gigabox.mapper.FAQMapper";

	@Override
	public List<FaqVO> faqList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".faqList");
	}
}
