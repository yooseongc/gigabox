package com.gigabox.cc.service;

import java.util.List;

import com.gigabox.cc.vo.NoticeSearchCriteria;
import com.gigabox.cc.vo.NoticeVO;

public interface NoticeService {

	public NoticeVO noticeRead(NoticeVO read);

	public List<NoticeVO> noticeList(NoticeSearchCriteria nsc);

	public int noticeListCount(NoticeSearchCriteria nsc);

}
