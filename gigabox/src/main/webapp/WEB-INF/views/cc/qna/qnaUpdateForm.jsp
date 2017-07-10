<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GigaBox 1:1문의 수정</title>
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
					고객 센터 <small>1:1 문의</small>
				</h1>
			</div>
		</div>
	</div>
	<!-- /.row -->
	<br>
	<!-- Content Row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="container">
				<form id="qnaUpdateForm" class="form-group" method="post">
					<table class="table">
						<tbody>
							<tr>
								<th align="center">제목</th>
								<td><input type="text" name="inquiryTitle" id="q_title"
									class="form-control" value="${inquiryUpdate.inquiryTitle}"></td>
							</tr>
							<tr>
								<th align="center">내용</th>
								<td><textarea rows="5" id="q_content" name="inquiryContent"
										class="form-control" style="resize: none;">${inquiryUpdate.inquiryContent}</textarea></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<!--/.col-lg-12 -->
	</div>
	<!-- /.row -->
	<hr>

	<div class="container">
		<div class="pull-right">
			<button type="button" id="qnaUpdateBtn" class="btn btn-primary btn-sm"
			onclick="qnaUpdateBtn('${inquiryUpdate.inquiryNumber}')">저장</button>
			<a href="/cc/qna/qnaList" class="btn btn-primary btn-sm">목록</a>
		</div>
	</div>
	<div class="container">
	<h3></h3>
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
	
});

function qnaUpdateBtn(inquiryNumber) {
	console.log(inquiryNumber);
/* 	alert($("#q_content").val());
	alert($("#q_title").val()); */
	if (confirm("저장 하시겠습니까?")) {
		$.ajax({
			url : "/cc/qna/qnaUpdate",
			type : "POST",
			headers : {
				"Content-Type" : "application/json",
			},
			dataType : 'text',
			data : JSON.stringify({
				inquiryNumber : inquiryNumber,
				inquiryContent : $("#q_content").val(),
				inquiryTitle : $("#q_title").val()
			}),
			success : function(data) {
				alert("수정완료");
				location.href = "/cc/qna/qnaList";
			}
		});
	}

}
	</script>

</body>
</html>