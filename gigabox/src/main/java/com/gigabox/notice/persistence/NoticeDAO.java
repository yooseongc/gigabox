package com.gigabox.notice.persistence;

import java.util.List;

import com.gigabox.notice.vo.NoticeVO;

public interface NoticeDAO {

	public List<NoticeVO> noticeList(); // 목록조회

	public NoticeVO noticeRead(NoticeVO read);

	
}
