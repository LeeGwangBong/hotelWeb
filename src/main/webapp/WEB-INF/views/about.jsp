<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Eden Travel Template">
  
  <meta name="author" content="Themefisher.com">

  <title>Eden | Hotel template</title>

  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="/hotel/resources/plugins/bootstrap/css/bootstrap.min.css">
  <!-- Ionic Icon Css -->
  <link rel="stylesheet" href="/hotel/resources/plugins/Ionicons/css/ionicons.min.css">
  <!-- Flaticon Css -->
  <link rel="stylesheet" href="/hotel/resources/plugins/flaticon/font/flaticon.css">
  <!-- animate.css -->
  <link rel="stylesheet" href="/hotel/resources/plugins/animate-css/animate.css">
  <link rel="stylesheet" href="/hotel/resources/plugins/nice-select/nice-select.css">
  <!-- DATE PICKER -->
  <link href="/hotel/resources/plugins/bootstrap-datepicker-master/bootstrap-datepicker.min.css" type="text/css" rel="stylesheet" />
  <!-- Magnify Popup -->
  <link rel="stylesheet" href="/hotel/resources/plugins/magnific-popup/dist/magnific-popup.css">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="/hotel/resources/plugins/slick-carousel/slick/slick.css">
  <link rel="stylesheet" href="/hotel/resources/plugins/slick-carousel/slick/slick-theme.css">

  <link rel="stylesheet" href="/hotel/resources/https://use.fontawesome.com/releases/v5.7.2/css/all.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="/hotel/resources/css/style.css">

</head>

<body >

<!-- Header Start --> 

<header class="navigation">
<div class="top-header py-2">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-8">
				<div class="top-header-left text-muted">
					45 Queen's Park Rd, Brighton, BN2 oGJ, UK
				</div>
			</div>
			<div class="col-lg-4">
				<div class="top-header-right float-right">
					<ul class="list-unstyled mb-0">
						<li class="top-contact">
							<a href="tel:1881234567 "> <i class="ion-android-call mr-2"></i><span class="text-color">+23-28-12345</span>
							</a>
						</li>

						<li class="language ml-3">
						    <select class="country" name="country">
						      <option>EN</option>
						      <option>FR</option>
						      <option>JA</option>
						      <option>CA</option>
						      <option>FR</option>
						    </select>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

	<nav class="navbar navbar-expand-lg bg-white w-100 p-0" id="navbar">
		<div class="container">
		  <a class="navbar-brand" href="index.html"><img src="/hotel/resources/images/logo.png" alt="Eden" class="img-fluid"></a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
			<span class="fa fa-bars"></span>
		  </button>
	  
		  <div class="collapse navbar-collapse" id="navbarsExample09">
			<ul class="navbar-nav ml-auto">
			  <li class="nav-item active">
				<a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
			  </li>
			  
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
				<ul class="dropdown-menu" aria-labelledby="dropdown2">
					<li><a class="dropdown-item" href="about.html">About Us</a></li>
					<li><a class="dropdown-item" href="service.html">Services</a></li>
					<li><a class="dropdown-item" href="search.html">Advance Search</a></li>
					<li><a class="dropdown-item" href="pricing.html">Pricing</a></li>
					<li><a class="dropdown-item" href="404.html">404 Not found</a></li>
					<li><a class="dropdown-item" href="contact.html">Contact Us</a></li>

					<li class="dropdown dropdown-submenu dropright">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gallery</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown3">
							<li><a class="dropdown-item" href="gallery-3.html">Gallery 3 Col</a></li>
							<li><a class="dropdown-item" href="gallery-4.html">Gallery 4 Col</a></li>
						</ul>
					</li>
			  	</ul>
			  </li>
		
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rooms</a>
				<ul class="dropdown-menu" aria-labelledby="dropdown02">
				  <li><a class="dropdown-item" href="room-list.html">Room List</a></li>
				  <li><a class="dropdown-item" href="room-grid.html">Room-grid</a></li>
				 <li> <a class="dropdown-item" href="room-details.html">Room Details</a></li>
				</ul>
			  </li>

			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Reservation</a>
				<ul class="dropdown-menu" aria-labelledby="dropdown03">
				  <li><a class="dropdown-item" href="booking-step1.html">Select Room</a></li>
				  <li><a class="dropdown-item" href="booking-step2.html">Make Resrvation</a></li>
				  <li><a class="dropdown-item" href="booking-step3.html">Payment</a></li>
				  <li> <a class="dropdown-item" href="confirmation.html">Confirmation</a></li>
				</ul>
			  </li>
			  
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Events</a>
				<ul class="dropdown-menu" aria-labelledby="dropdown04">
				  <li><a class="dropdown-item" href="event-fullwidth.html">Event Fullwidth</a></li>	
				  <li><a class="dropdown-item" href="event-grid.html">Event Grid</a></li>
				  <li><a class="dropdown-item" href="event-single.html">Event Details</a></li>
				</ul>
			  </li>
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Blog</a>
				<ul class="dropdown-menu" aria-labelledby="dropdown05">
				  <li><a class="dropdown-item" href="blog-full-width.html">Blog Full width</a></li>
				  <li><a class="dropdown-item" href="blog-grid.html">Blog Grid</a></li>
				  <li><a class="dropdown-item" href="blog-left-sidebar.html">Blog Left Sidebar</a></li>
				  <li><a class="dropdown-item" href="blog-right-sidebar.html">Blog Right Sidebar</a></li>
				  <li><a class="dropdown-item" href="blog-single-right.html">Blog Details Right Sidebar</a></li>
				  <li><a class="dropdown-item" href="blog-single.html">Blog Details Left Sidebar</a></li>
				</ul>
			  </li>
			</ul>
			<form class="form-inline my-2 my-md-0 ml-lg-4">
			  <a href="booking-step1.html" class="btn btn-main">Book Online</a>
			</form>
		  </div>
		</div>
	</nav>
</header>

<!-- Header Close --> 

<div class="main-wrapper ">
<section class="overly bg-2">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
          <h1 class="text-white py-100">About Us</h1>
      </div>
    </div>
  </div>

  <div class="container-fluid page-border-top">
    <div class="row ">
      <div class="col-lg-12 text-center">
          <div class="page-breadcumb py-2">
            <a href="#" class="text-white">Home</a>
            <span><i class="fa fa-angle-right text-white mx-1" aria-hidden="true"></i></span>
            <a href="#" class="text-white">About Us</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- contact form start -->

<section id="about" class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <div class="section-title">
                    <p class="section-subtitle">About Us</p>
                    <h2 class="mb-3">한국에서 가장 아름다운 호텔 </h2>
                    <p class="mb-4">한국의 전통미와 현대적인 감각을 겸비하고 있는 세계 속의 명문 호텔, 아이티윌 호텔은 세계 최고의 어번(urban) 라이프 스타일 호텔로 고객들에게 최고급 서비스를 제공합니다.</p>
                    <span class="section-border"></span>
                </div>
            </div><!-- .col-md-7 close -->
        </div>


        <div class="row align-items-center">
            <div class="col-lg-6">
                <img src="/hotel/resources/images/rooms/img1.jpg" alt="" class="img-fluid">
            </div>
            <div class="col-lg-6">
                <div class="about-content mt-4 mt-lg-0">
                    <h2 class="mb-3">당신은 우리들의 환대와 서비스에 만족할 것입니다</h2>
                    
					<p>아침식사는 2층의 독서실에서 제공됩니다. 월요일부터 금요일은 오전 7시부터 오전 10:30분까지 제공되며, 주말은 11시까지 연장 제공됩니다. </p>
                  
                    <ul class="list-unstyled my-4">
                        <li>강남 종합컴플렉스까지 도보로 10분 거리에 위치해있습니다</li>
                        <li>호텔 전역에서 5G 무선 인터넷이 24시간 제공됩니다</li>
                        <li>서울일보와 중앙일보가 매일 아침 제공됩니다.</li>
                        <li>24시간 비지니스 센터가 운영됩니다</li>
                       
                    </ul>

                    <a href="service.html" class="btn btn-main">서비스</a>
                </div>
            </div>
        </div>

        <div class="row align-items-center section pb-0">
            <div class="col-lg-6 mb-5 mb-lg-0">
                <h2 class="mb-3">매일 제공되는 조식 메뉴</h2>
               
				<P>삶은 계란과, 그릭 요구르트, 뜨거운 오트밀, 다양한 시리얼과, 머핀 그리고 베이글, 3종류 이상의 잼과 버터, 크림치즈, 땅콩잼, 신선한 과일, 엄선된 국제적 커피와 차, 주스가 제공됩니다.</P>
				<p>글루텐이 포함되지 않은 아모든 밀크와 두유를 요청하시면 이용 가능합니다. 해당 내용은 예약 시 알려주시면 준비하겠습니다. </p>
                <a href="room-grid.html" class="btn btn-solid-border mt-4">객실정보</a>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6">
                <img src="/hotel/resources/images/about/about1.jpg" alt="" class="img-fluid w-100">
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <img src="/hotel/resources/images/about/about2.jpg" alt="" class="img-fluid w-100">
            </div>
        </div>
    </div>
</section>

<section class="section cta" id="cta">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="cta-box mb-5 mb-lg-0">
					<i class="flaticon-bar text-white"></i>
					<h2 class="mt-2 text-white">250</h2>
					<p class="mb-0 text-white text-uppercase">객실</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="cta-box mb-5 mb-lg-0">
					<i class="flaticon-waiter text-white"></i>
					<h2 class="mt-2 text-white">150</h2>
					<p class="mb-0 text-white text-uppercase">스텝</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="cta-box mb-5 mb-lg-0">
					 <i class="flaticon-menu text-white"></i>
					<h2 class="mt-2 text-white">120</h2>
					<p class="mb-0 text-white text-uppercase">메뉴</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="cta-box " >
					<i class="flaticon-restaurant text-white"></i>
					<h2 class="mt-2 text-white">4</h2>
					<p class="mb-0 text-white text-uppercase">레스토랑</p>
				</div>
			</div>
		</div>
	</div>
</section>	


<section class="section" id="about-page">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <div class="section-title">
                    <p class="section-subtitle">왜 우리를 선택하는가</p>
                    <h2 class="mb-3">우리의 기준</h2>
                    <p class="mb-4">한국의 전통미와 현대적인 감각을 겸비하고 있는 세계 속의 명문 호텔, 아이티윌 호텔은 세계 최고의 어번(urban) 라이프 스타일 호텔로 고객들에게 최고급 서비스를 제공합니다.</p>
                    <span class="section-border"></span>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="mb-5">
                    <h3 class="text-capitalize mb-3">높은 만족도</h3>
                    <p>한번 고객은 평생고객으로 만드는 최고의 만족도 자랑</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="mb-5">
                    <h3 class="text-capitalize mb-3">맛있는 조식</h3>
                    <p>매일 아침 펼쳐지는 다양한 조식서비스</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="mb-5">
                    <h3 class="text-capitalize mb-3">비교불가 서비스</h3>
                    <p>동 가격대비 비교불가의 높은 질의 서비스</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="mb-5 mb-lg-0">
                    <h3 class="text-capitalize mb-3">테라스가 있는 정원과 바</h3>
                    <p>답답한 가슴마저 시원하게 뚤리는 정원과 테라스</p>
                </div>
            </div>


            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="mb-5 mb-lg-0">
                    <h3 class="text-capitalize mb-3">물품 카탈로그</h3>
                    <p>자체 기준으로 최고 품질의 물품 리스트 작성 및 제공</p>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="">
                    <h3 class="text-capitalize mb-3">휘트니스 & 수영장</h3>
                    <p>휘트니스와 수영장으로 다양한 여과 활동 제공</p>
                </div>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-lg-12 text-center">
                <h6>우리는 높은 퀄리티의 서비스를 제공합니다. 우리의 서비스를 확인하세요 <a href="service.html">서비스</a></h6>
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
					<div class="footer-logo footer-title mb-4"><h2>Eden</h2></div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet pariatur delectus excepturi debitis ad architecto non, sequi minus quo similique.</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 mb-md-4 mb-sm-4">
				<div class="widget footer-widget">
					<h3 class="mb-4">Address</h3>
					<ul class="list-inline footer-address">
						<li class="list-inline-item">
							<i class="ion-android-call"></i>
							 (+233) 123 456789
						</li>
						<li class="list-inline-item">
							<i class="ion-laptop"></i>
							  contact@sparta.com
						</li>
						<li class="list-inline-item">
							<i class="ion-ios-location"></i>
							 St Amsterdam finland,United Stats of AKY16 8PN
						</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 mb-md-4 mb-sm-4">
				<div class="widget footer-widget">
					<h3 class="mb-4">Quick Links</h3>
					<ul class="list-unstyled footer-menu mb-0">
						<li>
							<a href="#"><i class="fa fa-angle-right"></i>Home</a>
						</li>

						<li>
							<a href="#"><i class="fa fa-angle-right"></i>Services</a>
						</li>

						<li>
							<a href="#"><i class="fa fa-angle-right"></i>Testimonial</a>
						</li>

						<li>
							<a href="#"><i class="fa fa-angle-right"></i>Blog</a>
						</li>

						<li>
							<a href="#"><i class="fa fa-angle-right"></i>Contact</a>
						</li>

					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="widget footer-widget">
					<h3 class="mb-4">Company</h3>

					<ul class="list-unstyled footer-menu mb-0">
						<li><a href="#">Term & Conditions </a></li>

						<li><a href="#">Privacy Policy</a></li>

						<li><a href="#">Site Map </a></li>
					</ul>
					

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


<section class="footer-btm secondary-bg py-4" >
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
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.32/jquery.form.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js"></script>
    <script src="/hotel/resources/plugins/bootstrap-datepicker-master/bootstrap-datepicker.min.js"></script>
    
    <!-- Google Map -->
    <script src="/hotel/resources/plugins/google-map/map.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>    

    <script src="/hotel/resources/js/script.js"></script>

  </body>
  </html>