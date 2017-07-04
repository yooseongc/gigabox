package com.gigabox.bookmark.persistence;

import java.util.List;

import com.gigabox.bookmark.vo.BookmarkVO;

public interface BookmarkDAO {
	
	public List<BookmarkVO> bookmarkList();
	
	public void addBookmark(BookmarkVO vo);
	
	public int countBookmark(int mno, int uno);
	
	public void delete(int bno);
}
