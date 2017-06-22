package com.gigabox.review.controller;

import java.util.List;

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

@RestController
@RequestMapping("/review")
public class ReviewController {
	@Inject
	private ReviewService service;

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	// 등록
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReviewVO vo) {
		ResponseEntity<String> entity = null;
		try {
			service.addReivew(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 댓글 리스트
	@RequestMapping(value = "/all/{movieNumber}", method = RequestMethod.GET)
	public ResponseEntity<List<ReviewVO>> list(@PathVariable("movieNumber") Integer movieNumber) {
		ResponseEntity<List<ReviewVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listReview(movieNumber), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 수정
	@RequestMapping(value = "/{reviewNumber}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("reviewNumber") int rno, @RequestBody ReviewVO vo) {
		System.out.println(vo.toString());
		ResponseEntity<String> entity = null;
		try {
			vo.setReviewNumber(rno);
			service.modifyReview(vo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 삭제
	@RequestMapping(value = "/{reviewNumber}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("reviewNumber") int rno) {
		ResponseEntity<String> entity = null;
		try {
			service.removeReview(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
