package com.gigabox.inquiry.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.inquiry.vo.InquirySearchCriteria;
import com.gigabox.inquiry.vo.InquiryVO;

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
}
/*
 * @Override public List<InquiryVO> inquiryList() throws Exception { // TODO
 * Auto-generated method stub return sqlSession.selectList(namespace +
 * ".inquiryList"); }
 * 
 * @Override public int inquiryInsert(InquiryVO ivo) throws Exception { // TODO
 * Auto-generated method stub return sqlSession.insert(namespace + ".create",
 * ivo); }
 * 
 * @Override public InquiryVO inquiryRead(InquiryVO ivo) throws Exception { //
 * TODO Auto-generated method stub return sqlSession.selectOne(namespace +
 * ".read", ivo); }
 * 
 * @Override public int inquiryUpdate(InquiryVO ivo) throws Exception { // TODO
 * Auto-generated method stub return sqlSession.update(namespace + ".update",
 * ivo); }
 * 
 * @Override public int inquiryDelete(Integer inquiryNumber) throws Exception {
 * // TODO Auto-generated method stub return sqlSession.delete(namespace +
 * ".delete", inquiryNumber); }
 */
