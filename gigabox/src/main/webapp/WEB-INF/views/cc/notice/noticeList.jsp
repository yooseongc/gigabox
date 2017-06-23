<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GigaBox 공지사항</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<!-- Bootstrap Core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="/resources/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header -->
	<c:import url="/templates/header.jsp" />

	<!-- Page Content -->
	<div class="container">
		<!-- 상단 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					공지사항 <small>GIGABOX NEWS</small>
				</h1>
				<ul class="nav nav-tabs" role="tablist">
					<li><a href="/cc/faq/faqList" class="faq" title="자주묻는질문 바로가기">자주묻는질문</a></li>
					<li><a href="/cc/notice/noticeList" class="notice"
						title="공지사항 바로가기">공지사항</a></li>
					<li><a href="/cc/qna/qnaList" class="qna" title="1:1문의 바로가기">1:1문의</a></li>
				</ul>
			</div>
		</div>
		<!-- /.row -->

		<br>
		<!-- Content Row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="container">
					<!-- 검색 시작 -->
					<div class="pull-right">
						<form class="form-inline">
							<div class="form-group">
								<select class="btn-primary form-control">
									<option value="t"></option>
									<option value="c"></option>
									<option value="tc"></option>
									<option value="b"></option>
								</select>
							</div>
							<input type="text" id="searchKeyword" title="검색어 입력"
								placeholder="검색어를 입력하세요" maxlength="20">
							<button type="submit" class="btn btn-default">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</form>
					</div>
					<!-- 검색 종료 -->
					<table class="table">
						<thead>
							<tr>
								<th style="text-align: center;">NO</th>
								<th style="text-align: center;">영화관</th>
								<th style="text-align: center;">제목</th>
								<th style="text-align: center;">등록일</th>
							</tr>
						</thead>
						<tbody id="noticeListTableBody">
							<c:forEach var="noticeItem" items="${noticeList}">
								<tr data-id="${noticeItem.noticeNumber}">
									<td style="text-align: center;">${noticeItem.noticeNumber}</td>
									<td style="text-align: center;">${noticeItem.noticeBranchname}</td>
									<c:if test="${noticeItem.noticeStatus == '중요'}">
										<td style="font-weight: bold;"><span
											class="label label-danger">공지</span><a
											href="/cc/notice/noticeRead?noticeNumber=${noticeItem.noticeNumber}"
											title="공지사항 상세보기">${noticeItem.noticeTitle}</a></td>
									</c:if>
									<c:if test="${noticeItem.noticeStatus == '일반'}">
										<td><a
											href="/cc/notice/noticeRead?noticeNumber=${noticeItem.noticeNumber}"
											title="공지사항 상세보기">${noticeItem.noticeTitle}</a></td>
									</c:if>
									<td style="text-align: center;"><fmt:formatDate
											value="${noticeItem.noticeRegisterdate}" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr>
					<!-- 페이지 네비게이션  -->
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="/cc/notice/noticeList${pageMaker.makeQuery(pageMaker.startPage-1)}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.criteria.page == idx?'class=\"active\"':''}"/>>
									<a href="/cc/notice/noticeList${pageMaker.makeQuery(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="/cc/notice/noticeList${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<hr>


	</div>
	<!-- /.container -->

	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

	<script type="text/javascript">
		$(document).ready(
				function() {
					if ('${param.searchType}' != '') {
						$("#searchType").val('${param.searchType}');
					}
					if ('${param.searchKeyword}' != '') {
						$("#searchKeyword").val('${param.searchKeyword}');
					}

					$('#noticeSearchButton').on(
							"click",
							function(event) {
								event.preventDefault();
								var queryString = "/notice/noticeList"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("#searchType").val()
										+ "&searchKeyword="
										+ $('#searchKeyword').val();

								self.location = queryString;
							});
				});
	</script>
</body>
</html>
