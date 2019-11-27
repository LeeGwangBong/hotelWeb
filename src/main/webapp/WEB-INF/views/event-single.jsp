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

  <title>IT WILL | Hotel Event-Single</title>

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
  
  <!-- Kakao 톡상담 -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  
  
  <!-- 이미지 리사이징 css -->
  <style type="text/css">
  
/* 아래 세 줄이 중요한 스타일임 */
	div.aspect_1_1 { width: 80px; height: 80px; }
	div.aspect_4_3 { width: 100px; height: 75px; }
	div.aspect_4_5 { width: 80px; height: 100px; }

.clearfix:after {
  	 content: " ";
   	 visibility: hidden;
   	 display: block;
   	 height: 0;
     clear: both;
}
.footer {
  width: 600px; text-align: center; margin-top: 5em;
}
  
</style>
  
</head>

<body >


<!-- Header Start --> 
<header class="navigation">
<div class="top-header py-2">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-8">
				<div class="top-header-left text-muted">
					<b>IT WILL HOTEL</b>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="top-header-right float-right">
					<ul class="list-unstyled mb-0">
						<li class="top-contact">
							<c:choose>
								<c:when test="${empty sessionScope.login.userId }">
									<a href="login.action">로그인</a> / 
									<a href="signup.action">회원가입</a><br/>
								</c:when>
							
								<c:otherwise>
									${sessionScope.login.userName }님 안녕하세요:)♥</br>
									<a href="logout.action">로그아웃</a><br/>
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
				  <li><a class="dropdown-item" href="room-list.action">Room-List</a></li>
				  <li><a class="dropdown-item" href="room-grid.action">Room-Grid</a></li>
				</ul>
			  </li>

			  <li class="nav-item active">
				<a class="nav-link" href="booking-step1.action">Reservation <span class="sr-only">(current)</span></a>
			  </li>
			  
			  <li class="nav-item active">
				<a class="nav-link" href="event-grid.action">Events <span class="sr-only">(current)</span></a>
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

<div class="main-wrapper ">
<div id="kakao-talk-channel-chat-button" style="position:fixed; right:10px; bottom:0px; z-index:1000;"></div>

<section class="overly bg-2">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
          <h1 class="text-white py-100">이벤트</h1>
      </div>
    </div>
  </div>

  <div class="container-fluid page-border-top">
    <div class="row ">
      <div class="col-lg-12 text-center">
          <div class="page-breadcumb py-2">
            <a href="/hotel" class="text-white">Home</a>
            <span><i class="fa fa-angle-right text-white mx-1" aria-hidden="true"></i></span>
            <a href="event-single.action?eventIndex=${dto.eventIndex }" class="text-white">Event</a>
        </div>
      </div>
    </div>
  </div>
</section>


<div class="page-wrapper event-page">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
	
	
	
	<!-- 싱글 이벤트 뿌려주기 ===============싱글 이벤트================싱글 이벤트=============싱글 이벤트====================싱글 이벤트============-->
	
	<div class="single-event">
		<img src="/hotel/resources/images/event/${dto.savefileName }" alt="" class="img-fluid w-100">

		<div class="event-content mt-4">
			<a href="event-single.html"><h2>${dto.eventTitle }</h2></a>
			<div class="event-post-meta mb-4">
				<span><i class="ion-calendar"></i>${dto.day }</span>
				<span><i class="ion-clock"></i>${dto.time }</span>
				<span><i class="ion-ios-location"></i>${dto.location }</span>
			</div>

			<p>${dto.content1 }</p>
			<p>${dto.content2 }</p>
		</div>
		
		
		<!-- 이벤트 신청 개인 모달 버튼 -->
		<button type="button" class="btn btn-main" id="myBtn">신청</button>

		

		<div class="event-comment-form mt-5">

                    <h4 class="mb-4">(${countReview }) 이벤트 후기 :-</h4>
                  
					
                    <c:forEach items="${lists }" var="reviewDto">
                    <div class="room-details-review-item d-flex mb-5">
                        <div class="item-content ml-3">
                            <h3 class="mb-3">${reviewDto.name } - <span>${reviewDto.created }</span></h3>
                            <p>${reviewDto.content }</p>
                            
                    <input type="button" value=" 삭제 " class="btn btn-main"
					onclick="javascript:location.href=
					'<%=cp%>/eventReview-delete.action?eventIndex=${eventIndex }&eventReviewNum=${reviewDto.eventReviewNum }'"/>
                            
                        </div>
                    </div>
					</c:forEach>
					
                    


                    <div class="room-review-comment mt-5 pt-5 border-top">
	                    <h4 class="mb-4">후기 남기기 :- </h4>
						
							<form action="eventReview.action?eventIndex=${eventIndex }" method="post">	                     
							 <div class="form-group">
	                                <input type="text" name="name" placeholder="이름" class="form-control" value="${sessionScope.login.userName }">
	                        </div>
	                        <div class="form-group">
	                                <input type="text" name="email" placeholder="이메일" class="form-control" value="${sessionScope.login.userEmail }">
	                        </div>
	                        <div class="form-group">
	                                <textarea class="form-control" name="content" placeholder="Message" rows="5"></textarea>
	                        </div>

	                        <div class="form-group">
	                            <div class="btn-submit">
	                                   <button type="submit" class="btn btn-main">작성하기</button>
	                                   
	                            </div>
	                        </div>
	                    </form>
	                </div>			
			
			 <!-- Reveiw END -->
			
		</div>
	</div>	
</div>



		</div>
	</div>
</div>






    



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
							<a href="#"><i class="fa fa-angle-right"></i>Reservation</a>
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



<div>




  <!-- Modal------------ Modal-------------Modal-------------------     -->
  
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content 시작-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">이벤트 신청하기</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <div class="modal-body">
        
       <div id="modalview2">
        <!--이벤트 신청서 폼 -->
        
       
  		<div class="form-group">
    		<label for="exampleInputEmail1">아이디</label>
    		<input type="email" class="form-control" name="eventUserId" id="eventUserId" value="${sessionScope.login.userId}" aria-describedby="emailHelp" placeholder="Enter email" disabled/>
  			</div>
  		<div class="form-group">
    		<label for="exampleInputPassword1">이름</label>
   			 <input type="text" class="form-control" name="eventUserName" id="eventUserName" value="${sessionScope.login.userName}" placeholder="이름" disabled/>
  		</div>
  
  		<div class="form-group">
    		<label for="exampleInputPassword1">요청사항</label>
    		<textarea class="form-control" rows="3" name="eventUserRequest" id="eventUserRequest" placeholder="요청사항을 50자내로 입력해주세요"></textarea>
  		</div>
  		
  		
		<div align="center">
  			<button type="submit" class="btn btn-main" id="btnok">신청하기</button>
 	 		<button type="button" class="btn btn-main" data-dismiss="modal">닫기</button>
 	 	</div>
		
 	 	
		</div>
		
	
        <!-- 신청성 양식 끝 -->
       </div>
       
        
        <!-- 여기까지 숨겨지는 부분 -->
        
        <!-- 뿌려지는 부분 -->
        <div id="listData"></div>
        </div>
        <div class="modal-footer">
        </div>
      </div>
      
    </div>
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
	
	

<script type="text/javascript">


$(document).ready(function(){
	
    $("#myBtn").click(function(){
    	
    	if('${sessionScope.login.userName}'.length==0) {
    		
    		alert("로그인 후 사용가능합니다")
    		
    	}else{
    		
    		 $("#myModal").modal();
    	}
    });
});


$(document).ready(function(){
	
		$("#btnok").click(function(){ 
				var params = "eventUserId=" + $("#eventUserId").val()
				+ "&eventUserName=" + $("#eventUserName").val()
				+ "&eventUserRequest=" + $("#eventUserRequest").val()
				+ "&eventIndex=" +"${eventIndex}"
	
				$.ajax({
					
					type:"POST",  
					url:"<%=cp%>/event-request.action", 
					data:params,
					success:function(args){
						
							$("#modalview2").hide(function() {
									$("#listData").html(args);	
							});
						
					},
				beforeSend:false, 
				error:function(e) {
				
				alert(e.responseText); 
			}
		});
	});
});
	     

</script>

<!-- 이미지 사이즈 조절 하기  -->

<script type="text/javascript">


window.onload = function() {
	  var divs = document.querySelectorAll('li > div');
	  for (var i = 0; i < divs.length; ++i) {
	    var div = divs[i];
	    var divAspect = div.offsetHeight / div.offsetWidth;
	    div.style.overflow = 'hidden';
	    
	    var img = div.querySelector('img');
	    var imgAspect = img.height / img.width;

	    if (imgAspect <= divAspect) {
	      // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
	      var imgWidthActual = div.offsetHeight / imgAspect;
	      var imgWidthToBe = div.offsetHeight / divAspect;
	      var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
	      img.style.cssText = 'width: auto; height: 100%; margin-left: '
	                      + marginLeft + 'px;'
	    } else {
	      // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
	      img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
	    }
	  }
	  
	  var btn = document.querySelector('#btnToggleOverflow');
	  btn.onclick = function() {
	    var val = divs[0].style.overflow == 'hidden' ? 'visible' : 'hidden';
	    for (var i = 0; i < divs.length; ++i)
	      divs[i].style.overflow = val;
	  };
	};









</script>




</body>
</html>