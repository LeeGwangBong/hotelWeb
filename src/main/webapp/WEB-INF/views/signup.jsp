<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="Eden Travel Template">
<meta name="author" content="Themefisher.com">

<title>IT WILL | Hotel</title>

<!-- Mobile Specific Meta-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap.min css -->
<link rel="stylesheet"	href="/hotel/resources/plugins/bootstrap/css/bootstrap.min.css">
<!-- Ionic Icon Css -->
<link rel="stylesheet"	href="/hotel/resources/plugins/Ionicons/css/ionicons.min.css">
<!-- Flaticon Css -->
<link rel="stylesheet"	href="/hotel/resources/plugins/flaticon/font/flaticon.css">
<!-- animate.css -->
<link rel="stylesheet"	href="/hotel/resources/plugins/animate-css/animate.css">
<link rel="stylesheet"	href="/hotel/resources/plugins/nice-select/nice-select.css">
<!-- DATE PICKER -->
<link href="/hotel/resources/plugins/bootstrap-datepicker-master/bootstrap-datepicker.min.css" type="text/css" rel="stylesheet" />
<!-- Magnify Popup -->
<link rel="stylesheet"	href="/hotel/resources/plugins/magnific-popup/dist/magnific-popup.css">
<!-- Owl Carousel CSS -->
<link rel="stylesheet"	href="/hotel/resources/plugins/slick-carousel/slick/slick.css">
<link rel="stylesheet"href="/hotel/resources/plugins/slick-carousel/slick/slick-theme.css">

<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="/hotel/resources/css/style.css">

<!-- font -->
  <link href="https://fonts.googleapis.com/css?family=Gothic+A1:100|Noto+Serif+KR:200&display=swap&subset=korean" rel="stylesheet">
  
	<style type="text/css">
	
	*:not(i){
		font-family: 'Noto Serif KR', serif!important;
	}
	
	</style>

<!-- Kakao 톡상담 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<script type="text/javascript">

function sendIt(){
	
	var f = document.myForm;
	
	str = f.userId.value;
	str = str.trim();
	
	if(!str){
		alert("아이디를 입력하세요");
		f.userId.focus();
		return;
	}
	f.userId.value = str;
	
	
	/* if(f.idDuplication.value != "idCheck") {
		alert("아이디 중복체크 해주세요.");
		return;
	} */
	
	str = f.userPwd.value;
	str = str.trim();
	
	if(!str){
		alert("패스워드를 입력하세요");
		f.userPwd.focus();
		return;
	}
	/* if(str != f.okPwd.value){
		alert("패스워드가 일치하지 않습니다");
		f.okPwd.focus();
		return;
	} */
	f.userPwd.value = str;
	
	str = f.userName.value;
	str = str.trim();
	
	if(!str){
		alert("이름을 입력하세요");
		f.userName.focus();
		return;
	}
	f.userName.value = str;
	
	str = f.birth.value;
	str = str.trim();
	
	if(!str){
		alert("생일을 입력하세요");
		f.birth.focus();
		return;
	}
	f.birth.value = str;
	
	str = f.tel.value;
	str = str.trim();
	
	if(!str){
		alert("전화번호를 입력하세요");
		f.tel.focus();
		return;
	}
	f.tel.value = str;
	
	str = f.email.value;
	str = str.trim();
    if(!str) {
        alert("\nE-Mail을 입력하세요. ");
        f.email.focus();
        return;
    }
	f.email.value = str;
	
	
	
	f.action = "<%=cp %>/signup_ok.action";
	f.submit();
}
<%-- 
// 아이디 중복체크 화면 open
function openIdChk() {
	var f = document.myForm;
	
	if(!f.userId.value){
		alert("아이디를 입력하세요");
		f.userId.focus();
		return;
	}
	
	var id = f.userId.value;	
	url = "<%=cp %>/itwillbook/id_check.do?id="+id;
	open(url,"chkForm","width=500, height=300, resizable=no, scrollbars=no");
}


function inputIdChk() {
	document.myForm.idDuplication.value ="idUncheck";
	// 아이디 value에 값 입력 시 idDuplication.value가 바로 idUnchek로 바뀜
}

 --%>
</script>

<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript">

		function openDaumZipAddress() {

			new daum.Postcode({

				oncomplete:function(data) {

					jQuery("#address").val(data.address);

					jQuery("#address").focus();

					console.log(data);
				}
			}).open();
		}

	</script>

</head>
<body>

	<!-- Header Start -->
	
<header class="navigation">
<div class="top-header py-2">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-8">
				<div class="top-header-left text-muted">
					<b>IT WILL HOTEL</b>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="currentDate" style="font-size:12px;"></span>
					<span style="font-size:12px;">서초구</span>
					<span id="icon"></span>
					<span id="todayTemp" style="font-size:12px;"></span>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="top-header-right float-right">
					<ul class="list-unstyled mb-0">
						<li class="top-contact">
							
							<c:choose>
								<c:when test="${empty sessionScope.login.userId }">
									<span class="text-color">
										<a href="login.action">로그인</a> / 
										<a href="signup.action">회원가입</a>
									</span>
								</c:when>
							
								<c:otherwise>
									<span class="text-color">${sessionScope.login.userName }님 안녕하세요:)
									</span>
										<a href="logout.action">&nbsp;&nbsp;로그아웃</a> / 
										
										<c:if test="${sessionScope.login.userId ne 'admin'}">
											<a href="myPage.action">마이페이지</a>
										</c:if>
										
										<c:if test="${sessionScope.login.userId eq 'admin'}">
											<a href="admin.action">관리자</a>
										</c:if>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

	<nav class="navbar navbar-expand-lg bg-white w-100 p-0" id="navbar">
		<div class="container">
		  <a class="navbar-brand" href="/hotel"><img src="/hotel/resources/images/logo.png" alt="Eden" class="img-fluid"></a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
			<span class="fa fa-bars"></span>
		  </button>
	  
		  <div class="collapse navbar-collapse" id="navbarsExample09">
			<ul class="navbar-nav ml-auto">
			  <li class="nav-item active">
				<a class="nav-link" href="/hotel">Home <span class="sr-only">(current)</span></a>
			  </li>
			  
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">About Us </a>
				<ul class="dropdown-menu" aria-labelledby="dropdown02">
				  <li><a class="dropdown-item" href="about.action">About Us</a></li>
				  <li><a class="dropdown-item" href="service.action">Services</a></li>
				  <li><a class="dropdown-item" href="gallery.action">Gallery</a></li>
				</ul>
			  </li>
			  
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rooms</a>
				<ul class="dropdown-menu" aria-labelledby="dropdown02">
				  <li><a class="dropdown-item" href="pricing.action">Pricing</a></li>
				  <li><a class="dropdown-item" href="room-grid.action">Room-Grid</a></li>
				</ul>
			  </li>

			  <li class="nav-item active">
				<a class="nav-link" href="booking-step1.action">Reservation <span class="sr-only">(current)</span></a>
			  </li>
			  
			  <li class="nav-item active">
				<a class="nav-link" href="event-grid.action">Events <span class="sr-only">(current)</span></a>
			  </li>
			  
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Life</a>
				<ul class="dropdown-menu" aria-labelledby="dropdown03">
				  <li><a class="dropdown-item" href="gym">Gym</a></li>
				  <li><a class="dropdown-item" href="restaurantMain.action">Restaurant</a></li>
				  <li><a class="dropdown-item" href="life-spa.action">Spa</a></li>
				</ul>
			  </li>
			  
			  <li class="nav-item active">
				<a class="nav-link" href="contact.action">Contact Us <span class="sr-only">(current)</span></a>
			  </li>
			  
			</ul>
			<form class="form-inline my-2 my-md-0 ml-lg-4">
			  <a href="booking-step1.action" class="btn btn-main">Book Online</a>
			</form>
		  </div>
		</div>
	</nav>
</header>

	<!-- Header Close -->
	
	<div id="kakao-talk-channel-chat-button" style="position:fixed; right:10px; bottom:0px; z-index:1000;"></div>
	
	<section class="section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 text-center">
				<div class="section-title">
					<p class="section-subtitle">IT WILL HOTEL</p>
					<h2 class="mb-3">회 원 가 입</h2>
					<p class="mb-4">아이티윌 호텔에 오신것을 환영합니다</p>
					<span class="section-border"></span>
				</div>
			</div>
			<!-- .col-md-7 close -->
		</div>

		<div class="row justify-content-center">
			<div class="col-lg-7 col-sm-12">
			
				<form action="javascript:sendIt();" name="myForm" method="post">
					<div class="row justify-content-center">

						<div class="col-lg-10">
							<div class="form-group">
							<p class="section-subtitle">아 이 디 </p>
								<input name="userId" type="text" class="form-control" autocomplete="off">
							</div>
						</div>
						<div class="col-lg-10">
							<div class="form-group">
							<p class="section-subtitle">이    름</p>
								<input name="userName" type="text" class="form-control" autocomplete="off">
							</div>
						</div>
						<div class="col-lg-10">
							<div class="form-group">
							<p class="section-subtitle">비 밀 번 호</p>
								<input name="userPwd" type="password" class="form-control"	>
							</div>
						</div>
						<div class="col-lg-10">
							<div class="form-group">
							<p class="section-subtitle">이 메 일</p>
								<input name="email" type="text" class="form-control" placeholder="" autocomplete="off">
							</div>
						</div>

						<div class="col-lg-10">
							<div class="form-group">
							<p class="section-subtitle">생 년 월 일</p>
								<input name="birth" type="text" class="form-control" placeholder="YYYY-MM-DD" autocomplete="off">
							</div>
						</div>
						<div class="col-lg-7">
							<div class="form-group">
							<p class="section-subtitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주    소</p>
								<input name="addr" id="address" type="text" class="form-control" placeholder="주소를 입력해주세요" autocomplete="off">
							</div>
						</div>
						<div class="col-lg-3">
							<div class="form-group">
								<p class="section-subtitle">&nbsp;</p>
								<input type="button" class="btn btn-main btn-block" value="주 소 찾 기 " onclick="openDaumZipAddress();">
							</div>
						</div>
						<div class="col-lg-10">
							<div class="form-group">
							<p class="section-subtitle">휴 대 전 화</p>
								<input name="tel" type="text" class="form-control"	placeholder="전화번호 입력" autocomplete="off">
							</div>
						</div>
						<div class="col-lg-10">
							<br/>
							<input type="submit" class="btn btn-main btn-block" value="회 원 가 입" >
							<!-- <button class="btn btn-main" type="submit" onclick="sendIt();">회 원 가 입</button> -->
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	</section>

<!-- footer Start -->
<footer class="footer pb-md-5 pb-sm-5 secondary-bg pb-0">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="widget footer-widget">
					<div class="footer-logo footer-title mb-4"><h3>IT Will</h3></div>
					<p>한국의 전통미와 현대적인 감각을 겸비하고 있는 세계속의 명문호텔, <br/>아이티윌 호텔은 세계 최고의 어번(urban) 라이프 스타일 호텔로 고객들에게 최고급 서비스를 제공합니다.</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 mb-md-4 mb-sm-4">
				<div class="widget footer-widget">
					<h3 class="mb-4">주소</h3>
					<ul class="list-inline footer-address">
						<li class="list-inline-item">
							<i class="ion-android-call"></i>
							 (+233) 123 456789
						</li>
						<li class="list-inline-item">
							<i class="ion-laptop"></i>
							  contact@itwillHotel.com
						</li>
						<li class="list-inline-item">
							<i class="ion-ios-location"></i>
							 서울특별시 테헤란로 15
						</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 mb-md-4 mb-sm-4">
				<div class="widget footer-widget">
					<h3 class="mb-4">빠른링크</h3>
					<ul class="list-unstyled footer-menu mb-0">
						<li>
							<a href="/hotel"><i class="fa fa-angle-right"></i>Home</a>
						</li>

						<li>
							<a href="service.action"><i class="fa fa-angle-right"></i>Services</a>
						</li>

						<li>
							<a href="gallery.action"><i class="fa fa-angle-right"></i>Gallery</a>
						</li>
	
						<li>
							<a href="booking-step1.action"><i class="fa fa-angle-right"></i>Reservation</a>
						</li>
						
						<li>
							<a href="contact.action"><i class="fa fa-angle-right"></i>Contact</a>
						</li>

					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="widget footer-widget">

					<h4 class="my-4">Follow US</h4>

					<ul class="list-inline footer-socials">
						<li class="list-inline-item">
							<a href="#"><i class="ion-social-facebook"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="ion-social-twitter"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="ion-social-pinterest"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="ion-social-linkedin"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="ion-social-rss"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</footer>


	<section class="footer-btm secondary-bg py-4">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="text-center">
					&copy; Copyright TravelPro Reserved to <a href="#">Themefisher</a>-2019
				</div>
			</div>
		</div>
	</div>
	</section>



	</div>

	<!-- 
    Essential Scripts
    =====================================-->


	<!-- Main jQuery -->
	<script src="/hotel/resources/plugins/jquery/jquery.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="/hotel/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Owl Carousel -->
	<script src="/hotel/resources/plugins/slick-carousel/slick/slick.min.js"></script>
	<script src="/hotel/resources/plugins/nice-select/nice-select.js"></script>
	<!--  -->
	<script src="/hotel/resources/plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<!-- Form Validator -->
	<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.32/jquery.form.js"></script>
	<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js"></script>
	<script	src="/hotel/resources/plugins/bootstrap-datepicker-master/bootstrap-datepicker.min.js"></script>

	<!-- Google Map -->
	<script src="/hotel/resources/plugins/google-map/map.js"></script>
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>
	<script src="/hotel/resources/js/script.js"></script>
	
	<!-- Kakao 톡상담 -->
	<script type='text/javascript'>
	
	//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('a876d408c7cc2ab22428d910b1de57af');
		// 카카오톡 채널 1:1채팅 버튼을 생성합니다.
		Kakao.Channel.createChatButton({
			container: '#kakao-talk-channel-chat-button',
			channelPublicId: '_rRxdxgT' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
		});
	//]]>
	
	</script>
	
	<script src="/hotel/resources/js/weather.js"></script>


</body>
</html>
