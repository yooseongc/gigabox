package com.gigabox.branch.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigabox.branch.service.BranchService;
import com.gigabox.branch.vo.BranchVO;

@Controller
@RequestMapping("/cinema")
public class BranchController {

	private static final Logger logger = LoggerFactory.getLogger(BranchController.class);

	@Inject
	private BranchService service;

	@RequestMapping(value = "/branchList", method = RequestMethod.GET)
	public String branchList(Model model) {
		logger.info("branchList.jsp ENTER...");
		List<BranchVO> branchList = service.branchList();
		List<String> location = new ArrayList<>();
		for (BranchVO each : branchList) {
			location.add(each.getBranchName().split(" ")[0]);
		}
		findDuplicateValue(location);
		for (String loc : location) {
			logger.info(loc);
		}
		
		model.addAttribute("location", location);
		model.addAttribute("branchList", service.branchList());
		return "/branch/branchList";
	}
	
	@RequestMapping(value = "/branchDetail/{branchNumber}", method = RequestMethod.GET)
	public String branchDetail(Model model, @PathVariable int branchNumber) {
		logger.info("branchList.jsp ENTER...");
		List<BranchVO> branchList = service.branchList();
		List<String> location = new ArrayList<>();
		for (BranchVO each : branchList) {
			location.add(each.getBranchName().split(" ")[0]);
		}
		findDuplicateValue(location);
		for (String loc : location) {
			logger.info(loc);
		}
		model.addAttribute("branchDetail", service.branchDetail(branchNumber));
		model.addAttribute("location", location);
		model.addAttribute("branchList", service.branchList());
		
		logger.info(service.branchDetail(branchNumber).toString());
		
		return "/branch/branchList";
	}
	
	
	
	private void findDuplicateValue(List<String> list) {
		for (int i = 0; i < list.size(); i++) {
			String str1 = list.get(i);
			for (int j = 0; j < list.size(); j++) {
				if (i == j)
					continue;
				String str2 = list.get(j);
				if (str1.equals(str2)) {
					list.remove(j);
					i = 0;
					continue;
				}
			}
		}
	}

}
