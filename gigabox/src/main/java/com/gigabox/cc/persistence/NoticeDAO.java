package com.gigabox.cc.persistence;

import java.util.List;

import com.gigabox.cc.vo.NoticeSearchCriteria;
import com.gigabox.cc.vo.NoticeVO;

public interface NoticeDAO {

	public List<NoticeVO> noticeList(NoticeSearchCriteria nsc);

	public int noticeListCount(NoticeSearchCriteria nsc);

	public NoticeVO noticeRead(NoticeVO read);
}
