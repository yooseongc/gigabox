<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/movieRatingTag.tld"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GigaBox - 영화관 찾기</title>
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

<style>
     

.tabs-left {
  margin-top: 3rem;
  background-color: black;
  margin-bottom: 3rem;
}

.nav-tabs {
  float: left;
  border-bottom: 0;
  height: 610px;
  background-color: white;
  border: 2px solid #efefef;
}
.nav-tabs li {
  float: none;
  margin: 0;
  height: 40px;
  width: 120px;
  text-align: center;
}
.nav-tabs li a {
  margin: 0 0;
  border: 0;
  background-color: #efefef;
  text-decoration: none;
  font-size: 1.1em;
}
.nav-tabs li a:hover {
  background-color: #444;
}

.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
  border: 0;
}

.tab-content {
  margin-left: 45px;
  height: 610px;
  background-color: white;
  border: 2px solid #efefef;
  margin-bottom: 3rem;
  font-size: 1.2em;
  text-align: center;
  color: #777777;
}
.tab-content .tab-pane {
  display: none;
  background-color: #fff;
  padding: 1.6rem;
  overflow-y: auto;
}
.tab-content .active {
  display: block;
}

.list-group {
  width: 100%;
}
.list-group .list-group-item {
  height: 40px;
}
.list-group .list-group-item h4, .list-group .list-group-item span {
  line-height: 11px;
}

</style>
<!-- google map api -->
<script type="text/javascript" 
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBeynzuOxYNEktxWHuq-satcvafbYmG47o">
</script>
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<script type="text/javascript">
    function initialize(cinemaName, cinemaAddr) {
     
        var mapOptions = {
                            zoom: 18, // 지도를 띄웠을 때의 줌 크기
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
         
         
        var map = new google.maps.Map(document.getElementById("branchGoogleMap"), // div의 id과 값이 같아야 함. "map-canvas"
                                    mapOptions);
         
        
        // Geocoding *****************************************************
        var address = cinemaAddr; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
        var marker = null;
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker = new google.maps.Marker({
                                map: map,
                                title: 'GIGABOX' + cinemaName, // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                                position: results[0].geometry.location
                            });
 
                var content = "GIGABOX<br>" + cinemaName; // 말풍선 안에 들어갈 내용
             
                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({ content: content});
                google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
            } else {
                console.log("Geocode was not successful for the following reason: " + status);
            }
        });
        // Geocoding // *****************************************************
         
    }
    //google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>

	<!-- header -->
	<c:import url="/templates/header.jsp" />
	<div>
		<img src="http://image2.megabox.co.kr/mop/home/theater/bg.jpg"
			width="100%" height="500" style="">
	</div>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					영화 <small id="pageType">영화관 찾기</small>
				</h1>
				<ol class="breadcrumb">
					<li>GIGABOX</li>
					<li>영화</li>
					<li class="active" id="pageType2">영화관 찾기</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-md-4">
				<div class="tabs-left">
			        <ul class="nav nav-tabs">
			        	<li class="active"><a href="#선택" data-toggle="tab">지역</a></li>
			        	<c:forEach items="${location}" var="loc">
			        		<li><a href="#${loc}" data-toggle="tab">${loc}</a></li>
			        	</c:forEach>
			           <!--  <li><a href="#서울" data-toggle="tab">서울</a></li>
			            <li><a href="#경기" data-toggle="tab">경기</a></li>
			            <li><a href="#인천" data-toggle="tab">인천</a></li>
			            <li><a href="#충청" data-toggle="tab">충청</a></li>
			            <li><a href="#대전" data-toggle="tab">대전</a></li>
			            <li><a href="#세종" data-toggle="tab">세종</a></li>
			            <li><a href="#전라" data-toggle="tab">전라</a></li>
			            <li><a href="#광주" data-toggle="tab">광주</a></li>
			            <li><a href="#경상" data-toggle="tab">경상</a></li>
			            <li><a href="#대구" data-toggle="tab">대구</a></li>
			            <li><a href="#울산" data-toggle="tab">울산</a></li>
			            <li><a href="#부산" data-toggle="tab">부산</a></li>
			            <li><a href="#강원" data-toggle="tab">강원</a></li>
			            <li><a href="#제주" data-toggle="tab">제주</a></li> -->
			        </ul>
			        <div class="tab-content">
			        	<div class="tab-pane active" id="선택">
			        		
			        	</div>
			        	<c:forEach items="${location}" var="loc">
			        		<div class="tab-pane" id="${loc}">
			        			<ul class="list-group pull-left">
					        		<c:forEach items="${branchList}" var="branchItem">
					        			<c:if test="${fn:contains(branchItem, loc)}">
						                	 <a href="/cinema/branchDetail/${branchItem.branchNumber}" class="list-group-item list-group-item-action">
						                	 	${branchItem.branchName}
						                	 </a>
					        			</c:if>
									</c:forEach>
								</ul>
							</div>
						</c:forEach>
			        </div><!-- /tab-content -->
			      </div><!-- /tabbable -->
			</div>
			<div class="col-md-8 tabs-left tab-content" style="margin-left: 0;">
				<c:if test="${branchDetail != null}">
					<input type="hidden" value="${branchDetail.branchNumber}">
					<br>
                    <div class="jumbotron" id="branchPictureView"
                         style="height: 200px; background-image: url(http://choiys3574.cafe24.com/upload/gigabox/branch/${branchDetail.branchNumber}/${branchDetail.branchNumber}.jpg); background-size: 100% auto;">
					</div>
                    <div class="list-group">
                        <div class="list-group-item row">
                        	<div class="text-muted col-sm-3" style="width: 15%; ">지점 주소</div>
                        	<div class="col-sm-9" style="width: 80%; text-overflow: clip;" data-id="branchAddress">${branchDetail.branchAddress}</div>
                        	<!-- 구글 맵 -->
                        	<hr>
                        	<div class="well col-md-12" id="branchGoogleMap" 
                        		style="width:100%; height: 300px !important;">
                        	
                        	</div>
                        	<script type="text/javascript">
            					$(document).ready(function() {
            						var loc = "${branchDetail.branchName}".split(" ")[0];
            						$("a[href='"+"#"+loc+"']").trigger("click");
            						$("a[href='/cinema/branchDetail/${branchDetail.branchNumber}']").addClass("active");
	                        		initialize('${branchDetail.branchName}', '${branchDetail.branchAddress}');
            					});
                        	</script>
                        </div>
                    </div>
                    <!-- /.list-group -->
				</c:if>
			</div>
		</div>
		<!-- /.row -->

		<!-- 		<img src="http://image2.megabox.co.kr/mop/home/map/world2.jpg"> -->


<script type="text/javascript">
var tabsFn = (function() {
	  
	  function init() {
	    setHeight();
	  }
	  
	  function setHeight() {
	    var $tabPane = $('.tab-pane'),
	        tabsHeight = $('.nav-tabs').height();
	    
	    $tabPane.css({
	      height: tabsHeight
	    });
	  }
	    
	  $(init);
	})();
</script>
<script>
$(document).ready(function(){

	  $('.next').click(function(){
	  
	    var nextId = $(this).parents('.tab-pane').next().attr("id");
	    $('[href=#'+nextId+']').tab('show');
	    return false;
	    
	  })
});
</script>

	</div>
	<!-- /.container -->

	<!-- footer -->
	<c:import url="/templates/footer.jsp" />

</body>
</html>