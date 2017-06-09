package com.gigabox.notice.service;

import java.util.List;

import com.gigabox.notice.vo.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> noticeList() throws Exception;
}
