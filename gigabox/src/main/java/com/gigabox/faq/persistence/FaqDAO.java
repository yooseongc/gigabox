package com.gigabox.faq.persistence;

import java.util.List;

import com.gigabox.faq.vo.FaqSearchCriteria;
import com.gigabox.faq.vo.FaqVO;

public interface FaqDAO {
	
	public List<FaqVO> faqList(FaqSearchCriteria fsc);

	public int faqListCount(FaqSearchCriteria fsc);
}
