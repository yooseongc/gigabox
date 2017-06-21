package com.gigabox.inquiry.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gigabox.inquiry.persistence.InquiryDAO;
import com.gigabox.inquiry.vo.InquiryVO;

@Service
@Transactional
public class InquiryServiceImpl implements InquiryService {

	@Inject
	private InquiryDAO inquiryDao;

	@Override
	public List<InquiryVO> inquiryList() throws Exception {
		// TODO Auto-generated method stub
		return inquiryDao.inquiryList();
	}

	@Override
	public int inquiryInsert(InquiryVO ivo) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDao.inquiryInsert(ivo);

	}

	@Override
	public List<InquiryVO> inquiryRead(InquiryVO ivo) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDao.inquiryRead(ivo);
	}

	@Override
	public int inquiryUpdate(InquiryVO ivo) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDao.inquiryUpdate(ivo);
	}

	@Override
	public int inquiryDelete(Integer inquiryNumber) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDao.inquiryDelete(inquiryNumber);
	}

}
