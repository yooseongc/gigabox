package com.gigabox.bookmark.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.bookmark.vo.BookmarkVO;

@Repository
public class BookmarkDAOImpl implements BookmarkDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.gigabox.mapper.BookmarkMapper";
	
	@Override
	public List<BookmarkVO> bookmarkList() {
		return sqlSession.selectList(namespace+".bookmarkList");
	}

	@Override
	public void addBookmark(BookmarkVO vo) {
	 sqlSession.insert(namespace+".addBookmark", vo);
	}

}
