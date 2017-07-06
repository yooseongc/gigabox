package com.gigabox.reservation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gigabox.reservation.persistence.ReservationDAO;
import com.gigabox.reservation.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Inject
	private ReservationDAO resvDAO;
	
	@Override
	public List<ReservationVO> reservationList(ReservationVO resvVO) {
		return resvDAO.reservationList(resvVO);
	}

	@Override
	public ReservationVO reservationDetail(ReservationVO resvVO) {
		return resvDAO.reservationDetail(resvVO);
	}

	@Override
	public int reservationSeatInsert(ReservationVO resvVO) {
		return resvDAO.reservationSeatInsert(resvVO);
	}

	@Override
	public int reservationPaymentUpdate(ReservationVO resvVO) {
		return resvDAO.reservationPaymentUpdate(resvVO);
	}

	@Override
	public int reservationDelete(ReservationVO resvVO) {
		return resvDAO.reservationDelete(resvVO);
	}

}
