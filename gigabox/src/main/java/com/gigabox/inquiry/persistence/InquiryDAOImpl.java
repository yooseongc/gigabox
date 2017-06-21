package com.gigabox.inquiry.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.inquiry.vo.InquiryVO;

@Repository
public class InquiryDAOImpl implements InquiryDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.gigabox.mapper.INQUIRYMapper";

	// 글 목록 구현
	@Override
	public List<InquiryVO> inquiryList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".inquiryList");
	}

	// 글 입력
	@Override
	public int inquiryInsert(InquiryVO ivo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".create", ivo);
	}

	// 글 읽기???? 일단 맹글기
	@Override
	public List<InquiryVO> inquiryRead(InquiryVO ivo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".read", ivo);
	}

	// 글 수정
	@Override
	public int inquiryUpdate(InquiryVO ivo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".update", ivo);
	}

	// 삭제
	@Override
	public int inquiryDelete(Integer inquiryNumber) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + ".delete", inquiryNumber);
	}

}
