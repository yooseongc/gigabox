<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>GigaBox - 회원가입</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>

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
							<li><a href="portfolio-item.html">Single Portfolio Item</a>
							</li>
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
							<li class="active"><a href="full-width.html">Full Width
									Page</a></li>
							<li><a href="sidebar.html">Sidebar Page</a></li>
							<li><a href="faq.html">FAQ</a></li>
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

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					회원 서비스 <small>회원 가입</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#">회원 서비스</a></li>
					<li class="active">회원 가입</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<article>
				<div class="col-md-12">
					<div class="page-header">
						<h1>GigaBox 회원 가입</h1>
					</div>
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userID">아이디</label>
							<div class="col-sm-6">
								<input class="form-control" id="userID" type="text"
									name="userID" placeholder="아이디">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userPassword">비밀번호</label>
							<div class="col-sm-6">
								<input class="form-control" id="userPassword"
									name="userPassword" type="password" placeholder="비밀번호">
								<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userPasswordCheck">비밀번호
								확인</label>
							<div class="col-sm-6">
								<input class="form-control" id="userPasswordCheck"
									name="userPasswordCheck" type="password" placeholder="비밀번호 확인">
								<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userEmail">이메일</label>
							<div class="col-sm-6">
								<input class="form-control" id="userEmail" type="email"
									name="userEmail" placeholder="이메일">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userName">이름</label>
							<div class="col-sm-6">
								<input class="form-control" id="userName" type="text"
									name="userName" placeholder="이름">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userTel">휴대폰번호</label>
							<div class="col-sm-6">
								<input type="tel" class="form-control" id="inputNumber"
									name="userTel" placeholder="- 없이 입력해 주세요" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userAddressNumber">우편번호</label>
							<div class="col-sm-6">
								<div class="input-group">
									<input type="text" class="form-control" id="userAddressNumber"
										name="userAddressNumber" placeholder="검색 버튼을 눌러주세요." 
										readonly="readonly"/>
									<span class="input-group-btn">
                                         <button class="btn btn-default" id="userAddressSearchModalBtn" >
											<i class="fa fa-search spaceLeft"></i> &nbsp;&nbsp;우편번호 검색
										</button>
                                    </span>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userAddressNumber">기본주소</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="userAddressBasic"
									name="userAddressBasic" 
									readonly="readonly"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userAddressDetail">상세주소</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="inputAddressDetail"
									name="userAddressDetail" placeholder="나머지 주소를 입력해주세요" />
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-6 col-md-offset-3">
								<div id="message"></div>
								<div id="recaptcha" style="margin: 0 auto;"></div>
								<input id="recaptchaCheck" class="btn btn-default" type="button" value="Check">
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-12 text-center">
								<button id="joinSubmitBtn" class="btn btn-primary" type="submit">
									회원가입<i class="fa fa-check spaceLeft"></i>
								</button>
								<button class="btn btn-danger" type="submit">
									가입취소<i class="fa fa-times spaceLeft"></i>
								</button>
							</div>
						</div>

						
					</form>
					<hr>
				</div>
			</article>

		</div>
		<!-- /.row -->

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; GigaBox 2017</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->
	
	 <!-- Modal -->
     <div class="modal fade" id="addrModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title" id="myModalLabel">우편번호 검색</h4>
                 </div>
                 <div class="modal-body">
                      <form id="addrSearchForm" onsubmit="return false;">
						   <strong>도로명, 건물명, 읍/면/동(지번), 사서함, 우편번호 등 검색하고자 하는
							주소 검색어를 입력하세요.<br>
							- 도로명 + 건물번호 (예) 도움5로 19<br>
							- 건물명 (예) 우정사업본부<br>
							- 읍/면/동/리 + 지번 (예) 어진동 307-19<br>
							- 사서함 + 사서함번호 (예) 광화문우체국사서함 45<br>
							</strong>
						    <br><br>
						    <input name="target" value="postNew" type="hidden">
						    <input name="query" id="query" type="text">
						    <input value="검색" id="addrSearchBtn" type="button">
						</form>
						<p>
						</p>
						<div>
						    <table id="addrListTable" class="table table-bordered table-hover">
						        <thead>
						            <tr>
						                <th>우편번호</th>
						           		<th>내용</th>
						            </tr>
						        </thead>
						        <tbody id="zipcodeList"></tbody>
						    </table>
						</div>
                   </div>
                   <div class="modal-footer">
                       <button id="addrModalCloseBtn" type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                   </div>
               </div>
               <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
  </div>
  <!-- /.modal -->
	
	<!-- jQuery -->
	<script src="/resources/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			
			// 주소 검색 모달 창 띄우기
			$('#userAddressSearchModalBtn').click(function(e) {
			    e.preventDefault();
			    $('#addrModal').modal({
			        show: true, 
			        backdrop: 'static',
			        keyboard: true
			     });
			});
			
			
			// RECAPCHAR 사용
			var siteKey = "6Lf3xCQUAAAAAJZT2saza0khBpZCn4bEx4RLWzbe";
		    var div = "recaptcha";
		    Recaptcha.create(siteKey, div, {theme: "white"});
		         
		    $("#recaptchaCheck").click(function(){
		         
		        var challenge = Recaptcha.get_challenge();
		        var response = Recaptcha.get_response();
		        var host = $(location).attr('host');
		         
		        $.ajax({
		            type: "POST",
		            url: "/test/validateRecaptcha",
		            async: false,
		            data: {
		                host: host,
		                challenge: challenge,
		                response: response
		            },
		            success: function(data) {
		                if(data == "Y") {
		                    document.getElementById("message").innerHTML = "성공하셨습니다!";
		                    $("#message").css('color', 'green');
		                }else{
		                    document.getElementById("message").innerHTML = "실패하셨습니다! 다시 시도해 주세요!";
		                    $("#message").css('color', 'red');
		                    Recaptcha.reload();
		                }
		            }
		        });
		         
		    });
		    
		    
		    // 모달에서 주소 검색 버튼 클릭
		    $('#addrSearchBtn').click(function(e){
                e.preventDefault();
                 
                $.ajax({
                    url: '<c:url value="/test/zipcode/list"/>',
                    data: $('#addrSearchForm').serialize(),
                    type: 'POST',
                    dataType: 'json',
                    success: function(result) {
                        $("#zipcodeList").empty();
                         
                        var html = '';
                         
                        if (result.errorCode != null && result.errorCode != '') {
                            html += '<tr>';
                            html += '   <td colspan="2" id="noList">';
                            html +=         result.errorMessage;
                            html += '   </td>';
                            html += '</tr>';
                             
                        } else {
                            var list = result.addrList;
                             
                            for(var i = 0; i < list.length ; i++) {
                                html += '<tr>';
                                html += '   <td>';
                                 
                                var zipcode = list[i].zipcode;
                                 
                                if (zipcode != null && zipcode.length > 5) {
                                    var preZipcode = zipcode.substring(0, 3);
                                    var afterZipcode = zipcode.substring(3, 6);
                                     
                                    zipcode = preZipcode + '-' + afterZipcode;
	                            }
	                                 
	                            html +=         zipcode;
	                            html += '   </td>';
	                            html += '   <td>';

	                            if (list[i].lnmAddress != null && list[i].lnmAddress != '') {
	                                html +=     list[i].lnmAddress;
	                                html += '   <br/>';
	                            }
                                 
                                html +=         list[i].address;
                                html += '   </td>';
                                html += '</tr>';
                            }
                        }
                         
                        $("#zipcodeList").append(html); 
                    }
                });
            });
		    
		    
		 	// 모달에서 테이블 행 클릭시
		    $('#zipcodeList').on("click", "tr",function(event) {
		    	console.log($(this).children("td:eq(0)").text());
		    	console.log($("#noList").length == 0);
	           	if ($("#noList").length == 0) {
	           		$("#userAddressNumber").val($(this).children("td:eq(0)").text());
	           		$("#userAddressBasic").val($(this).children("td:eq(1)").text());
	           		$("#addrModalCloseBtn").trigger("click");
	           	} 
		    });
		    
		});
		
		
		
	</script>

</body>
</html>