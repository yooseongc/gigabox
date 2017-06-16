package com.gigabox.notice.vo;

import java.util.Date;

import com.gigabox.notice.page.PagingVO;

public class NoticeVO extends PagingVO{
	private int noticeNumber; // 글번호
	private int adminNumber; // 관리자번호
	private String noticeTitle; // 제목
	private String noticeContent;// 내용
	private Date noticeRegisterdate; // 등록일
	private String noticeBranchname; // 지점명

	public int getNoticeNumber() {
		return noticeNumber;
	}

	public void setNoticeNumber(int noticeNumber) {
		this.noticeNumber = noticeNumber;
	}

	public int getAdminNumber() {
		return adminNumber;
	}

	public void setAdminNumber(int adminNumber) {
		this.adminNumber = adminNumber;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeRegisterdate() {
		return noticeRegisterdate;
	}

	public void setNoticeRegisterdate(Date noticeRegisterdate) {
		this.noticeRegisterdate = noticeRegisterdate;
	}

	public String getNoticeBranchname() {
		return noticeBranchname;
	}

	public void setNoticeBranchname(String noticeBranchname) {
		this.noticeBranchname = noticeBranchname;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [noticeNumber=" + noticeNumber + ", adminNumber=" + adminNumber + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + ", noticeRegisterdate=" + noticeRegisterdate
				+ ", noticeBranchname=" + noticeBranchname + "]";
	}

}