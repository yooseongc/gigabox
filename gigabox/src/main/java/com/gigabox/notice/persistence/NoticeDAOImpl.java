package com.gigabox.notice.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.gigabox.mapper.NOTICEMapper";

	@Override
	public List<NoticeVO> noticeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".noticeList");
	}
}
