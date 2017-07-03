package com.gigabox.schedule.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.schedule.vo.ScheduleSearchCriteria;
import com.gigabox.schedule.vo.ScheduleVO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {

	@Inject
	private SqlSession sqlSession;
	
	private final static String namespace = "com.gigabox.mapper.ScheduleMapper";
	
	@Override
	public List<ScheduleVO> scheduleList(ScheduleSearchCriteria ssc) {
		return sqlSession.selectList(namespace + ".scheduleList", ssc);
	}

	@Override
	public int scheduleListCount(ScheduleSearchCriteria ssc) {
		return sqlSession.selectOne(namespace + ".scheduleListCount", ssc);
	}

	@Override
	public ScheduleVO scheduleDetail(ScheduleVO scheduleVO) {
		return sqlSession.selectOne(namespace + ".scheduleDetail", scheduleVO);
	}

	@Override
	public int scheduleInsert(ScheduleVO scheduleVO) {
		return sqlSession.insert(namespace + ".scheduleInsert", scheduleVO);
	}

	@Override
	public int scheduleUpdate(ScheduleVO scheduleVO) {
		return sqlSession.update(namespace + ".scheduleUpdate", scheduleVO);
	}

}
