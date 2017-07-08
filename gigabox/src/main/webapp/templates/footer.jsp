<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
footer {
	overflow: hidden;
	font-size: 1.2em;
	color: #ffffff;
	background-color: #333333;
}
</style>
<footer>
    
    
    <div class="row">
    	<div class="col-lg-12">
			<div class="col-lg-3 pull-left">
				<a href="/" title="GIGABOX 메인으로 가기"><img src="/resources/images/logo_giga.png" alt="GIGABOX"
					style="margin-left: 15%; width: 80%; height: 50px;"></a>
			</div>
		
			<div class="col-lg-9 pull-left">
				<ul class="list-inline" style="font-size: 1.2em;">
					<li> 회사소개 &nbsp;&nbsp; | </li>
					<li>채용정보&nbsp;&nbsp; | </li>
					<li>제휴/광고/부대사업 문의&nbsp;&nbsp; | </li>
					<li>이용약관&nbsp;&nbsp; | </li>
					<li>개인정보 처리방침&nbsp;&nbsp; | </li>
					<li>고객센터</li>
				</ul>
			</div>
		</div>
		
		<div class="col-lg-12" style="margin-left: 5%; font-size: 1.2em;">
			<br><br>
			서울특별시 강남구 도산대로 156, 2층 기가박스(주) (논현동, 중앙엠앤비사옥) <br>
			대표자명 김진환  |  개인정보보호 책임자 경영지원실 실장 이재원 <br>
			사업자등록번호 211-86-59478  |  통신판매업신고번호 제 833호 <br><br>
		</div>
		<div class="col-lg-12" style="text-align: right; font-size: 1.2em;">
			&copy; Copyright 2017 by GIGABOX. All rights reserved
		</div>
		
	</div>
</footer>

	 <!-- 이메일 인증 비정상 처리시 모달 -->
	 <!-- Modal -->
     <div class="modal fade" id="emailAuthErrorModal" tabindex="-1" role="dialog" aria-labelledby="emailAuthErrorLabel" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title" id="emailAuthErrorLabel">회원 가입 인증 오류</h4>
                 </div>
                 <div class="modal-body">
                      <i class="fa fa-fa-exclamation-triangle fa-3x"></i>
                      <span>회원가입 인증에 오류가 발생하였습니다.<br>관리자에게 문의해 주세요.</span>
                 </div>
                 <div class="modal-footer">
                     <button type="button" id="emailAuthErrorModalCloseButton" class="btn btn-danger errorModalClose" data-dismiss="modal">닫기</button>
                 </div>
             </div>
             <!-- /.modal-content -->
	      </div>
	      <!-- /.modal-dialog -->
	  </div>
	  <!-- /.modal -->
	 <!-- 이메일 인증 정상 처리시 모달 -->
	 <!-- Modal -->
     <div class="modal fade" id="emailAuthOKModal" tabindex="-1" role="dialog" aria-labelledby="emailAuthOKLabel" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title" id="emailAuthOKLabel">회원 가입 인증 정상 처리</h4>
                 </div>
                 <div class="modal-body">
                      <i class="fa fa-fa-exclamation-triangle fa-3x"></i>
                      <span>회원가입이 정상 처리되었습니다. 로그인 해 주세요.</span>
                 </div>
                 <div class="modal-footer">
                     <button type="button" id="emailAuthOKModalCloseButton" class="btn btn-danger" data-dismiss="modal">닫기</button>
                 </div>
             </div>
             <!-- /.modal-content -->
	      </div>
	      <!-- /.modal-dialog -->
	  </div>
	  <!-- /.modal -->
	  
	  <!-- Modal -->
     <div class="modal fade" id="alreadyModal" tabindex="-1" role="dialog" aria-labelledby="alreadyLabel" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title" id="alreadyLabel">영화 예매 오류</h4>
                 </div>
                 <div class="modal-body">
                      <i class="fa fa-fa-exclamation-triangle fa-3x"></i>
                      <span>이미 동일한 영화가 예약되어있습니다.</span>
                 </div>
                 <div class="modal-footer">
                     <button type="button" id="alreadyModalCloseButton" class="btn btn-danger" data-dismiss="modal">닫기</button>
                 </div>
             </div>
             <!-- /.modal-content -->
	      </div>
	      <!-- /.modal-dialog -->
	  </div>
	  <!-- /.modal -->
	  
	  <!-- Modal -->
     <div class="modal fade" id="canceledModal" tabindex="-1" role="dialog" aria-labelledby="canceledLabel" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title" id="canceledLabel">영화 예매 오류</h4>
                 </div>
                 <div class="modal-body">
                      <i class="fa fa-fa-exclamation-triangle fa-3x"></i>
                      <span>취소하신 영화입니다.</span>
                 </div>
                 <div class="modal-footer">
                     <button type="button" id="canceledModalCloseButton" class="btn btn-danger" data-dismiss="modal">닫기</button>
                 </div>
             </div>
             <!-- /.modal-content -->
	      </div>
	      <!-- /.modal-dialog -->
	  </div>
	  <!-- /.modal -->
	  
	 <!-- 이메일 인증 안하고 로그인시 모달 -->
	 <!-- Modal -->
     <!-- <div class="modal fade" id="addrModal" tabindex="-1" role="dialog" aria-labelledby="emailAuthNotYet" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title" id="emailAuthNotYet">회원 가입 인증 오류</h4>
                 </div>
                 <div class="modal-body">
                 	  <i class="fa fa-fa-exclamation-triangle fa-3x"></i>
                      <span>회원가입 인증 후 다시 로그인 해 주세요.</span>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                 </div>
             </div>
             /.modal-content
	      </div>
	      /.modal-dialog
	  </div>
	  /.modal -->

<script type="text/javascript">
	
	$(document).ready(function() {
		
		if ('${param.popup}' == 'already') {
			$('#alreadyModal').modal({
		        show: true, 
		        backdrop: 'static',
		        keyboard: true
		     });
		} else if ('${param.popup}' == 'canceled') {
			$('#canceledModal').modal({
		        show: true, 
		        backdrop: 'static',
		        keyboard: true
		     });
		}
		
		// 현재 URL 가져오기
	    var url = location.href;

	    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
	    var parameter = (url.slice(url.indexOf('?pageAction=') + 12, url.length));
		console.log(parameter);
		if (parameter == 'emailAuthOK') {
			 $('#emailAuthOKModal').modal({
		        show: true, 
		        backdrop: 'static',
		        keyboard: true
		     });
		} else if (parameter == 'emailAuthError') {
			 $('#emailAuthErrorModal').modal({
		        show: true, 
		        backdrop: 'static',
		        keyboard: true
		     });
		}
		
		$("#emailAuthErrorModalCloseButton").on("click", function(e) {
			e.preventDefault();
			$("#emailAuthErrorModal").modal("hide");
		});
		$("#emailAuthOKModalCloseButton").on("click", function(e) {
			e.preventDefault();
			$("#emailAuthOKModal").modal("hide");
			$("#loginDropDown").prop("aria-expanded", "true");
		});
		$("#alreadyModalCloseButton").on("click", function(e) {
			e.preventDefault();
			$("#alreadyModal").modal("hide");
		});
		$("#canceledModalCloseButton").on("click", function(e) {
			e.preventDefault();
			$("#canceledModal").modal("hide");
		});
		
	});
	
</script>
