package com.gigabox.movie.persistence;

import java.util.List;

import com.gigabox.movie.vo.MovieVO;
import com.gigabox.movie.vo.RownumVO;

public interface MovieDAO {
	
	public List<MovieVO> movieListRecent(RownumVO rownumVO);
	
	public int movieListCountRecent();
	
	public List<MovieVO> movieListTobe(RownumVO rownumVO);
	
	public int movieListCountTobe();
	
	public MovieVO movieDetail(MovieVO movieVO);
	
}
