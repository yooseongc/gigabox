package com.gigabox.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gigabox.user.persistence.ModifyDAO;
import com.gigabox.user.vo.UserVO;

@Service
public class ModifyServiceImpl implements ModifyService {

	@Inject
	private ModifyDAO modifyDAO;

	//회원상세보기
	@Override
	public UserVO userDetail(UserVO userVO) {
		// TODO Auto-generated method stub
		return modifyDAO.userDetail(userVO);
	}

	//회원정보수정
	@Override
	public int userModify(UserVO userVO) {
		// TODO Auto-generated method stub
		return modifyDAO.userModify(userVO);
	}

	//비밀번호 변경
	@Override
	public int changePw(UserVO userVO) {
		// TODO Auto-generated method stub
		return modifyDAO.changePw(userVO);
	}

	@Override
	public int pwEncryptionExec(UserVO userVO) {
		// TODO Auto-generated method stub
		return modifyDAO.pwEncryptionExec(userVO);
	}
}
