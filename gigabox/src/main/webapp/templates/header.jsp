<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
ol.inline, ol.unstyled, ul.inline, ul.unstyled {
    margin-left: 0;
    list-style: none;
    
}
.unstyled a {
	text-decoration: none;
    color: black;
    font-weight: 400;
}


</style>
<header>
	<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">
                	<img src="/resources/images/logo_giga_white.png" style="height: 50px; margin-top: -10px;" alt="GIGABOX">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-center" style="text-align: center; font-size: 1.2em;">
                    <li>
                        <a href="/movie/movieList" style="height: 60px; width: 170px;">영화</a>
                    </li>
                    <li>
                        <a href="/cinema/branchList" style="height: 60px; width: 170px;">영화관</a>
                    </li>
                    <li>
                        <a href="/reservation/resvMain" style="height: 60px; width: 170px;">빠른 예매</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="width: 170px;">전체 메뉴 <b class="caret"></b></a>
                        <div id="totalMenuWindow" class="dropdown-menu" style="width: 600px; height: 200px; margin-top: 10px; margin-left: -430px;">
							<div class="well well-default" style="font-size: 1.2em;">
								<div class="row">
									<div class="col-md-12" style="border-bottom: 1px #555555 solid;">
				                        <h4><i class="fa fa-fw fa-th-list"></i> 전체 메뉴</h4>
				                        <br>
				                    </div>
				                </div>
				                <div class="row">
				                    <div class="col-md-12">
				                         <div class="row-fluid">
					                        <div class="col-lg-6" style="border-right: 1px #555555 solid; padding-left: 5%;">
					                            <h4 class="title"><i class="fa fa-film"></i> 영화</h4>
					                            <ul class="unstyled">
					                                <li><a href="/movie/movieList?listType=recent">최신 개봉작</a></li>
					                                <li><a href="/movie/movieList?listType=tobe">상영 예정작</a></li>
					                                <li><a href="/cinema/branchList">영화관 찾기</a></li>
					                            </ul>
					                            
					                            <h4 class="title  margin-top-20"><i class="fa fa-ticket"></i> 예매</h4>
					                            <ul class="unstyled">
					                                <li><a href="/reservation/resvInfo">예매 안내</a></li>
					                                <li><a href="/reservation/resvMain">빠른 예매</a></li>
					                            </ul>
												
												<h4 class="title margin-top-20"><i class="fa fa-info-circle"></i> 고객센터</h4>
					                            <ul class="unstyled">
					                                <li><a href="/cc/notice/noticeList">공지사항</a></li>
					                                <li><a href="/cc/faq/faqList">자주 묻는 질문</a></li>
					                                <li><a href="/cc/qna/qnaList">Q&A</a></li>
					                            </ul>  
					                        </div>
					                        <div class="col-lg-6" style="padding-left: 5%;">
					                    
					                            <h4 class="title"><i class="fa fa-users"></i> 회원 서비스</h4>
					                            <ul class="unstyled">
					                                <li><a href="/user/findInfoForm">ID/PW 찾기</a></li>
					                                <li><a href="/user/joinAgreeForm">회원 가입</a></li>
					                                <li><a href="/user/modifyForm">회원 정보 수정</a></li>
					                                <li><a href="/user/userLeaveForm">회원 탈퇴</a></li>
					                            </ul>
					                            
					                            <h4 class="title margin-top-20"><i class="fa fa-user"></i> 마이페이지</h4>
					                            <ul class="unstyled">
					                                <li><a href="/mypage/mymovie?listType=1">예매 확인/취소</a></li>
					                                <li><a href="/mypage/mymovie?listType=2">마이무비</a></li>
					                                <li><a href="/mypage/mymovie?listType=3">문의 내역</a></li>
					                            </ul>
					                        </div>
					                    </div>
			                    	</div>
			                    </div>
							</div>
						</div>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" id="loginDropDown" data-toggle="dropdown" style="min-width: 170px; max-height: 60px;">
                        	<span id="loginDropdownSpan">로그인 <b class="caret"></b></span>
                        	<span id="logoutSpan" class="hide"> 
                        		<i class="fa fa-user fa-2x"></i>&nbsp;&nbsp; 
                        		<span class="label label-info" style="margin-top: -10px; vertical-align: middle;">${sessionScope.login.userName} 님</span>
                        	</span> 
                        </a>
                        <div id="loginWindow" class="dropdown-menu" style="margin-top: 10px; width: 400px; height: 300px; margin-left: -230px;">
							<div class="login-box well">
								<form accept-charset="UTF-8" role="form" method="post" action="/user/loginSession"
									id="loginForm">
									<fieldset>
										<legend>로그인</legend>
										<div class="alert alert-danger" id="errorMessageHeader">
										</div>
										<div class="form-group">
											<label for="userId">아이디</label> <input
												name="userId" value='' id="userIdHeader"
												placeholder="ID" type="text"
												class="form-control" />
										</div>
										<div class="form-group">
											<label for="userPw">비밀번호</label> <input name="userPw"
												id="userPwHeader" value='' placeholder="Password" type="password"
												class="form-control" onkeypress="caps_lock(event)"/>
										</div>
										<div class="form-group">
												<!-- Change this to a button or input when using this as a form -->
			                                <button class="btn btn-lg btn-success btn-block" id="loginButton">로그인</button>
										</div>
										<div class="form-group">
											<a href="/user/findInfoForm" class="btn btn-default col-lg-6 m-t-md"> 비밀번호 찾기</a>
											<a href="/user/joinAgreeForm" class="btn btn-default col-lg-6 m-t-md"> 회원가입</a>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
						<div id="logoutWindow" class="dropdown-menu hide" style="width: 400px; height: 150px; margin-left: -230px;">
							<div class="login-box well" style="font-size: 1.2em;">
								${sessionScope.login.userId}님 환영합니다!<br>
								<div class="col-md-12" style="text-align: right;">
									현재 마일리지  <span class="label label-danger">${sessionScope.login.userMileage} point</span>
									<br>
								</div>
								<hr>
								<button class="btn btn-md btn-success btn-block" 
									id="myMovieButton" onclick="window.location.href='/mypage/mymovie?listType=1'">마이페이지</button>
								<button class="btn btn-md btn-success btn-block" 
									id="logoutButton" onclick="window.location.href='/user/logout'">로그아웃</button>
							</div>
						</div>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

</header>

<script type="text/javascript">
		
		function formCheckHeader(v_item, v_name, e_item) {
			if (v_item.val().replace(/\s/g, "") == "") {

				e_item.text(v_name + " 입력해 주세요.");
				e_item.show();
				v_item.val("");
				v_item.focus();
				return false;
			} else {
				return true;
			}
		}
		
		//capslock 체크
		function caps_lock(e){
			var keyCode = 0;
			var shiftKey = false;
			keyCode = e.keyCode;
			shiftKey = e.shiftKey;
			if(((keyCode >= 65 && keyCode <= 90)&& !shiftKey)||((keyCode >= 97 && keyCode <= 122)&& shiftKey))
			{
				$("#errorMessageHeader").text("Caps Lock 키가 눌려있습니다.");
				$("#errorMessageHeader").removeClass("hide");
	        } else {
	            $("#errorMessageHeader").addClass("hide");
	        }
	    }

		$(document).ready(function() {
			   
			$("#errorMessageHeader").addClass("hide");
		    
			if ("${sessionScope.login.userId}" != "") {
				$("#loginDropdownSpan").addClass("hide");
				$("#logoutSpan").removeClass("hide");
				$("#loginWindow").addClass("hide");
				$("#logoutWindow").removeClass("hide")
			} else {
				$("#logoutWindow").addClass("hide");
			}
			
			// 현재 URL 가져오기
		    var url = location.href;

		    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
		    var parameter = (url.slice(url.indexOf('?pageAction=') + 12, url.length));
			if (parameter == 'login') {
				//alert("회원 가입 신청이 정상적으로 처리되었습니다. \n이메일 인증 후 로그인 해 주세요.");
				$("#loginDropDown").trigger("click");
			}

			//로그인버튼 클릭
			$("#loginButton").click(function(e) {
				e.preventDefault();
				if (!formCheckHeader($("#userIdHeader"), "아이디를", $("#errorMessageHeader"))) {
					$("#errorMessageHeader").removeClass("hide");
					return;
				}
				if (!formCheckHeader($("#userPwHeader"), "비밀번호를", $("#errorMessageHeader"))) {
					$("#errorMessageHeader").removeClass("hide");
					return;
				}
				
				 $.ajax({
					url: "/user/login",
					type: "POST",
					data: $("#loginForm").serialize(),
					error: function() {
						$("#errorMessageHeader").text("시스템 오류입니다.");
						$("#errorMessageHeader").show();
					},
					success: function(resultData) {
						if (resultData.message == 'ID-MISSING') {
							$("#errorMessageHeader").text("해당 계정이 존재하지 않습니다.");
							$("#errorMessageHeader").removeClass("hide");
							$("#userIdHeader").val("");
							$("#userPwHeader").val("");
							$("#userIdHeader").focus();
						} else if (resultData.message == 'PW-WRONG') {
							$("#errorMessageHeader").text("비밀번호가 일치하지 않습니다.");
							$("#errorMessageHeader").removeClass("hide");
							$("#userPwHeader").val("");
							$("#userPwHeader").focus();
						} else if (resultData.message == 'LEAVE-MEMBER') {
							$("#errorMessageHeader").text("탈퇴된 회원입니다.");
							$("#errorMessageHeader").removeClass("hide");
							$("#userIdHeader").val("");
							$("#userPwHeader").val("");
							$("#userIdHeader").focus();
						} else if (resultData.message == 'BLIND-MEMBER') {
							$("#errorMessageHeader").text("블라인드된 회원입니다.\n관리자에게 문의해 주세요.");
							$("#errorMessageHeader").removeClass("hide");
							$("#userIdHeader").val("");
							$("#userPwHeader").val("");
							$("#userIdHeader").focus();
						} else if (resultData.message == 'WAIT-MEMBER') {
							$("#errorMessageHeader").text("인증 대기중입니다.\n이메일을 확인해 주세요.");
							$("#errorMessageHeader").removeClass("hide");
							$("#userIdHeader").val("");
							$("#userPwHeader").val("");
							$("#userIdHeader").focus();
						} else if (resultData.message == 'LOGIN-SUCCESS') {
							$("#loginForm").submit();
						} else if (resultData.message == 'ERROR') {
							$("#errorMessageHeader").text("시스템 오류입니다.");
							$("#errorMessageHeader").removeClass("hide");
						}
					} 
					});
				});
			});
	</script>