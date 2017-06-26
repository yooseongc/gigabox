package com.gigabox.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.movie.vo.MovieVO;
import com.gigabox.movie.vo.RownumVO;

@Repository
public class MovieDAOImpl implements MovieDAO {

	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.gigabox.mapper.MovieMapper";


	@Override
	public List<MovieVO> movieListRecent(RownumVO rownumVO) {
		return sqlSession.selectList(namespace + ".movieListRecent", rownumVO);
	}
	
	@Override
	public int movieListCountRecent() {
		return sqlSession.selectOne(namespace + ".movieListCountRecent");
	}
	
	@Override
	public List<MovieVO> movieListTobe(RownumVO rownumVO) {
		return sqlSession.selectList(namespace + ".movieListTobe", rownumVO);
	}
	
	@Override
	public int movieListCountTobe() {
		return sqlSession.selectOne(namespace + ".movieListCountTobe");
	}
	
	@Override
	public MovieVO movieDetail(MovieVO movieVO) {
		return sqlSession.selectOne(namespace + ".movieDetail", movieVO);
	}

}
