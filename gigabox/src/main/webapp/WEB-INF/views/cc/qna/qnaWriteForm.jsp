<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GigaBox 1:1문의 글쓰기</title>
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

<!-- summernote -->
<link href="/resources/summernote/summernote.css" rel="stylesheet"/>
<script type="text/javascript" src="/resources/summernote/summernote.min.js"></script>
<script type="text/javascript" src="/resources/summernote/lang/summernote-ko-KR.js"></script>

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
		<!-- 상단 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					공지사항 <small>GIGABOX NEWS</small>
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
	</div>
	<!-- /.row -->
	<br>
	<!-- Content Row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="container">
				<form id="qnaWriteForm" class="form-group" method="post">
					<table class="table">
						<colgroup>
							<col width="10%" />
							<col width="50%" />
						</colgroup>
						<tbody id="inquiryWrite">
							<tr>
								<th>제목</th>
								<td><input type="text" name="inquiryTitle" id="q_title"
									class="form-control"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea rows="5" id="q_content" name="inquiryContent"
										class="form-control" style="resize: none;"></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="userNumber" value="${sessionScope.login.userNumber}">
				</form>
			</div>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<hr>
	<div align="center">
		<input type="button" value="저장" id="qnaInsertBtn"
			class="btn btn-default"> <input type="button" value="목록"
			id="qnaListBtn" class="btn btn-default">
	</div>
	<!-- footer -->
	<c:import url="/templates/footer.jsp" />


	<script type="text/javascript">
	$(document).ready(function() {
		
		$("#q_content").summernote({
	        height: 400,          // 기본 높이값
	        minHeight: null,      // 최소 높이값(null은 제한 없음)
	        maxHeight: null,      // 최대 높이값(null은 제한 없음)
	        lang: 'ko-KR',        // 한국어 지정(기본값은 en-US)
	        toolbar: [
	            ['font', ['bold', 'italic', 'underline']],
	            ['fontname', ['fontname']],
	            ['fontsize', ['fontsize']],
	            ['color', ['color']],
	            ['para', ['ul', 'ol', 'paragraph']],
	            ['height', ['height']],
	            ['table', ['table']],
	            ['insert', ['hr']],
	            ['view', ['fullscreen', 'codeview']]
	          ]
	    });
		
		//저장 버튼 클릭 시 처리 이벤트
		$("#qnaInsertBtn").click(function(e) {
			e.preventDefault();
			$("#qnaWriteForm").attr("method", "POST");
			$("#qnaWriteForm").attr("action", "/cc/qna/qnaWrite");
			$("#qnaWriteForm").submit();
		});

		//목록 버튼 클릭 시 처리 이벤트
		$("#qnaListBtn").click(function() {
			location.href = "/cc/qna/qnaList";
		});
	});
	</script>
</body>
</html>