package com.gigabox.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gigabox.faq.vo.FaqVO;

@Repository
public class FaqDaoImpl implements FaqDao{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace=
			"com.gigabox.mapper.FAQMapper";
	
	@Override
	public List<FaqVO> faqList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".faqList");
	}

	@Override
	public void insertFaq(FaqVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertFaq", vo);
	}
}
