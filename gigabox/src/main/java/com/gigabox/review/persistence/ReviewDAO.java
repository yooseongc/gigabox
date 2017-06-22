package com.gigabox.review.persistence;

import java.util.List;

import com.gigabox.review.vo.ReviewVO;

public interface ReviewDAO {
	public List<ReviewVO> list(int mno) throws Exception;
	
	public void create(ReviewVO vo) throws Exception;
	
	public void update(ReviewVO vo) throws Exception;
	
	public void delete(int rno) throws Exception;
}
