package com.gigabox.cc.service;

import java.util.List;

import com.gigabox.cc.vo.InquirySearchCriteria;
import com.gigabox.cc.vo.InquiryVO;

public interface InquiryService {

public List<InquiryVO> inquiryList(InquirySearchCriteria isc);
	
	public int inquiryListCount(InquirySearchCriteria isc);
	
	public InquiryVO inquiryDetailQ(InquiryVO inquiryVO);
	
	public InquiryVO inquiryDetailA(InquiryVO inquiryVO);
	
	public int inquiryInsertA(InquiryVO inquiryVO);
	
	public int inquiryUpdateA(InquiryVO inquiryVO);
	
	public int inquiryDeleteA(InquiryVO inquiryVO);

	//public List<InquiryVO> inquiryList() throws Exception;
	//public int inquiryInsert(InquiryVO ivo) throws Exception;
	//public InquiryVO inquiryRead(InquiryVO ivo) throws Exception;
	//public int inquiryUpdate(InquiryVO ivo) throws Exception;
	//public int inquiryDelete(Integer inquiryNumber) throws Exception;
}
