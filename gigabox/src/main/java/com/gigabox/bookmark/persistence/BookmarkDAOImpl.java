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
	public List<BookmarkVO> bookmarkList(BookmarkVO vo) {
		return sqlSession.selectList(namespace+".bookmarkList", vo);
	}

	@Override
	public void addBookmark(BookmarkVO vo) {
	 sqlSession.insert(namespace+".addBookmark", vo);
	}

	@Override
	public int countBookmark(BookmarkVO mno) {
        return sqlSession.selectOne(namespace+".countBookmark", mno);
	}

	@Override
	public int delete(BookmarkVO bno) {
		return sqlSession.delete(namespace+".deleteBookmark", bno);
	}

}
