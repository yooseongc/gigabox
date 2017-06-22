package com.gigabox.review.service;

import java.util.List;

import com.gigabox.review.vo.ReviewVO;

public interface ReviewService {
	public void addReivew(ReviewVO vo) throws Exception;
	
	public List<ReviewVO> listReview(int mno) throws Exception;
	
	public void modifyReview(ReviewVO vo) throws Exception;
	
	public void removeReview(int rno) throws Exception;
}
