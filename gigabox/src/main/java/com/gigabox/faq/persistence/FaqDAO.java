package com.gigabox.faq.persistence;

import java.util.List;

import com.gigabox.faq.vo.FaqVO;


public interface FaqDAO {
	
	public List<FaqVO> faqList();
	
}