package com.gigabox.movie.vo;

public class MovieVO {
	private int movieNumber; // 영화번호
	private String movieTitle; // 영화제목
	private String movieType; // 영화타입
	private String movieRating; // 영화등급
	private String movieReleasedate; // 개봉일
	private String movieDirector; // 감독
	private String movieCast; // 출연진
	private int movieScreentime; // 총상영시간
	private String movieGenre; // 장르
	private String movieStoryline; // 줄거리
	private String movieEngname; // 영문제목
	private String moviePoster; // 포스터
	private String movieSteelcut; // 스틸컷
	private String movieTrailer; // 트레일러

	public int getMovieNumber() {
		return movieNumber;
	}

	public void setMovieNumber(int movieNumber) {
		this.movieNumber = movieNumber;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieType() {
		return movieType;
	}

	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}

	public String getMovieRating() {
		return movieRating;
	}

	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}

	public String getMovieReleasedate() {
		return movieReleasedate;
	}

	public void setMovieReleasedate(String movieReleasedate) {
		this.movieReleasedate = movieReleasedate;
	}

	public String getMovieDirector() {
		return movieDirector;
	}

	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}

	public String getMovieCast() {
		return movieCast;
	}

	public void setMovieCast(String movieCast) {
		this.movieCast = movieCast;
	}

	public int getMovieScreentime() {
		return movieScreentime;
	}

	public void setMovieScreentime(int movieScreentime) {
		this.movieScreentime = movieScreentime;
	}

	public String getMovieGenre() {
		return movieGenre;
	}

	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}

	public String getMovieStoryline() {
		return movieStoryline;
	}

	public void setMovieStoryline(String movieStoryline) {
		this.movieStoryline = movieStoryline;
	}

	public String getMovieEngname() {
		return movieEngname;
	}

	public void setMovieEngname(String movieEngname) {
		this.movieEngname = movieEngname;
	}

	public String getMoviePoster() {
		return moviePoster;
	}

	public void setMoviePoster(String moviePoster) {
		this.moviePoster = moviePoster;
	}

	public String getMovieSteelcut() {
		return movieSteelcut;
	}

	public void setMovieSteelcut(String movieSteelcut) {
		this.movieSteelcut = movieSteelcut;
	}

	public String getMovieTrailer() {
		return movieTrailer;
	}

	public void setMovieTrailer(String movieTrailer) {
		this.movieTrailer = movieTrailer;
	}

	@Override
	public String toString() {
		return "MovieVO [movieNumber=" + movieNumber + ", movieTitle=" + movieTitle + ", movieType=" + movieType
				+ ", movieRating=" + movieRating + ", movieReleasedate=" + movieReleasedate + ", movieDirector="
				+ movieDirector + ", movieCast=" + movieCast + ", movieScreentime=" + movieScreentime + ", movieGenre="
				+ movieGenre + ", movieStoryline=" + movieStoryline + ", movieEngname=" + movieEngname
				+ ", moviePoster=" + moviePoster + ", movieSteelcut=" + movieSteelcut + ", movieTrailer=" + movieTrailer
				+ "]";
	}

}
