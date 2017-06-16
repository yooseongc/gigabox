package com.gigabox.movie.persistence;

import java.util.List;

import com.gigabox.movie.vo.Criteria;
import com.gigabox.movie.vo.MovieVO;

public interface MovieDAO {
	
	public void create(MovieVO vo) throws Exception;
	
	public MovieVO read(int MovieNumber) throws Exception;
	
	public void update(MovieVO vo) throws Exception;
	
	public void delete(int MovieNumber) throws Exception;
	
	public List<MovieVO> movieList() throws Exception;
	
	public MovieVO movieDetail(MovieVO movieVO);
	
	public List<MovieVO> listCreiteria(Criteria cri) throws Exception;
}
