package com.gigabox.faq.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.gigabox.faq.persistence.FaqDAO;
import com.gigabox.faq.vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {

	@Inject
	private FaqDAO faqDao;
	
	@Override
	public List<FaqVO> faqList() throws Exception {
		return faqDao.faqList();
	}

=======
import com.gigabox.faq.dao.FaqDao;
import com.gigabox.faq.vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService{
	
	@Inject
	private FaqDao faqDao;

	@Override
	public List<FaqVO> faqList() throws Exception {
		// TODO Auto-generated method stub
		return faqDao.faqList();
	}
>>>>>>> 940a3cfdef42d0d9865f290c8bd3f3209f5ecca3
}
