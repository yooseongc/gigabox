package com.gigabox.notice.page;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

public class PagingTag extends TagSupport {
	private static final long serialVersionUID = 1L;

	/*
	 * @param page 현재 페이지 번호
	 * 
	 * @param total 전체 조회된 ROW 수 =DB 저장 레코드 수
	 * 
	 * @param list_size 페이지에 보여주는 레코드 수
	 * 
	 * @param page_size 페이지 네비게이터에 표시되는 페이지 버튼 갯수
	 */

	private int page = 1;
	private int total = 12;
	private int listSize = 5;
	private int pageSize = 3;

	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().println(getPaging());
		} catch (Exception e) {
			// TODO: handle exception
		}

		// TODO Auto-generated method stub
		return super.doStartTag();
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setList_size(int list_size) {
		this.listSize = list_size;
	}

	public void setPage_size(int page_size) {
		this.pageSize = page_size;
	}

	public String getPaging() {
		String ret = "";

		if (page < 1)
			page = 1;

		if (total < 1)
			return "";

		int currentFirst = (page - 1) / pageSize; // 현재 페이지의 맨 처음
		currentFirst = currentFirst * pageSize + 1;

		int currentLast = (page - 1) / pageSize; // 현재 페이지 마지막
		currentLast = currentLast * pageSize + pageSize;

		int nextFirst = (page - 1) / pageSize;
		nextFirst = (nextFirst + 1) * pageSize + 1;

		int prevLast = (page - 1) / pageSize;
		prevLast = (prevLast - 1) * pageSize + pageSize;

		int lastPage = 1;
		lastPage = total / listSize;

		if (total % listSize != 0)
			lastPage = lastPage + 1;
		currentLast = (currentLast > lastPage) ? lastPage : currentLast;

		ret += "<div class='paginate'>";

		if (page > 1) {
			ret += "<a href=\"javascript:goPage('1')\"><span><img src='/resources/images/pageFirst.jpg' alt='처음'/></span></a>";
		} else {
			ret += "<span><img src='/resources/images/pageFist.jpg' alt='처음'></span>";
		}
		if (prevLast > 0) {
			ret += "<a href=\"javascript:goPage('" + prevLast
					+ "');\"><span><img src='/resources/images/pageLast.jpg' alt='이전'/></span></a>";
		} else {
			ret += "<span><img src='/resources/images/pageLast.jpg' alt='이전'/></span>";
		}
		for (int j = currentFirst; j < currentFirst + pageSize && j <= lastPage; j++) {
			if (j <= currentLast) {
				if (j == page) {
					ret += "<a href='#' class='on textAn'>" + j + "</a>";
				} else {
					ret += "<a href=\"javascript:goPage('" + j + "');\"class='textAn'>" + j + "</a>";
				}
			}
		}
		if (nextFirst <= lastPage) {
			ret += "<a href=\"javascript:goPage('" + nextFirst
					+ "')\"><span><img src='/resources/images/pageNext.jpg' alt='다음'/></span></a>";
		} else {
			ret += "<span><img src='/resources/images/pageNext.jpg' alt='다음'/></span>";
		}
		if (page < lastPage) {
			ret += "<a href=\"javascript:goPage('" + lastPage
					+ "')\"><span><img src='/resources/images/pageLast.jpg' alt='마지막'/></span>";
		}
		ret += "</div>";
		return ret;
	}
}
