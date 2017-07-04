package com.gigabox.bookmark.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public int countBookmark(int mno, int uno) {
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("movieNumber", mno);
        map.put("userNumber", uno);
        return sqlSession.selectOne(namespace+"countBookmark", map);
	}

	@Override
	public void delete(int bno) {
		sqlSession.delete(namespace+"deleteBookmark", bno);
	}

}
