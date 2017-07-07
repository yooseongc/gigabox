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

	// 읽기 페이지
	@Override
	public InquiryVO inquiryRead(InquiryVO ivo) {
		return inquiryDao.inquiryRead(ivo);
	}

	// 글쓰기
	@Override
	public int inquiryInsert(InquiryVO ivo) {
		return inquiryDao.inquiryInsert(ivo);
	}

	// 수정
	@Override
	public int inquiryUpdate(InquiryVO ivo) {
		int result = 0;
		result = inquiryDao.inquiryUpdate(ivo);
		return result;
	}

	// 삭제
	@Override
	public int inquiryDelete(InquiryVO inquiryNumber) {
		return inquiryDao.inquiryDelete(inquiryNumber);
		 
	}


	// 관리자쪽
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

}

/*
 * @Override public List<InquiryVO> inquiryList() throws Exception { // TODO
 * Auto-generated method stub return inquiryDao.inquiryList(); }
 */