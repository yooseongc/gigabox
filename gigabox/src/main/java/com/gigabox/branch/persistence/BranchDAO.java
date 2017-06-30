package com.gigabox.branch.persistence;

import java.util.List;

import com.gigabox.branch.vo.BranchVO;

public interface BranchDAO {

	public List<BranchVO> branchList();
	
	public BranchVO branchDetail(int branchNumber);
	
}
