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


</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">Start Bootstrap</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="about.html">About</a></li>
					<li><a href="services.html">Services</a></li>
					<li><a href="contact.html">Contact</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Portfolio <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="portfolio-1-col.html">1 Column Portfolio</a></li>
							<li><a href="portfolio-2-col.html">2 Column Portfolio</a></li>
							<li><a href="portfolio-3-col.html">3 Column Portfolio</a></li>
							<li><a href="portfolio-4-col.html">4 Column Portfolio</a></li>
							<li><a href="portfolio-item.html">Single Portfolio Item</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Blog <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="blog-home-1.html">Blog Home 1</a></li>
							<li><a href="blog-home-2.html">Blog Home 2</a></li>
							<li><a href="blog-post.html">Blog Post</a></li>
						</ul></li>
					<li class="dropdown active"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown">Other Pages <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="full-width.html">Full Width Page</a></li>
							<li><a href="sidebar.html">Sidebar Page</a></li>
							<li class="active"><a href="faq.html">FAQ</a></li>
							<li><a href="404.html">404</a></li>
							<li><a href="pricing.html">Pricing Table</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">

		<!-- 상단 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					공지사항 <small>GIGABOX NEWS</small>
				</h1>
				<ul class="nav nav-tabs" role="tablist">
					<li><a href="/faq/faqList" class="" title="자주묻는질문 바로가기">자주묻는질문</a></li>
					<li><a href="/notice/noticeList" class="" title="공지사항 바로가기">공지사항</a></li>
					<li><a href="#" class="" title="1:1문의 바로가기">1:1문의</a></li>
				</ul>
			</div>
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
							<select class="btn-primary form-control" title="질문 유형">
								<option value="t">전체</option>
								<option value="c">영화관</option>
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
										href="/notice/noticeRead?noticeNumber=${noticeItem.noticeNumber}"
										title="공지사항 상세보기">${noticeItem.noticeTitle}</a></td>
								</c:if>
								<c:if test="${noticeItem.noticeStatus == '일반'}">
									<td><a
										href="/notice/noticeRead?noticeNumber=${noticeItem.noticeNumber}"
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
								href="/notice/noticeList${pageMaker.makeQuery(pageMaker.startPage-1)}">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li
								<c:out value="${pageMaker.criteria.page == idx?'class=\"active\"':''}"/>>
								<a href="/notice/noticeList${pageMaker.makeQuery(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="/notice/noticeList${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<hr>

	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-12" align="center">
				<p>Copyright &copy; Your Website 2014</p>
			</div>
		</div>
	</footer>
	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="/resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>
