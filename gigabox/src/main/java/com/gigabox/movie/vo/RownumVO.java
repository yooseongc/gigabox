package com.gigabox.movie.vo;

public class RownumVO {
	
	private int rowStart = 1;
	private int rowEnd = 8;
	
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
		return "RownumVO [rowStart=" + rowStart + ", rowEnd=" + rowEnd + "]";
	}
	
	public void next(int count) {
		for (int i = 0; i < count; i++) {
			rowStart += 8;
			rowEnd += 8;
		}
	}
	
}
