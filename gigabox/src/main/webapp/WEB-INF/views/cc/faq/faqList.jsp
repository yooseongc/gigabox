<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GigaBox - 자주묻는질문</title>
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
					고객 센터 <small>자주 묻는 질문</small>
				</h1>
				<ul class="nav nav-tabs nav-justified" role="tablist">
					<li><a href="/cc/faq/faqList" class="faq" title="자주묻는질문 바로가기"><i
							class="fa fa-question"></i>&nbsp;&nbsp;자주묻는질문</a></li>
					<li><a href="/cc/notice/noticeList" class="notice"
						title="공지사항 바로가기"><i class="fa fa-info"></i>&nbsp;&nbsp;공지사항</a></li>
					<li><a href="/cc/qna/qnaList" class="qna" title="1:1문의 바로가기"><i
							class="fa fa-comments-o"></i>&nbsp;&nbsp;1:1문의</a></li>
				</ul>
			</div>
		</div>
		<!-- /.row -->
		<br>
		<!-- 검색 시작 -->
		<div class="pull-right">
			<form class="form-inline">
				<div class="form-group">
					<select id="searchType" name="searchType"
						class="btn-primary form-control">
						<option value="mileage">마일리지</option>
						<option value="reservation">영화예매</option>
						<option value="payment">결제</option>
						<option value="cinema">영화관</option>
						<option value="homepage">홈페이지</option>
						<option value="etc">기타</option>
					</select>
				</div>

				<div class="input-group">
					<input type="text" id="searchKeyword" name="searchKeyword"
						class="form-control" placeholder="검색어 입력하세요">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit" id="faqSearchBtn">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<!-- 검색 종료 -->
		<br>
		<!-- Content Row -->
		<div class="row">
			<div class="col-lg-12">
				<table class="table panel panel-default">
					<thead>
						<tr id="searchFaq">
							<td
								style="font-size: 1.2em; text-align: center; width: 230px; margin-right: 50px;">분류</td>
							<td style="font-size: 1.2em; text-align: center;">제목</td>
						</tr>
					</thead>
				</table>
				<div class="panel-group" id="accordion">
					<c:forEach items="${faqList}" var="faqItem">
						<div class="panel panel-default">
							<div class="panel-heading">
								<form class="form-inline">
									<div class="form-group"
										style="text-align: center; font-size: 1.2em; width: 200px; margin-right: 50px;">
										${faqItem.faqType}</div>
									<div class="form-group">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#${faqItem.faqNumber}">${faqItem.faqTitle}</a>
									</div>
								</form>
							</div>
							<div id="${faqItem.faqNumber}" class="panel-collapse collapse">
								<div class="panel-body">${faqItem.faqContent}</div>
							</div>
						</div>
						<!-- /.panel default-->
					</c:forEach>
				</div>
				<!-- /.panel-group -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<hr>
		<!-- 페이지 네비게이션  -->
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a
						href="/cc/faq/faqList${pageMaker.makeQuery(pageMaker.startPage-1)}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li
						<c:out value="${pageMaker.criteria.page == idx?'class=\"active\"':''}"/>>
						<a href="/cc/faq/faqList${pageMaker.makeQuery(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="/cc/faq/faqList${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>

	</div>
	<!-- /.container -->

	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

	<script type="text/javascript">
		$(document).ready(function() {
			/* 검색 대상이 변경될 때마다 처리 이벤트 */
			$("#searchType").change(function() {
				if ($("#searchType").val() == "all") {
					$("#searchKeyword").val("글 목록 전체");
				} else if ($("#searchType").val() != "all") {
					$("#searchKeyword").val("");
					$("#searchKeyword").focus();
				}
			});
			/* 검색 버튼 클릭시 처리 이벤트 */
			$("#faqSearchBtn").click(function() {
				if ($("#searchType").val() == "all") {
					$("#searchKeyword").val("");

					return;
				}
				goPage(1);
			});
		});
	</script>

</body>
</html>