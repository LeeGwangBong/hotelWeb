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

  <!-- Mobile Specific Meta-->
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

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
  
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
		  <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="Eden" class="img-fluid"></a>
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
          <h1 class="text-white py-100">문의 하기</h1>
      </div>
    </div>
  </div>

  <div class="container-fluid page-border-top">
    <div class="row ">
      <div class="col-lg-12 text-center">
          <div class="page-breadcumb py-2">
            <a href="#" class="text-white">Home</a>
            <span><i class="fa fa-angle-right text-white mx-1" aria-hidden="true"></i></span>
            <a href="#" class="text-white">Contact Us</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- contact form start -->
<section class="contact-form section">
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-sm-12">
                <h2 class="mb-4">예약 지원</h2> 
                <ul class="address-block mb-5 list-unstyled">
                    <li class="mb-2">
                        <i class="ion-ios-location-outline text-color mr-4"></i>서울시 강남구 테헤란로 여삼빌딩 15층
                    </li>
                    <li class="mb-2">
                        <i class="ion-ios-email-outline text-color mr-4"></i>Email:contact@mail.com
                    </li>
                    <li class="mb-2">
                        <i class="ion-ios-telephone-outline text-color mr-4"></i>Phone:+88 01672 506 744
                    </li>
                </ul>

                <h2 class="mb-4">팔로잉</h2>
                <ul class="social-icons list-inline">
                    <li class="list-inline-item" >
                        <a href="http://www.themefisher.com"><i class="ion-social-googleplus-outline"></i></a>
                    </li>
                    <li class="list-inline-item">
                        <a href="http://www.themefisher.com"><i class="ion-social-linkedin-outline"></i></a>
                    </li>
                    <li class="list-inline-item">
                        <a href="http://www.themefisher.com"><i class="ion-social-pinterest-outline"></i></a>
                    </li>
                    <li class="list-inline-item">
                        <a href="http://www.themefisher.com"><i class="ion-social-dribbble-outline"></i></a>
                    </li>
                    <li class="list-inline-item">
                        <a href="http://www.themefisher.com"><i class="ion-social-twitter-outline"></i></a>
                    </li>
                    <li class="list-inline-item">
                        <a href="http://www.themefisher.com"><i class="ion-social-facebook-outline"></i></a>
                    </li>
                </ul>
            </div>

           <div class="col-lg-7">
               <h2 class="mb-3">빠르게 연락하기</h2>
               <p class="mb-5">아래의 번호로 연락해주시면 빠르게 응답해 드리겠습니다.</p>

               <div class="phone-info bg-white p-5 ">
                   <h3>전화하기 : <span class="h2">+82-1234-1234</span></h3>
               </div>
           </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <div class="section-title">
                    <p class="section-subtitle">이메일 문의</p>
                    <h2 class="mb-3">이메일을 보내주세요</h2>
                    <p class="mb-4">24시간 상시 대기하는 담당 직원이 문의 주신 내용에 대하여 빠르고 친절하게 응답해드립니다.</p>
                    <span class="section-border"></span>
                </div>
            </div><!-- .col-md-7 close -->
        </div>

        <div class="row">
            <div class="col-lg-7 col-sm-12">
                <form action="#">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <input name="user_name" type="text" class="form-control" placeholder="이름">
                            </div>
                        </div>
                        <div class="col-lg-6">
                             <div class="form-group">
                                <input name="user_subject" type="text" class="form-control" placeholder="제목">
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <input name="user_email" type="text" class="form-control" placeholder="이메일 주소">
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <textarea name="user_message" class="form-control" rows="6" placeholder="메시지를 남겨주세요"></textarea>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-main" type="submit">메시지 보내기</button>
                </form>
            </div>

            <div class="col-lg-5">
                <h3 class="mt-4 mt-lg-0 mb-3"></h3>지도에서 찾기</h3>
                <div class="google-map position-relative">
                    <div id="map"></div>
                </div>
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

    <script src="js/script.js"></script>

  </body>
  </html>