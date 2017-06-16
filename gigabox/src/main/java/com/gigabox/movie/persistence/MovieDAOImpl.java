package com.gigabox.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.movie.vo.Criteria;
import com.gigabox.movie.vo.MovieVO;

@Repository
public class MovieDAOImpl implements MovieDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.gigabox.mapper.MOVIEMapper";

	@Override
	public void create(MovieVO vo) throws Exception {
		session.insert(namespace + ".create", vo);

	}

	@Override
	public MovieVO read(int MovieNumber) throws Exception {
		return session.selectOne(namespace + ".read", MovieNumber);
	}

	@Override
	public void update(MovieVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int MovieNumber) throws Exception {
		session.delete(namespace + ".delete", MovieNumber);
	}

	@Override
	public List<MovieVO> movieList() throws Exception {
		return session.selectList(namespace + ".movieList");
	}

	@Override
	public MovieVO movieDetail(MovieVO movieVO) {
		return session.selectOne(namespace + ".movieDetail", movieVO);
	}

	@Override
	public List<MovieVO> listCreiteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria" , cri);
	}

}
