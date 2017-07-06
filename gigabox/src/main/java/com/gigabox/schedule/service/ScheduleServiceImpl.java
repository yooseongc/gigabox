package com.gigabox.schedule.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.schedule.persistence.ScheduleDAO;
import com.gigabox.schedule.vo.ScheduleSearchCriteria;
import com.gigabox.schedule.vo.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Inject
	private ScheduleDAO scheduleDAO;
	
	@Override
	public List<ScheduleVO> scheduleList(ScheduleSearchCriteria ssc) {
		return scheduleDAO.scheduleList(ssc);
	}

	@Override
	public List<ScheduleVO> scheduleBranchList(ScheduleSearchCriteria ssc) {
		return scheduleDAO.scheduleBranchList(ssc);
	}

	@Override
	public List<ScheduleVO> scheduleMovieList(ScheduleSearchCriteria ssc) {
		return scheduleDAO.scheduleMovieList(ssc);
	}
	
	@Override
	public ScheduleVO scheduleDetail(ScheduleVO scheduleVO) {
		return scheduleDAO.scheduleDetail(scheduleVO);
	}

	

}
