package com.gigabox.user.vo;

public class UserVO {
	private String userId;
	private String userPw;
	private String userName;
	private int userMileage;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserMileage() {
		return userMileage;
	}
	public void setUserMileage(int userMileage) {
		this.userMileage = userMileage;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userMileage="
				+ userMileage + "]";
	}
}
