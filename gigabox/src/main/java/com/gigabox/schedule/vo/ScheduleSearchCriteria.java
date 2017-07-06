package com.gigabox.schedule.vo;

import java.util.Date;

public class ScheduleSearchCriteria {

	
	/*
	 * 영화 예매를 위한 조건 필터링 지원용 클래스
	 * 
	 * 영화 예매는 아래와 같은 절차로 이루어진다.
	 * 1. 날짜 선택
	 * 2. 지점 선택
	 * 3. 영화 선택 (+ 상영 타입)
	 * 4. 시간 선택
	 * 5. 상영 일정 선택
	 */
	
	private Date scheduleDate;		// 날짜 선택
	private int branchNumber;		// 지점 번호
	private int movieNumber;		// 영화 번호
	private String scheduleType; 	// 상영 타입
	private int movieroomNumber;	// 상영관 번호
	private Date scheduleStart;		// 상영 시작 시간
	
	@Override
	public String toString() {
		return "ScheduleSearchCriteria [scheduleDate=" + scheduleDate + ", branchNumber=" + branchNumber
				+ ", movieNumber=" + movieNumber + ", scheduleType=" + scheduleType + ", movieroomNumber="
				+ movieroomNumber + ", scheduleStart=" + scheduleStart + "]";
	}
	public Date getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	public int getBranchNumber() {
		return branchNumber;
	}
	public void setBranchNumber(int branchNumber) {
		this.branchNumber = branchNumber;
	}
	public int getMovieNumber() {
		return movieNumber;
	}
	public void setMovieNumber(int movieNumber) {
		this.movieNumber = movieNumber;
	}
	public String getScheduleType() {
		return scheduleType;
	}
	public void setScheduleType(String scheduleType) {
		this.scheduleType = scheduleType;
	}
	public int getMovieroomNumber() {
		return movieroomNumber;
	}
	public void setMovieroomNumber(int movieroomNumber) {
		this.movieroomNumber = movieroomNumber;
	}
	public Date getScheduleStart() {
		return scheduleStart;
	}
	public void setScheduleStart(Date scheduleStart) {
		this.scheduleStart = scheduleStart;
	}

	
}
