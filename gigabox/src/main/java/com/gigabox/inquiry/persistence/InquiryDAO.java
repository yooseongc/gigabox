package com.gigabox.inquiry.persistence;

import java.util.List;

import com.gigabox.inquiry.vo.InquirySearchCriteria;
import com.gigabox.inquiry.vo.InquiryVO;

public interface InquiryDAO {
	//public List<InquiryVO> inquiryList() throws Exception;

	//public int inquiryInsert(InquiryVO ivo) throws Exception;

	//public InquiryVO inquiryRead(InquiryVO ivo) throws Exception;

	//public int inquiryUpdate(InquiryVO ivo) throws Exception;
	
	//public int inquiryDelete(Integer inquiryNumber) throws Exception;
	
public List<InquiryVO> inquiryList(InquirySearchCriteria isc);
	
	public int inquiryListCount(InquirySearchCriteria isc);
	
	public InquiryVO inquiryDetailQ(InquiryVO inquiryVO);
	
	public InquiryVO inquiryDetailA(InquiryVO inquiryVO);
	
	public int inquiryInsertA(InquiryVO inquiryVO);
	
	public int inquiryUpdateA(InquiryVO inquiryVO);
	
	public int inquiryDeleteA(InquiryVO inquiryVO);
}
