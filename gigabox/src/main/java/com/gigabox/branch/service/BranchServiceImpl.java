package com.gigabox.branch.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.branch.persistence.BranchDAO;
import com.gigabox.branch.vo.BranchVO;

@Service
public class BranchServiceImpl implements BranchService {

	@Inject
	private BranchDAO dao;

	@Override
	public List<BranchVO> branchList() {
		return dao.branchList();
	}

	@Override
	public BranchVO branchDetail(int branchNumber) {
		return dao.branchDetail(branchNumber);
	}
}
