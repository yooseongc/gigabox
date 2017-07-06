package com.gigabox.bookmark.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.bookmark.persistence.BookmarkDAO;
import com.gigabox.bookmark.vo.BookmarkVO;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Inject
	private BookmarkDAO dao;

	
	@Override
	public List<BookmarkVO> BookmarkList(BookmarkVO vo) {
		return dao.bookmarkList(vo);
	}

	@Override
	public void addBookmark(BookmarkVO vo) {
		dao.addBookmark(vo);
	}

	@Override
	public int countBookmark(BookmarkVO mno) {
		return dao.countBookmark(mno);
	}

	@Override
	public int delete(BookmarkVO bookmarkNumber) {
		return dao.delete(bookmarkNumber);
		
	}



}
