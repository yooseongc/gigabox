package com.gigabox.notice.service;


import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gigabox.notice.persistence.NoticeDAO;
import com.gigabox.notice.vo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
		Logger logger=Logger.getLogger(NoticeServiceImpl.class);
	@Inject
	private NoticeDAO noticeDao;

	// 글목록 구현
	@Override
	public List<NoticeVO> noticeList() throws Exception {
		return noticeDao.noticeList();
	}
	
	//글 상세 구현
	@Override
	public NoticeVO noticeRead(NoticeVO nvo){
		return noticeDao.noticeRead(nvo);
	}
	

}
