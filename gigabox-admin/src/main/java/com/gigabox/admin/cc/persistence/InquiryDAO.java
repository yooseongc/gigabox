package com.gigabox.admin.cc.persistence;

import java.util.List;

import com.gigabox.admin.cc.vo.InquirySearchCriteria;
import com.gigabox.admin.cc.vo.InquiryVO;

public interface InquiryDAO {

	public List<InquiryVO> inquiryList(InquirySearchCriteria isc);
	
	public int inquiryListCount(InquirySearchCriteria isc);
	
	public InquiryVO inquiryDetailQ(InquiryVO inquiryVO);
	
	public InquiryVO inquiryDetailA(InquiryVO inquiryVO);
	
	public int inquiryInsertA(InquiryVO inquiryVO);
	
	public int inquiryUpdateA(InquiryVO inquiryVO);
	
	public int inquiryDeleteA(InquiryVO inquiryVO);
	
}
