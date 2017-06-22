package com.gigabox.faq.service;

import java.util.List;

import com.gigabox.faq.vo.FaqSearchCriteria;
import com.gigabox.faq.vo.FaqVO;

public interface FaqService {
	// public List<FaqVO> faqList() throws Exception;
	public List<FaqVO> faqList(FaqSearchCriteria fsc);

	public int faqListCount(FaqSearchCriteria fsc);
}
