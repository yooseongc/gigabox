package com.gigabox.cc.persistence;

import java.util.List;

import com.gigabox.cc.vo.FaqSearchCriteria;
import com.gigabox.cc.vo.FaqVO;

public interface FaqDAO {
	
	public List<FaqVO> faqList(FaqSearchCriteria fsc);

	public int faqListCount(FaqSearchCriteria fsc);
}
