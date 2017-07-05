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
<!-- jQuery -->
<script src="/resources/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/js/bootstrap.min.js"></script>
<!-- Google Recaptcha -->
<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>

</head>
<body>

	<c:import url="/templates/header.jsp"/>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					회원 서비스 <small>회원 가입</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>회원 서비스</li>
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
					<form class="form-horizontal" id="joinForm" name="frm">
						<fieldset>
						
							<div class="alert alert-danger center-block hide" style="width: 400px;" id="errorMessage"></div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userId">아이디</label>
							<div class="col-sm-6">
								<div class="input-group">
									<input class="form-control" id="userId" type="text"
									name="userId" placeholder="아이디" maxlength="20">
									<span class="input-group-btn">
                                         <button class="btn btn-default" id="userIDCheckBtn" >
											<i class="fa fa-check spaceLeft"></i> &nbsp;&nbsp;중복체크
										</button>
                                    </span>
								</div>
								<p class="help-block">영문 소문자,숫자 6 ~ 20자</p>
								<p class="help-block" id="userIDCheckErrorMsg">중복 여부를 확인하세요.</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userPw">비밀번호</label>
							<div class="col-sm-6">
								<input class="form-control" id="userPw"
									name="userPw" type="password" placeholder="비밀번호" maxlength="12"
									onkeypress="caps_lock(event)"/>
								<p class="help-block">영어 소문자,숫자를 혼합하여 6 ~ 12자 이내</p>
								<p id="capslock" style="display:none">
								&nbsp;<b>CapsLock</b> 키가 눌려있습니다.&nbsp;</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userPasswordCheck">비밀번호
								확인</label>
							<div class="col-sm-6">
								<input class="form-control" id="userPasswordCheck"
									name="userPasswordCheck" type="password" placeholder="비밀번호 확인" maxlength="12">
								<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
								<p id="capslock" style="display:none">
								&nbsp;<b>CapsLock</b> 키가 눌려있습니다.&nbsp;</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userEmail">이메일</label>
							<div class="col-sm-6">
								<div class="input-group">
								<input class="form-control" id="userEmail" type="email"
									name="userEmail" placeholder="이메일">
									<span class="input-group-btn">
                                         <button class="btn btn-default" id="userEmailAuthBtn" >
											<i class="fa fa-check spaceLeft"></i> &nbsp;&nbsp;이메일확인
										</button>
                              		</span>
                              	</div>
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
							<label class="col-sm-3 control-label" for="userBirthday">생년월일</label>
							<div class="col-sm-2">
								<input class="form-control" id="userBirthdayYear" type="number"
									name="userBirthday1" placeholder="년" maxlength="4" 
									onkeyup="if(this.value.length==4)frm.userBirthday2.focus()"
									onkeypress="return digit_check(event)"/>
									<p class="help-block">숫자만 입력해 주세요.</p>
									</div>
									<div class="col-sm-2">
								<input class="form-control" id="userBirthdayMonth" type="number"
									name="userBirthday2" placeholder="월" maxlength="2"
									onkeyup="if(this.value.length==2)frm.userBirthday3.focus()"/>
									</div>
									<div class="col-sm-2">
								<input class="form-control" id="userBirthdayDay" type="number"
									name="userBirthday3" placeholder="일" maxlength="2"
									oninput="maxLengthCheck(this)"/>
								<input type="hidden" name="userBirthday" id="userBirthday">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userGender">성별</label>
								<div class="col-sm-6">
								<label class="radio-inline">
									<input type="radio" name="userGender" value="M">남자</label>
								<label class="radio-inline">
									<input type="radio" name="userGender" value="F">여자</label>
								</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userTel">휴대폰번호</label>
							<div class="col-sm-6">
								<input type="tel" class="form-control" id="userTel"
									name="userTel" placeholder="- 없이 숫자만 입력해 주세요" maxlength="11"
									onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"/>
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
								<input type="text" class="form-control" id="userAddressDetail"
									name="userAddressDetail" placeholder="나머지 주소를 입력해주세요" />
							</div>
						</div>
						
						<input type="hidden" name="userAddr" id="userAddr">
						
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
						</fieldset>
					</form>
					<hr>
				</div>
			</article>

		</div>
		<!-- /.row -->

		<hr>
		
	</div>
	<!-- /.container -->
	
	<!-- Footer -->
	<c:import url="/templates/footer.jsp"/>
	
	 <!-- Modal -->
     <div class="modal fade" id="addrModal" tabindex="-1" role="dialog" aria-labelledby="addrModalLabel" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title" id="addrModalLabel">우편번호 검색</h4>
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
	
	<script type="text/javascript">
		 
	//빈칸 체크
	function formCheck(v_item, v_name, e_item) {
			if (v_item.val().replace(/\s/g, "") == "") {
				
				e_item.text(v_name + " 확인해 주세요.");
				e_item.show();
				v_item.val("");
				v_item.focus();
				return false;
			} else {
				return true;
			}
		}
	//숫자만 입력(생년월일)
	function digit_check(evt){
		     var code = evt.which?evt.which:event.keyCode;
		     if(code<48||code>57){
		         return false;
		     }
		 }
	
	//숫자만 입력(휴대전화)
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
		 
	//maxlength 체크
	function maxLengthCheck(object){
		if (object.value.length > object.maxLength){
			object.value = object.value.slice(0, object.maxLength);
  	 		}    
  		}
	
	//비밀번호 유효성 검사(영문,숫자 혼합하여 6~20자리 이내)
	function chkPwd(str){
		var reg_pwd = /^.*(?=.{6,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		if(!reg_pwd.test(str)){
			return false;
			}
		return true;
		}
				
	//capslock 체크
	function caps_lock(e){
		var keyCode = 0;
		var shiftKey = false;
		keyCode = e.keyCode;
		shiftKey = e.shiftKey;
		if(((keyCode >= 65 && keyCode <= 90)&& !shiftKey)||((keyCode >= 97 && keyCode <= 122)&& shiftKey))
		{
            show_caps_lock();
            setTimeout("hide_caps_lock()", 3500);
        } else {
            hide_caps_lock();
        }
    }

	function show_caps_lock() {
     $("#capslock").show();
	}
	function hide_caps_lock() {
     $("#capslock").hide();
	}
	
	$(document).ready(function() {
			
			var recaptchaConfirm = false;
			
			$("#errorMessage").addClass("hide");
			
			// 아이디 중복 체크 
			$("#userIDCheckBtn").click(function(e) {
				e.preventDefault();
				var idReg=/^[a-z]+[a-z0-9]{5,19}$/g;
		        if(!idReg.test($("#usereId").val())){
		            alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
		            return
		        }
				if ($("#userId").val() != '') {
					$.ajax({
						url: "/user/idduplicationcheck",
						type: "POST",
						dataType: "text",
						headers: {
							"Content-Type": "application/json",
							"X-HTTP-Method-Override": "POST"
						},
						data: JSON.stringify({
							userId: $("#userId").val(),
						}),
						error: function() {
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},
						success: function(result) {
							console.log(result);
							if (result == 0) {
								$("#userIDCheckErrorMsg").css("color", "green").text("사용하실 수 있는 아이디 입니다.");
							} 
							if (result == 1) {
								$("#userIDCheckErrorMsg").css("color", "red").text("이미 사용 중인 입니다.");
							}
							
						}
					});
				}
				else {
					console.log(!formCheck($("#userId"), "아이디중복을", $("#errorMessage")));
				}
			});
			
			//이메일확인 버튼 클릭시
				$("#userEmailAuthBtn").click(function(e) {
				e.preventDefault();
				var eamilAuth = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if(!eamilAuth.test($("input[name=userEmail]").val())){
		            alert("이메일 형식이 올바르지 않습니다.");
		            return;
		        } else {
		        	alert("사용가능한 이메일 입니다.");
		        }
				/* else {
					console.log(!formCheck($("#userId"), "이 메일 형식을", $("#errorMessage")));
				} */
			});
			
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
		            url: "/user/validateRecaptcha",
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
		                    recaptchaConfirm = true;
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
                    url: '<c:url value="/user/zipcode/list"/>',
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
	           	if ($("#noList").length == 0) {
	           		$("#userAddressNumber").val($(this).children("td:eq(0)").text());
	           		$("#userAddressBasic").val($(this).children("td:eq(1)").text());
	           		$("#addrModalCloseBtn").trigger("click");
	           	} 
		    });
		 	
		 	//회원가입 버튼 클릭시
		 	$("#joinSubmitBtn").click(function(e) {
		 		e.preventDefault();
				
		 		console.log(!formCheck($("#userId"), "아이디를", $("#errorMessage")));
				if (!formCheck($("#userId"), "아이디를", $("#errorMessage"))) {
					$("#errorMessage").removeClass("hide");
					return;
				}
				if (!formCheck($("#userPw"), "비밀번호를", $("#errorMessage"))) {
					$("#errorMessage").removeClass("hide");
					return;
				}
				if (!formCheck($("#userPasswordCheck"), "비밀번호 확인을", $("#errorMessage"))) {
					$("#errorMessage").removeClass("hide");
					return;
				}
				if (!formCheck($("#userEmail"), "이메일을", $("#errorMessage"))) {
					$("#errorMessage").removeClass("hide");
					return;
				}
				if (!formCheck($("#userName"), "이름을", $("#errorMessage"))) {
					$("#errorMessage").removeClass("hide");
					return;
				}
				if (!formCheck($("#userTel"), "휴대폰번호를", $("#errorMessage"))) {
					$("#errorMessage").removeClass("hide");
					return;
				}
				
				if ($("#userPw").val() != $("#userPasswordCheck").val()){
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				
				if (!recaptchaConfirm) {
					alert("중복 확인 방지 테스트를 해 주세요.");
					return;
				}
				
				if(!chkPwd( $.trim($("#userPw").val()))){ 

					alert("비밀번호를 확인하세요.\n(영문,숫자를 혼합하여 6~20자 이내)");    

					$("#userPw").val('');
					$("#userPw").focus(); 
					return false;
				}
				
				var userBirthdayYear = $("#userBirthdayYear").val();
				var userBirthdayMonth = $("#userBirthdayMonth").val();
				var userBirthdayDay = $("#userBirthdayDay").val();
				$("#userBirthday").val(userBirthdayYear
						+ userBirthdayMonth + userBirthdayDay);
				
				var userAddressNumber = $("#userAddressNumber").val().replace(/\s/g,"");
				var userAddressBasic = $("#userAddressBasic").val();
				var userAddressDetail = $("#userAddressDetail").val();
				$("#userAddr").attr("value", "("+userAddressNumber+") " 
						+ userAddressBasic + " " + userAddressDetail);
				
				$("#joinForm").attr("method", "POST");
				$("#joinForm").attr("action", "/user/joinForm");
				$("#joinForm").submit();
		 		alert("이메일 인증을 해서 가입을 완료해 주세요.");
		 	});
		    
		});
		
	</script>

</body>
</html>