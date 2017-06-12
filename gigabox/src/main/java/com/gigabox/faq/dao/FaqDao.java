package com.gigabox.faq.dao;

import java.util.List;

import com.gigabox.faq.vo.FaqVO;

public interface FaqDao {
	public List<FaqVO> faqList();
	
	public void insertFaq(FaqVO vo);
}
