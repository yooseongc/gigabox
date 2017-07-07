<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GigaBox 1:1문의</title>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<!-- header -->
	<c:import url="/templates/header.jsp" />

	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					고객 센터 <small>1:1 문의</small>
				</h1>
				<ul class="nav nav-tabs nav-justified" role="tablist">
					<li class=""><a href="/cc/faq/faqList" class="faq"
						title="자주묻는질문 바로가기"><i class="fa fa-question"></i>&nbsp;&nbsp;자주묻는질문</a></li>
					<li><a href="/cc/notice/noticeList" class="notice"
						title="공지사항 바로가기"><i class="fa fa-info"></i>&nbsp;&nbsp;공지사항</a></li>
					<li><a href="/cc/qna/qnaList" class="qna" title="1:1문의 바로가기"><i
							class="fa fa-comments-o"></i>&nbsp;&nbsp;1:1문의</a></li>
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
							<div class="form-group input-group">
								<select id="searchType" name="searchType"
									class="btn-default form-control">
									<option value="t">제목</option>
									<option value="c">내용</option>
									<option value="tc">제목+내용</option>
								</select>
							</div>


							<div class="form-group input-group">
								<input type="text" class="form-control" placeholder="검색어를 입력하세요">
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색 종료 -->
					<table class="table">
						<thead>
							<tr>
								<th style="text-align: center;">구분</th>
								<th style="text-align: center;">제목</th>
								<th style="text-align: center;">작성자</th>
								<th style="text-align: center;">등록일</th>
							</tr>
						</thead>
						<tbody id="inquiryListTableBody">
							<c:forEach var="inquiryItem" items="${inquiryList}">
								<tr>
									<c:if test="${inquiryItem.inquiry.inquiryTitle != '삭제된 글입니다.'}">
										<c:if test="${inquiryItem.inquiry.inquiryQora == 'Q'}">
											<td style="text-align: center;"><i
												class="fa fa-question-circle"></i></td>
										</c:if>
										<c:if test="${inquiryItem.inquiry.inquiryQora == 'A'}">
											<td style="text-align: right;">└>&nbsp;<i
												class="glyphicon glyphicon-exclamation-sign"></i></td>
										</c:if>
									</c:if>
									<c:if test="${inquiryItem.inquiry.inquiryTitle == '삭제된 글입니다.'}">
										<td style="text-align: center;"><i
												class="fa fa-close"></i></td>
									</c:if>
									<c:if test="${inquiryItem.inquiry.inquiryTitle != '삭제된 글입니다.'}">
										<td><a
										href="/cc/qna/qnaRead?inquiryNumber=${inquiryItem.inquiry.inquiryNumber}">${inquiryItem.inquiry.inquiryTitle}</a></td>
									</c:if>
									<c:if test="${inquiryItem.inquiry.inquiryTitle == '삭제된 글입니다.'}">
										<td style="font-weight: bold;">${inquiryItem.inquiry.inquiryTitle}</td>
									</c:if>
									
									<c:if test="${inquiryItem.user.userId != null}">
										<td style="text-align: center;">${inquiryItem.user.userId }</td>
									</c:if>
									<c:if test="${inquiryItem.user.userId == null}">
										<td style="text-align: center;">관리자</td>
									</c:if>
									
									<td style="text-align: center;"><fmt:formatDate
											value="${inquiryItem.inquiry.inquiryRegisterdate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<hr>
					<div class="pull-right">
						<input type="button" class="btn btn-danger" id="qnaWrite"
							value="문의하기" />
					</div>

					<!-- 페이지 네비게이션  -->
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="/cc/qna/qnaList${pageMaker.makeQuery(pageMaker.startPage-1)}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.criteria.page == idx?'class=\"active\"':''}"/>>
									<a href="/cc/qna/qnaList${pageMaker.makeQuery(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="/cc/qna/qnaList${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>

	<hr>

	<script>
		$(document).ready(function() {
			if ('${param.searchType}' != '') {
				$("#searchType").val('${param.searchType}');
			}
			if ('${param.searchKeyword}' != '') {
				$("#searchKeyword").val('${param.searchKeyword}');
			}
		});
	</script>

	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

</body>
</html>