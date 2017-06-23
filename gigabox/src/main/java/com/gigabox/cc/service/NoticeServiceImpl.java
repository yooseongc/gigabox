package com.gigabox.cc.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gigabox.cc.persistence.NoticeDAO;
import com.gigabox.cc.vo.NoticeSearchCriteria;
import com.gigabox.cc.vo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
	Logger logger = Logger.getLogger(NoticeServiceImpl.class);
	@Inject
	private NoticeDAO noticeDao;

	// 글목록 구현
	@Override
	public List<NoticeVO> noticeList(NoticeSearchCriteria nsc) {
		return noticeDao.noticeList(nsc);
	}

	@Override
	public int noticeListCount(NoticeSearchCriteria nsc) {
		return noticeDao.noticeListCount(nsc);
	}

	// 글 상세 구현
	@Override
	public NoticeVO noticeRead(NoticeVO nvo) {
		return noticeDao.noticeRead(nvo);
	}

}
