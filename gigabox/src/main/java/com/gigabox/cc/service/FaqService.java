package com.gigabox.cc.service;

import java.util.List;

import com.gigabox.cc.vo.FaqSearchCriteria;
import com.gigabox.cc.vo.FaqVO;

public interface FaqService {
	// public List<FaqVO> faqList() throws Exception;
	public List<FaqVO> faqList(FaqSearchCriteria fsc);

	public int faqListCount(FaqSearchCriteria fsc);
}
