package com.gigabox.cc.persistence;

import java.util.List;

import com.gigabox.cc.vo.InquirySearchCriteria;
import com.gigabox.cc.vo.InquiryVO;

public interface InquiryDAO {

	public List<InquiryVO> inquiryList(InquirySearchCriteria isc);

	public int inquiryListCount(InquirySearchCriteria isc);

	public InquiryVO inquiryDetailQ(InquiryVO inquiryVO);

	public InquiryVO inquiryDetailA(InquiryVO inquiryVO);

	public int inquiryInsertA(InquiryVO inquiryVO);

	public int inquiryUpdateA(InquiryVO inquiryVO);

	public int inquiryDeleteA(InquiryVO inquiryVO);

	// 읽기 페이지
	public InquiryVO inquiryRead(InquiryVO ivo);

	// 글쓰기
	public int inquiryInsert(InquiryVO ivo);

	// 수정
	public int inquiryUpdate(InquiryVO ivo);

	// 삭제
	public int inquiryDelete(int inquiryNumber);
}
