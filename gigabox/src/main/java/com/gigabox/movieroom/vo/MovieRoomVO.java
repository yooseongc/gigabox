package com.gigabox.movieroom.vo;

public class MovieRoomVO {
	private int movieRoomNumber; // 영화관 번호
	private int branchNumber;
	private String movieRoom2D;
	private String movieRoom3D;
	private String movieRoom4D;
	private String movieRoomSeatData;

	public int getMovieRoomNumber() {
		return movieRoomNumber;
	}

	public void setMovieRoomNumber(int movieRoomNumber) {
		this.movieRoomNumber = movieRoomNumber;
	}

	public int getBranchNumber() {
		return branchNumber;
	}

	public void setBranchNumber(int branchNumber) {
		this.branchNumber = branchNumber;
	}

	public String getMovieRoom2D() {
		return movieRoom2D;
	}

	public void setMovieRoom2D(String movieRoom2D) {
		this.movieRoom2D = movieRoom2D;
	}

	public String getMovieRoom3D() {
		return movieRoom3D;
	}

	public void setMovieRoom3D(String movieRoom3D) {
		this.movieRoom3D = movieRoom3D;
	}

	public String getMovieRoom4D() {
		return movieRoom4D;
	}

	public void setMovieRoom4D(String movieRoom4D) {
		this.movieRoom4D = movieRoom4D;
	}

	public String getMovieRoomSeatData() {
		return movieRoomSeatData;
	}

	public void setMovieRoomSeatData(String movieRoomSeatData) {
		this.movieRoomSeatData = movieRoomSeatData;
	}

	@Override
	public String toString() {
		return "MoovieRoomVO [movieRoomNumber=" + movieRoomNumber + ", branchNumber=" + branchNumber + ", movieRoom2D="
				+ movieRoom2D + ", movieRoom3D=" + movieRoom3D + ", movieRoom4D=" + movieRoom4D + ", movieRoomSeatDATA="
				+ movieRoomSeatData + "]";
	}

}
