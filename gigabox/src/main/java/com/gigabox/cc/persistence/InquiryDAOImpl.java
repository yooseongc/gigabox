package com.gigabox.cc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.cc.vo.InquirySearchCriteria;
import com.gigabox.cc.vo.InquiryVO;

@Repository
public class InquiryDAOImpl implements InquiryDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.gigabox.mapper.INQUIRYMapper";

	@Override
	public List<InquiryVO> inquiryList(InquirySearchCriteria isc) {
		return sqlSession.selectList(namespace + ".inquiryList", isc);
	}

	@Override
	public int inquiryListCount(InquirySearchCriteria isc) {
		return sqlSession.selectOne(namespace + ".inquiryListCount", isc);
	}

	// 읽기 페이지
	@Override
	public InquiryVO inquiryRead(InquiryVO ivo) {
		return sqlSession.selectOne(namespace + ".inquiryRead", ivo);
	}

	@Override
	public InquiryVO inquiryDetailQ(InquiryVO inquiryVO) {
		return sqlSession.selectOne(namespace + ".inquiryDetailQ", inquiryVO);
	}

	@Override
	public InquiryVO inquiryDetailA(InquiryVO inquiryVO) {
		return sqlSession.selectOne(namespace + ".inquiryDetailA", inquiryVO);
	}

	@Override
	public int inquiryInsertA(InquiryVO inquiryVO) {
		return sqlSession.insert(namespace + ".inquiryInsertA", inquiryVO);
	}

	@Override
	public int inquiryUpdateA(InquiryVO inquiryVO) {
		return sqlSession.update(namespace + ".inquiryUpdateA", inquiryVO);
	}

	@Override
	public int inquiryDeleteA(InquiryVO inquiryVO) {
		return sqlSession.delete(namespace + ".inquiryDeleteA", inquiryVO);
	}

	// 글쓰기
	@Override
	public int inquiryInsert(InquiryVO ivo) {
		return sqlSession.insert(namespace + ".inquiryWrite", ivo);
	}

	// 수정
	@Override
	public int inquiryUpdate(InquiryVO ivo) {
		return sqlSession.update(namespace + ".inquiryUpdate", ivo);
	}

	// 삭제
	@Override
	public int inquiryDelete(InquiryVO inquiryNumber) {
		return sqlSession.update(namespace + ".inquiryDelete", inquiryNumber);
	}

}

