package com.gigabox.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.movie.persistence.MovieDAO;
import com.gigabox.movie.vo.MovieVO;

@Service
public class MovieServiceImpl implements MovieService {

	@Inject
	private MovieDAO dao;
	
	@Override
	public void regist(MovieVO movie) throws Exception {
		dao.create(movie);
	}

	@Override
	public MovieVO read(Integer mno) throws Exception {
		return dao.read(mno);
	}

	@Override
	public void modify(MovieVO mno) throws Exception {
		dao.update(mno);
	}


	@Override
	public void remove(Integer mno) throws Exception {
		dao.delete(mno);
	}

	@Override
	public List<MovieVO> movieList() throws Exception {
		return dao.movieList();
	}

	@Override
	public MovieVO movieDetail(MovieVO movieVO) {
		return dao.movieDetail(movieVO);
	}

	@Override
	public List<MovieVO> readMore(int mno) throws Exception {
		return dao.readMore(mno);
	}

}