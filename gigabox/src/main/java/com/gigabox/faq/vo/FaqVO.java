package com.gigabox.faq.vo;

public class FaqVO {
	
	private int faqNumber;
	private int adminNumber;
	private String faqTitle;
	private String faqContent;
	private String faqType;
	
	public int getFaqNumber() {
		return faqNumber;
	}
	public void setFaqNumber(int faqNumber) {
		this.faqNumber = faqNumber;
	}
	public int getAdminNumber() {
		return adminNumber;
	}
	public void setAdminNumber(int adminNumber) {
		this.adminNumber = adminNumber;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public String getFaqType() {
		return faqType;
	}
	public void setFaqType(String faqType) {
		this.faqType = faqType;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faqNumber=" + faqNumber + ", adminNumber=" + adminNumber + ", faqTitle=" + faqTitle
				+ ", faqContent=" + faqContent + ", faqType=" + faqType + "]";
	}
		
}