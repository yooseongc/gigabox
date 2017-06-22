package com.gigabox.review.vo;

import java.util.Date;

public class ReviewVO {
	private int reviewNumber; // ¸®ºä¹øÈ£
	private int movieNumber; // ¿µÈ­¹øÈ£
	private int userNumber; // À¯Àú¹øÈ£
	private String reviewContent; // ¸®ºäÄÁÅÙÃ÷
	private int reviewStarScore; // ¸®ºäº°Á¡
	private int reviewLike; // ¸®ºä ÁÁ¾Æ¿ä
	private Date reviewRegisterDate; // ¸®ºä µî·ÏÀÏ

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

	public int getReviewStarScore() {
		return reviewStarScore;
	}

	public void setReviewStarScore(int reviewStarScore) {
		this.reviewStarScore = reviewStarScore;
	}

	public int getReviewLike() {
		return reviewLike;
	}

	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}

	public Date getReviewRegisterDate() {
		return reviewRegisterDate;
	}

	public void setReviewRegisterDate(Date reviewRegisterDate) {
		this.reviewRegisterDate = reviewRegisterDate;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNumber=" + reviewNumber + ", movieNumber=" + movieNumber + ", userNumber=" + userNumber
				+ ", reviewContent=" + reviewContent + ", reviewStarScore=" + reviewStarScore + ", reviewLike="
				+ reviewLike + ", reviewRegisterDate=" + reviewRegisterDate + "]";
	}

}
