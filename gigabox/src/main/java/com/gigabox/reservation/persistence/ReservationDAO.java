package com.gigabox.reservation.persistence;

import java.util.List;

import com.gigabox.reservation.vo.ReservationVO;

public interface ReservationDAO {
	
	public List<ReservationVO> reservationList(ReservationVO resvVO);
	
	public ReservationVO reservationDetail(ReservationVO resvVO);
	
	public int reservationSeatInsert(ReservationVO resvVO);
	
	public int reservationPaymentUpdate(ReservationVO resvVO);
	
	public int reservationDelete(ReservationVO resvVO);
	
	public int reservationCancel(ReservationVO resvVO);
}
