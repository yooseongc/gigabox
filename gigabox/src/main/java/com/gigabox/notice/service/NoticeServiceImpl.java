package com.gigabox.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.notice.persistence.NoticeDAO;
import com.gigabox.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO noticeDao;

	@Override
	public List<NoticeVO> noticeList() throws Exception {
		// TODO Auto-generated method stub
		return noticeDao.noticeList();
	}
}
