package com.gigabox.schedule.persistence;

import java.util.List;

import com.gigabox.schedule.vo.ScheduleSearchCriteria;
import com.gigabox.schedule.vo.ScheduleVO;

public interface ScheduleDAO {

	public List<ScheduleVO> scheduleList(ScheduleSearchCriteria ssc);
	
	public List<ScheduleVO> scheduleBranchList(ScheduleSearchCriteria ssc);
	
	public List<ScheduleVO> scheduleMovieList(ScheduleSearchCriteria ssc);
	
	public ScheduleVO scheduleDetail(ScheduleVO scheduleVO);
	
}
