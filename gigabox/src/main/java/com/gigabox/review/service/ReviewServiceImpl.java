package com.gigabox.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.review.persistence.ReviewDAO;
import com.gigabox.review.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
		
	@Inject
	private ReviewDAO dao;
	
	@Override
	public void addReivew(ReviewVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public List<ReviewVO> listReview(int mno) throws Exception {
		return dao.list(mno);
	}

	@Override
	public void modifyReview(ReviewVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void removeReview(int rno) throws Exception {
		dao.delete(rno);
	}

}
