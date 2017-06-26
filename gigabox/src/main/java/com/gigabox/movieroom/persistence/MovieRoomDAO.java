package com.gigabox.movieroom.persistence;

import java.util.List;

import com.gigabox.movieroom.vo.MovieRoomVO;

public interface MovieRoomDAO {

	public List<MovieRoomVO> movieRoomList();
}
