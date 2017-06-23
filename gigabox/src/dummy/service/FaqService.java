package com.gigabox.faq.service;

import java.util.List;

import com.gigabox.faq.vo.FaqVO;

public interface FaqService {
	
	public List<FaqVO> faqList() throws Exception;
	
}
