package com.gigabox.schedule.persistence;

import java.util.List;

import com.gigabox.schedule.vo.ScheduleSearchCriteria;
import com.gigabox.schedule.vo.ScheduleVO;

public interface ScheduleDAO {

	public List<ScheduleVO> scheduleList(ScheduleSearchCriteria ssc);
	
	public int scheduleListCount(ScheduleSearchCriteria ssc);
	
	public ScheduleVO scheduleDetail(ScheduleVO scheduleVO);
	
	public int scheduleInsert(ScheduleVO scheduleVO);
	
	public int scheduleUpdate(ScheduleVO scheduleVO);
	
}