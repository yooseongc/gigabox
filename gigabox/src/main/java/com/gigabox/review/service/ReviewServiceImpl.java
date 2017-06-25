package com.gigabox.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.review.persistence.ReviewDAO;
import com.gigabox.review.vo.ReviewVO;
import com.gigabox.review.vo.RownumVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO reviewDAO;
	
	@Override
	public List<ReviewVO> reviewList(RownumVO rownumVO) {
		return reviewDAO.reviewList(rownumVO);
	}

	@Override
	public int reviewListCount(int movieNumber) {
		return reviewDAO.reviewListCount(movieNumber);
	}

	@Override
	public int reviewInsert(ReviewVO reviewVo) {
		return reviewDAO.reviewInsert(reviewVo);
	}

	@Override
	public int reviewUpdate(ReviewVO reviewVo) {
		return reviewDAO.reviewUpdate(reviewVo);
	}

	@Override
	public int reviewDelete(ReviewVO reviewVO) {
		return reviewDAO.reviewDelete(reviewVO);
	}

	@Override
	public int reviewRatingAverage(int movieNumber) {
		return reviewDAO.reviewRatingAverage(movieNumber);
	}

}
