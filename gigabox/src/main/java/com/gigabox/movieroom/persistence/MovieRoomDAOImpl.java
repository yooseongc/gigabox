package com.gigabox.movieroom.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.movieroom.vo.MovieRoomVO;

@Repository
public class MovieRoomDAOImpl implements MovieRoomDAO {

private static String namespace = "com.gigabox.mapper.MovieRoomMapper";
	
	@Inject
	private SqlSession session;
	
	@Override
	public List<MovieRoomVO> movieRoomList() {
		return session.selectList(namespace + ".movieRoomList");
	}

}
