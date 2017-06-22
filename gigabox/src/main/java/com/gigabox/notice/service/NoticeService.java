package com.gigabox.notice.service;

import java.util.List;

import com.gigabox.notice.vo.NoticeSearchCriteria;
import com.gigabox.notice.vo.NoticeVO;

public interface NoticeService {

	public NoticeVO noticeRead(NoticeVO read);

	public List<NoticeVO> noticeList(NoticeSearchCriteria nsc);

	public int noticeListCount(NoticeSearchCriteria nsc);

}
