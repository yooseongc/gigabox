package com.gigabox.reservation.controller;

import com.gigabox.reservation.service.ReservationService;
import com.gigabox.reservation.service.ReservationServiceImpl;
import com.gigabox.reservation.vo.ReservationVO;

public class ReservationThreadUtil extends Thread {
	
	private ReservationVO resvVO;
	
	public ReservationVO getResvVO() {
		return resvVO;
	}

	public void setResvVO(ReservationVO resvVO) {
		this.resvVO = resvVO;
	}

	ReservationService resvService = new ReservationServiceImpl();
	
	public void init() {
		this.start();
	}

	@Override
	public void run() {
		for(int i = 0; i < 10; i++){
			System.out.println(resvVO.toString());
			try{
				System.out.println("Thread is running : " + (i)*30 + " seconds");
				Thread.sleep(3000); // 30초
			} catch(Exception e){
				
				e.printStackTrace();
			}
		}
		// 5분이 지난 후
		resvService.reservationDelete(resvVO);
	}

	
}
