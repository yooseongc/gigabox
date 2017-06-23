package com.gigabox.cc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.cc.vo.NoticeSearchCriteria;
import com.gigabox.cc.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.gigabox.mapper.NOTICEMapper";
	
	@Override
	public List<NoticeVO> noticeList(NoticeSearchCriteria nsc) {
		return sqlSession.selectList(namespace + ".noticeList", nsc);
	}

	@Override
	public int noticeListCount(NoticeSearchCriteria nsc) {
		return sqlSession.selectOne(namespace + ".noticeListCount", nsc);
	}

	// 글 상세 구현
	@Override
	public NoticeVO noticeRead(NoticeVO nvo) {
		return sqlSession.selectOne(namespace + ".noticeRead", nvo);
	}

	
}
