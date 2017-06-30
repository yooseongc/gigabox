package com.gigabox.user.dto;

public class LoginDTO {
	private String userId;
	private String userPw;
	private String userStatus;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	@Override
	public String toString() {
		return "LoginDTO [userId=" + userId + ", userPw=" + userPw + ", userStatus=" + userStatus + "]";
	}

}
