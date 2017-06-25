package com.gigabox.review.persistence;

import java.util.List;

import com.gigabox.review.vo.ReviewVO;
import com.gigabox.review.vo.RownumVO;

public interface ReviewDAO {
	
	public List<ReviewVO> reviewList(RownumVO rownumVO);
	
	public int reviewListCount(int movieNumber);
	
	public int reviewInsert(ReviewVO reviewVo);
	
	public int reviewUpdate(ReviewVO reviewVo);
	
	public int reviewDelete(ReviewVO reviewVO);
	
	public int reviewRatingAverage(int movieNumber);
	
}
