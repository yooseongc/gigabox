package com.gigabox.bookmark.vo;

public class BookmarkVO {
	private int bookmarkNumber;
	private int movieNumber;
	private int userNumber;

	public int getBookmarkNumber() {
		return bookmarkNumber;
	}

	public void setBookmarkNumber(int bookmarkNumber) {
		this.bookmarkNumber = bookmarkNumber;
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

	@Override
	public String toString() {
		return "BookmarkVO [bookmarkNumber=" + bookmarkNumber + ", movieNumber=" + movieNumber + ", userNumber="
				+ userNumber + "]";
	}

}
