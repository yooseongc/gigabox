package com.gigabox.bookmark.service;

import java.util.List;

import com.gigabox.bookmark.vo.BookmarkVO;

public interface BookmarkService {

	public List<BookmarkVO> BookmarkList();
	
	public void addBookmark(BookmarkVO vo);
	
	
}
