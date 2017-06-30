package com.gigabox.branch.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gigabox.branch.vo.BranchVO;

@Repository
public class BranchDAOImpl implements BranchDAO {

private static String namespace = "com.gigabox.mapper.BranchMapper";
	
	@Inject
	private SqlSession session;
	
	@Override
	public List<BranchVO> branchList() {
		return session.selectList(namespace + ".branchList");
	}

	@Override
	public BranchVO branchDetail(int branchNumber) {
		return session.selectOne(namespace + ".branchDetail", branchNumber);
	}

}
