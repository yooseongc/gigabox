package com.gigabox.reservation.vo;

import java.util.Date;

public class ReservationVO {
	
	/*
	 * reservationStatus
	 * 예매 상태는 아래와 같이 분류한다.
	 * 1 좌석선택
	 * 2 예매완료
	 * 3 예매취소
	 */
	
	// 예매 기본
	private int reservationNumber;			// 예약 번호(PK)
	private Date reservationRegisterdate;	// 예약 등록일 default SYSDATE
	private int reservationStatus;			// 예매 상태 (0, 1, 2)
	private int reservationAdultnum;		// 성인 예매 수
	private int reservationYouthnum;		// 청소년 예매 수
	private int reservationChildnum;		// 아동 예매 수
	private int reservationPreferencenum;	// 우대 예매 수
	
	// 결제
	private int reservationUsingmileage;	// 결제시 사용 마일리지 default 0
	private int reservationPayamount;		// 결제 총 금액(원)
	private String reservationPaymethod;	// 결제 수단 (신용카드, 계좌이체, 현장결제)
	private Date reservationPaymentdate;	// 결제일 
	private String reservationSeat1;		// 좌석1
	private String reservationSeat2;		// 좌석2
	private String reservationSeat3;		// 좌석3
	private String reservationSeat4;		// 좌석4
	private String reservationSeat5;		// 좌석5
	private String reservationSeat6;		// 좌석6
	private String reservationCode;			// 예매 코드 TR-(영화5자리)-(영화관3자리)-(상영관2자리)-(좌석4자리)-(1706280630;시작시간)
	
	// 회원
	private int userNumber;
	private String userId;
	private String userName;
	private int userMileage;
	
	// 상영 일정
	private int scheduleNumber;
	
	// 영화 정보
	
	// 지점 정보
	
	// 상영관 정보
	
	
	
}
