package com.gigabox.movie.service;

import java.util.List;

import com.gigabox.movie.vo.MovieVO;
import com.gigabox.movie.vo.RownumVO;

public interface MovieService {
	
	public void regist(MovieVO movie) throws Exception;
	
	public MovieVO read(Integer mno) throws Exception;
	
	public void modify(MovieVO mno) throws Exception;
	
	public void remove(Integer mno) throws Exception;
	
	public List<MovieVO> movieList() throws Exception;

	public MovieVO movieDetail(MovieVO movieVO);
	
	public List<MovieVO> readMore(int mno) throws Exception;
	
	public List<MovieVO> movieListRecent(RownumVO rownumVO) throws Exception;
	
	public List<MovieVO> movieListTobe(RownumVO rownumVO) throws Exception;
}
