package com.gigabox.movieroom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.movieroom.persistence.MovieRoomDAO;
import com.gigabox.movieroom.vo.MovieRoomVO;

@Service
public class MovieRoomServiceImpl implements MovieRoomService {

	@Inject
	private MovieRoomDAO dao;

	@Override
	public List<MovieRoomVO> movieRoomList() {

		return dao.movieRoomList();
	}
}
