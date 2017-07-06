package com.gigabox.reservation.controller;

import com.gigabox.reservation.service.ReservationService;
import com.gigabox.reservation.vo.ReservationVO;

public class ReservationThreadUtil extends Thread {
	
	private ReservationVO resvVO;
	private ReservationService resvService;
	
	public ReservationThreadUtil(ReservationVO resvVO, ReservationService resvService) {
		this.resvVO = resvVO;
		this.resvService = resvService;
	}
	
	
	
	public ReservationVO getResvVO() {
		return resvVO;
	}

	public void setResvVO(ReservationVO resvVO) {
		this.resvVO = resvVO;
	}

	public void init() {
		this.start();
	}

	@Override
	public void run() {
		for(int i = 0; i < 10; i++){
			try{
				Thread.sleep(30000); // 30초
			} catch(Exception e){
				
				e.printStackTrace();
			}
		}
		// 5분이 지난 후
		resvService.reservationDelete(resvVO);
	}

	
}
