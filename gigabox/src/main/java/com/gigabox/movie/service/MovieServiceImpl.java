package com.gigabox.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.movie.persistence.MovieDAO;
import com.gigabox.movie.vo.MovieVO;
import com.gigabox.movie.vo.RownumVO;

@Service
public class MovieServiceImpl implements MovieService {

	@Inject
	private MovieDAO movieDAO;

	@Override
	public List<MovieVO> movieListRecent(RownumVO rownumVO) {
		return movieDAO.movieListRecent(rownumVO);
	}

	@Override
	public int movieListCountRecent() {
		return movieDAO.movieListCountRecent();
	}

	@Override
	public List<MovieVO> movieListTobe(RownumVO rownumVO) {
		return movieDAO.movieListTobe(rownumVO);
	}

	@Override
	public int movieListCountTobe() {
		return movieDAO.movieListCountTobe();
	}

	@Override
	public MovieVO movieDetail(MovieVO movieVO) {
		return movieDAO.movieDetail(movieVO);
	}
	
	

}
