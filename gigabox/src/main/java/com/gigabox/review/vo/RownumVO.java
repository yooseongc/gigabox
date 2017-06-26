package com.gigabox.review.vo;

public class RownumVO {
	
	private int rowStart = 1;
	private int rowEnd = 10;
	private int movieNumber;
	
	
	
	public int getRowStart() {
		return rowStart;
	}
	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}
	public int getRowEnd() {
		return rowEnd;
	}
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}
	
	@Override
	public String toString() {
		return "RownumVO [rowStart=" + rowStart + ", rowEnd=" + rowEnd +  ", movieNumber=" + movieNumber + "]";
	}
	
	public void next(int count) {
		for (int i = 0; i < count; i++) {
			//rowStart += 10;
			rowEnd += 10;
		}
	}
	public int getMovieNumber() {
		return movieNumber;
	}
	public void setMovieNumber(int movieNumber) {
		this.movieNumber = movieNumber;
	}
	
}
