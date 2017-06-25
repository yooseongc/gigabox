package com.gigabox.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gigabox.review.service.ReviewService;
import com.gigabox.review.vo.ReviewVO;
import com.gigabox.review.vo.RownumVO;
import com.gigabox.user.service.UserService;
import com.gigabox.user.vo.UserVO;

@RestController
@RequestMapping("/review")
public class ReviewController {

	@Inject
	private ReviewService reviewService;
	
	@Inject
	private UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);


	// 댓글 리스트
	@RequestMapping(value = "/list/{movieNumber}/{count}", method = RequestMethod.GET)
	public ResponseEntity<List<Map<String, Object>>> reviewList(@PathVariable("movieNumber") Integer movieNumber,
			@PathVariable("count") int count) {
		logger.info("=================================================");
		logger.info("REVIEW COMMENT LIST GET START");
		logger.info("movieNumber= " + movieNumber);
		logger.info("count= "  + count);
		
		// 시작이 0 
		RownumVO rownumVO = new RownumVO();
		rownumVO.setMovieNumber(movieNumber);
		rownumVO.next(count);
		
		ResponseEntity<List<Map<String, Object>>> entity = null;
		try {
			List<Map<String, Object>> reviewAllList = new ArrayList<>();
			List<ReviewVO> reviewList = reviewService.reviewList(rownumVO);
			for (ReviewVO reviewItem : reviewList) {
				
				Map<String, Object> resultMap = new HashMap<>();
				
				UserVO eachUser = new UserVO();
				eachUser.setUserNumber(reviewItem.getUserNumber());
				UserVO reviewUser = userService.userDetail(eachUser);
				eachUser.setUserName(reviewUser.getUserName());
				eachUser.setUserId(reviewUser.getUserId());
				resultMap.put("user", eachUser);
				resultMap.put("review", reviewItem);
				reviewAllList.add(resultMap);
			}
			entity = new ResponseEntity<>(reviewAllList, HttpStatus.OK);
			logger.info("WRITE REVIEW COMMENT SUCCESSED");
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			logger.info("ERROR= " + e.getMessage());
		}
		logger.info("REVIEW COMMENT LIST GET END");
		logger.info("=================================================");
		return entity;
	}
	
	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.PUT)
	public ResponseEntity<String> reviewWrite(@RequestBody ReviewVO reviewVO) {
		logger.info("=================================================");
		logger.info("WRITE REVIEW COMMENT START");
		logger.info("ReviewVO= " + reviewVO.toString());
		ResponseEntity<String> entity = null;
		try {
			int result = reviewService.reviewInsert(reviewVO);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				logger.info("WRITE REVIEW COMMENT SUCCESSED");
			} else {
				entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
				logger.info("WRITE REVIEW COMMENT FAILED");
			}
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			logger.info("WRITE REVIEW COMMENT SUCCESSED");
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("ERROR= " + e.getMessage());
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		logger.info("WRITE REVIEW COMMENT END");
		logger.info("=================================================");
		return entity;
	}
	
	// 댓글 수정
	@RequestMapping(value="/update/{reviewNumber}", method=RequestMethod.PUT)
	public ResponseEntity<String> reviewUpdate(@PathVariable("reviewNumber") int reviewNumber, 
			@RequestBody ReviewVO reviewVO) {
		logger.info("==================================================");
		logger.info("UPDATE REVIEW COMMENT START");
		logger.info("ReviewVO= " + reviewVO.toString());
		ResponseEntity<String> entity = null;
		try {
			int result = reviewService.reviewUpdate(reviewVO);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				logger.info("UPDATE REVIEW COMMENT SUCCESSED");
			} else {
				entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
				logger.info("UPDATE REVIEW COMMENT FAILED");
			}
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			logger.info("WRITE REVIEW COMMENT SUCCESSED");
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("ERROR= " + e.getMessage());
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		logger.info("UPDATE REVIEW COMMENT END");
		logger.info("=================================================");
		return entity;
	}

	// 삭제
	@RequestMapping(value = "/delete/{reviewNumber}", method = RequestMethod.PUT)
	public ResponseEntity<String> remove(@PathVariable("reviewNumber") int reviewNumber) {
		logger.info("==================================================");
		logger.info("UPDATE REVIEW COMMENT START");
		ResponseEntity<String> entity = null;
		logger.info("reviewNumber= " + reviewNumber);
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setReviewNumber(reviewNumber);
		try {
			int result = reviewService.reviewDelete(reviewVO);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				logger.info("UPDATE REVIEW COMMENT SUCCESSED");
			} else {
				entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
				logger.info("UPDATE REVIEW COMMENT FAILED");
			}
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			logger.info("WRITE REVIEW COMMENT SUCCESSED");
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("ERROR= " + e.getMessage());
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		logger.info("UPDATE REVIEW COMMENT END");
		logger.info("=================================================");
		return entity;
	}

}
