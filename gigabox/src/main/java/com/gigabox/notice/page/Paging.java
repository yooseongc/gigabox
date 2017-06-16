package com.gigabox.notice.page;

import com.gigabox.notice.vo.NoticeVO;

public class Paging {
	public static void set(NoticeVO vo) {
		int page = Util.nvl(vo.getPage(), 1); //페이지 번호
		int pageSize = Util.nvl(vo.getPageSize(), 5); //페이지 당 레코드 수

		if (vo.getPage() == null)
			vo.setPage(page + "");
		if (vo.getPageSize() == null)
			vo.setPageSize(pageSize + "");

		int start_row = (page - 1) * pageSize + 1; //시작레코드 번호
		int end_row = (page - 1) * pageSize + pageSize;//종료레코드번호

		vo.setStart_row(start_row + "");
		vo.setEnd_row(end_row + "");
	}
}
