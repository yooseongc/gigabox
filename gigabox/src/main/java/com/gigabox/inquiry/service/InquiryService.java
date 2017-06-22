package com.gigabox.inquiry.service;

import java.util.List;

import com.gigabox.inquiry.vo.InquiryVO;

public interface InquiryService {

	public List<InquiryVO> inquiryList() throws Exception;

	public int inquiryInsert(InquiryVO ivo) throws Exception;

	public InquiryVO inquiryRead(InquiryVO ivo) throws Exception;

	public int inquiryUpdate(InquiryVO ivo) throws Exception;

	public int inquiryDelete(Integer inquiryNumber) throws Exception;
}
