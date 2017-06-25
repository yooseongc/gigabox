package com.gigabox.review.vo;

import java.util.Date;

public class ReviewVO {
	
	private int reviewNumber; // 리뷰번호
	private int movieNumber; // 영화번호
	private int userNumber; // 유저번호
	private String reviewContent; // 리뷰컨텐츠
	private int reviewStarscore; // 리뷰별점
	private int reviewLike; // 리뷰 좋아요
	private Date reviewRegisterdate; // 리뷰 등록일

	public int getReviewNumber() {
		return reviewNumber;
	}

	public void setReviewNumber(int reviewNumber) {
		this.reviewNumber = reviewNumber;
	}

	public int getMovieNumber() {
		return movieNumber;
	}

	public void setMovieNumber(int movieNumber) {
		this.movieNumber = movieNumber;
	}

	public int getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewStarscore() {
		return reviewStarscore;
	}

	public void setReviewStarscore(int reviewStarscore) {
		this.reviewStarscore = reviewStarscore;
	}

	public int getReviewLike() {
		return reviewLike;
	}

	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}

	public Date getReviewRegisterdate() {
		return reviewRegisterdate;
	}

	public void setReviewRegisterdate(Date reviewRegisterdate) {
		this.reviewRegisterdate = reviewRegisterdate;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNumber=" + reviewNumber + ", movieNumber=" + movieNumber + ", userNumber=" + userNumber
				+ ", reviewContent=" + reviewContent + ", reviewStarscore=" + reviewStarscore + ", reviewLike="
				+ reviewLike + ", reviewRegisterdate=" + reviewRegisterdate + "]";
	}

}