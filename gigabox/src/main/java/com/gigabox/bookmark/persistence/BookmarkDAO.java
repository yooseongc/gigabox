package com.gigabox.bookmark.persistence;

import java.util.List;

import com.gigabox.bookmark.vo.BookmarkVO;

public interface BookmarkDAO {
	
	public List<BookmarkVO> bookmarkList(BookmarkVO vo);
	
	public void addBookmark(BookmarkVO vo);
	
	public int countBookmark(BookmarkVO mno);
	
	public int delete(BookmarkVO bno);
}
