package com.gigabox.notice.page;

public class PagingVO {
	private String page; // 페이지 번호
	private String pageSize; // 페이지에 보여주는 레코드 수
	private String startRow; // 시작 레코드 번호
	private String endRow; // 종료 레코드 번호

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getStart_row() {
		return startRow;
	}

	public void setStart_row(String start_row) {
		this.startRow = start_row;
	}

	public String getEnd_row() {
		return endRow;
	}

	public void setEnd_row(String end_row) {
		this.endRow = end_row;
	}

	@Override
	public String toString() {
		return "PagingVO [page=" + page + ", pageSize=" + pageSize + ", startRow=" + startRow + ", endRow=" + endRow
				+ "]";
	}

}
