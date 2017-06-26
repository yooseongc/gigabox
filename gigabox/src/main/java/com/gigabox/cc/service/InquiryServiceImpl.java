package com.gigabox.cc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gigabox.cc.persistence.InquiryDAO;
import com.gigabox.cc.vo.InquirySearchCriteria;
import com.gigabox.cc.vo.InquiryVO;

@Service
@Transactional
public class InquiryServiceImpl implements InquiryService {

	@Inject
	private InquiryDAO inquiryDao;

	@Override
	public List<InquiryVO> inquiryList(InquirySearchCriteria isc) {
		return inquiryDao.inquiryList(isc);
	}

	@Override
	public int inquiryListCount(InquirySearchCriteria isc) {
		return inquiryDao.inquiryListCount(isc);
	}

	@Override
	public InquiryVO inquiryDetailQ(InquiryVO inquiryVO) {
		return inquiryDao.inquiryDetailQ(inquiryVO);
	}

	@Override
	public InquiryVO inquiryDetailA(InquiryVO inquiryVO) {
		return inquiryDao.inquiryDetailA(inquiryVO);
	}

	@Override
	public int inquiryInsertA(InquiryVO inquiryVO) {
		return inquiryDao.inquiryInsertA(inquiryVO);
	}

	@Override
	public int inquiryUpdateA(InquiryVO inquiryVO) {
		return inquiryDao.inquiryUpdateA(inquiryVO);
	}

	@Override
	public int inquiryDeleteA(InquiryVO inquiryVO) {
		return inquiryDao.inquiryDeleteA(inquiryVO);
	}

	//글쓰기
	@Override
	public int inquiryInsert(InquiryVO ivo) throws Exception {
		return inquiryDao.inquiryInsert(ivo);
	}

}
/*
 * @Override public List<InquiryVO> inquiryList() throws Exception { // TODO
 * Auto-generated method stub return inquiryDao.inquiryList(); }
 * 
 *
 * @Override public InquiryVO inquiryRead(InquiryVO ivo) throws Exception { //
 * TODO Auto-generated method stub return inquiryDao.inquiryRead(ivo); }
 * 
 * @Override public int inquiryUpdate(InquiryVO ivo) throws Exception { // TODO
 * Auto-generated method stub return inquiryDao.inquiryUpdate(ivo); }
 * 
 * @Override public int inquiryDelete(Integer inquiryNumber) throws Exception {
 * // TODO Auto-generated method stub return
 * inquiryDao.inquiryDelete(inquiryNumber); }
 */