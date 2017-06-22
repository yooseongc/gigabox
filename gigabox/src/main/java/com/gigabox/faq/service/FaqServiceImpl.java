package com.gigabox.faq.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.faq.persistence.FaqDAO;
import com.gigabox.faq.vo.FaqSearchCriteria;
import com.gigabox.faq.vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {

	@Inject
	private FaqDAO faqDao;
	
	/*@Override
	public List<FaqVO> faqList() throws Exception {
		// TODO Auto-generated method stub
		return faqDao.faqList();
	}*/
	@Override
	public List<FaqVO> faqList(FaqSearchCriteria fsc) {
		return faqDao.faqList(fsc);
	}

	@Override
	public int faqListCount(FaqSearchCriteria fsc) {
		return faqDao.faqListCount(fsc);
	}
}
