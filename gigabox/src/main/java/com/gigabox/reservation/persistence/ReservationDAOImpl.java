package com.gigabox.reservation.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.reservation.vo.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	@Inject
	private SqlSession sqlSession;
	
	private final static String namespace = "com.gigabox.mapper.ReservationMapper";
	
	@Override
	public List<ReservationVO> reservationList(ReservationVO resvVO) {
		return sqlSession.selectList(namespace + ".reservationList", resvVO);
	}

	@Override
	public ReservationVO reservationDetail(ReservationVO resvVO) {
		return sqlSession.selectOne(namespace + ".reservationDetail", resvVO);
	}

	@Override
	public int reservationSeatInsert(ReservationVO resvVO) {
		sqlSession.insert(namespace + ".reservationSeatInsert", resvVO);
		System.out.println("resv number= " + resvVO.getReservationNumber());
		return resvVO.getReservationNumber();
	}

	@Override
	public int reservationPaymentUpdate(ReservationVO resvVO) {
		return sqlSession.update(namespace + ".reservationPaymentUpdate", resvVO);
	}

	@Override
	public int reservationDelete(ReservationVO resvVO) {
		return sqlSession.delete(namespace + ".reservationDelete", resvVO);
	}

}
