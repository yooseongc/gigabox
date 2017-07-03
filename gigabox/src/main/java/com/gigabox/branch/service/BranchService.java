package com.gigabox.branch.service;

import java.util.List;

import com.gigabox.branch.vo.BranchVO;

public interface BranchService {
	
	public List<BranchVO> branchList();
	
	public BranchVO branchDetail(int branchNumber);
	
}
