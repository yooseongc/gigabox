<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
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
    
<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>

</head>
<body>
	
	<!-- header -->
	<c:import url="/templates/header.jsp"/>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					회원 서비스 <small>개인정보 수정</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">회원 서비스</a></li>
					<li class="active">개인정보 수정</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<article>
				<div class="col-md-12">
					<div class="page-header">
						<h1>개인정보 수정 <small>회원님의 정보를 정확히 입력해주세요.</small></h1>
						
					</div>
								
					<form class="form-horizontal" id="modifyForm">
						<fieldset>
						
							<div class="alert alert-danger center-block" style="width: 400px;" id="errorMessage"></div>
						<div class="form-group">
							<div class="text-left">
								<span class='text-center'>
								<a href="/user/changePwForm/${sessionScope.login.userId}" class="text-sm">비밀번호 변경/</a>
								<a href="/user/userLeaveForm/${sessionScope.login.userId}" class="text-sm">회원탈퇴</a></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userId">아이디</label>
							<div class="col-sm-6">
									<input class="form-control" id="userId" type="text"
									name="userId" maxlength="20" value="${userInfo.userId }">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userPw">비밀번호</label>
							<div class="col-sm-6">
								<input class="form-control" id="userPw"
									name="userPw" type="password" placeholder="비밀번호" maxlength="12">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userEmail">이메일</label>
							<div class="col-sm-6">
								<input class="form-control" id="userEmail" type="email"
									name="userEmail" value="${userInfo.userEmail }" readonly="readonly">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userName">이름</label>
							<div class="col-sm-6">
								<input class="form-control" id="userName" type="text"
									name="userName" placeholder="이름" value="${userInfo.userName }">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userBirthday">생년월일</label>
							<div class="col-sm-6">
								<input class="form-control" id="userBirthday" type="text"
									name="userBirthday" placeholder="생년월일" value="${userInfo.userBirthday }">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userTel">휴대폰번호</label>
							<div class="col-sm-6">
								<input type="tel" class="form-control" id="userTel"
									name="userTel" placeholder="- 없이 입력해 주세요" maxlength="11" value="${userInfo.userTel }"/>
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
							<div class="col-sm-12 text-center">
								<button id="modifySubmitBtn" class="btn btn-primary" type="submit">
									수정완료<i class="fa fa-check spaceLeft"></i>
								</button>
								<button id="modifyCancleBtn" class="btn btn-danger" type="submit" >
									수정취소<i class="fa fa-times spaceLeft"></i>
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
	
		$(document).ready(function() {
			
			$("#errorMessage").addClass("hide");
			
			//수정취소버튼 클릭시 메인으로
			$('#modifyCancleBtn').click(function(e){
				
				e.preventDefault();
				location.href ="/";
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
		 	
		   
		 	
		 	//수정완료 버튼 클릭시
		 	$("#modifySubmitBtn").click(function(e) {
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
				
				var userAddressNumber = $("#userAddressNumber").val().replace(/\s/g,"");
				var userAddressBasic = $("#userAddressBasic").val();
				var userAddressDetail = $("#userAddressDetail").val();
				$("#userAddr").attr("value", "("+userAddressNumber+") " 
						+ userAddressBasic + " " + userAddressDetail);
				
				$.ajax({
					type: "POST",
					url: "/user/modifyForm",
					data: $("#modifyForm").serialize(),
					error: function() {
						$("#errorMessage").text("시스템 오류입니다.");
						$("#errorMessage").show();
					},
					success: function(resultData) {
						if (resultData.message == 'PW-WRONG') {
							$("#errorMessage").text("비밀번호가 일치하지 않습니다.");
							$("#errorMessage").show();
							$("#userPw").val("");
							$("#userPw").focus();
						} else if (resultData.message == 'Check-SUCCESS') {
							console.log("modify success!!!");
							$("#modifyForm").submit();
							alert("회원정보가 수정되었습니다.")
							location.href ="/";
						} else if (resultData.message == 'ERROR') {
							$("#errorMessage").text("시스템 오류입니다.");
							$("#errorMessage").show();
						}
					}
				});
		 	});
		});

	</script>

</body>
</html>