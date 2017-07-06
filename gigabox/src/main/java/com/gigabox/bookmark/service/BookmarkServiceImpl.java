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
	public List<BookmarkVO> BookmarkList() {
		return dao.bookmarkList();
	}

	@Override
	public void addBookmark(BookmarkVO vo) {
		dao.addBookmark(vo);
	}

	@Override
	public int countBookmark(int mno, int uno) {
		return dao.countBookmark(mno, uno);
	}

	@Override
	public void delete(int bno) {
		dao.delete(bno);
	}

}
