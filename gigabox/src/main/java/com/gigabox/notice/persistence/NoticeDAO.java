package com.gigabox.notice.persistence;

import java.util.List;

import com.gigabox.notice.vo.NoticeSearchCriteria;
import com.gigabox.notice.vo.NoticeVO;

public interface NoticeDAO {

	public List<NoticeVO> noticeList(NoticeSearchCriteria nsc);

	public int noticeListCount(NoticeSearchCriteria nsc);

	public NoticeVO noticeRead(NoticeVO read);
}
