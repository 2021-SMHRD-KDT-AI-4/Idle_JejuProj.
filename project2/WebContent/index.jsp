<%@page import="com.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>Alpha by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="landing is-preload">
		<div id="page-wrapper">

			<!-- Header -->
			<%
				MemberDTO info =  (MemberDTO)session.getAttribute("info");  // 오른쪽 다운캐스팅함
			%>
				<header id="header" class="alt">
					<h1><a href="index.jsp">JEJUGo</a> by djWaidle</h1>
					<nav id="nav">
						<ul>
							<li><a href="index.jsp">Home</a></li>
							<li>
								<a href="#" class="icon solid fa-angle-down">MENU</a>
								<ul>
									<li><a href="l_aboutjejugo.jsp">AboutJEJUGo</a></li>
									<li>
										<a href="#">Bookmark</a>
										<ul>
										<%	if(info == null){ %>
											<li><a href="signin.jsp">sign in please</a></li>
										<%	}else{ %>
											<li><a href="l_bookmark_de.jsp">Destination</a></li>
											<li><a href="l_bookmark_re.jsp">Restaurant</a></li>
											<li><a href="l_bookmark_ca.jsp">Cafe</a></li>
										<%	} %>	
										</ul>
									</li>
									<li><a href="#">Top</a></li>
								</ul>
							</li>
							<%	if(info == null){ 	%>
								<!-- 로그인 안했을때 -->
									<li><a href="signin.jsp" class="button primary">Sing In</a></li>
									<li><a href="signup.jsp" class="button">Sign Up</a></li>
							<%	}else{ %>	
									<li><a href="signoutService" class="button">Sign Out</a></li>
							<%	} %>
						</ul>
					</nav>
				</header>

			<!-- Banner -->
				<section id="banner">
					<h2>JEJUGo</h2>
					<p>대충 제주 관광을 도와준다는 글 길이는 이정도로로</p>
					<ul class="actions special">
					<!-- <li><a href="signin.jsp" class="button primary">Sing In</a></li> -->	
						<li><a href="#" class="button primary">태그 설정</a></li>
					</ul>
				</section>

			<!-- Main -->
				<section id="main" class="container">

					<section class="box special">
						<header class="major">
							<h2>yeongEoro meosin neun mal sseonoki
							<br />
							제주도 원해요!!!?</h2>
							<p>Blandit varius ut praesent nascetur eu penatibus nisi risus faucibus nunc ornare<br />
							adipiscing nunc adipiscing. Condimentum turpis massa.</p>
						</header>
					
						
						<span id = "map" class="image featured"><img src="images/pic01.jpg" alt="" /></span>
					
  						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2521ce63b91e985888264b8d22f1ec&libraries=services"></script>
   						<script>
	   						var mapContainer = document.getElementById('map'), 		// 지도를 표시할 div 
	   					    mapOption = { 
	   					        center: new kakao.maps.LatLng(33.5101562, 126.4681157), // 지도의 중심좌표/ 일단 제주공항
	   					        level: 5 // 지도 확대 레벨 
	   					    }; 
	
		   					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
		
		   					if (navigator.geolocation) {			// HTML5의 geolocation으로 사용할 수 있는지 확인
		   					    
		   					    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		   					    navigator.geolocation.getCurrentPosition(function(position) {
		   					        var lat = position.coords.latitude, 		// 위도
		   					            lon = position.coords.longitude; 		// 경도
		   					        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
		   					            message = ''; 							// 인포윈도우에 표시될 내용
		   					        displayMarker(locPosition, message);	 	// 마커, 인포윈도우 표시
		   					      });
		   					    
		   					} else { 			// HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		   					    var locPosition = new kakao.maps.LatLng(33.5101562, 126.4681157),   // 제주공항
		   					        message = '네트워크를 확인하세요'
		   					    displayMarker(locPosition, message);
		   					}
		   					function displayMarker(locPosition, message) {	// 지도에 마커와 인포윈도우를 표시하는 함수
		   					    var marker = new kakao.maps.Marker({  		// 마커 생성
		   					        map: map, 
		   					        position: locPosition
		   					    }); 
		   					    var iwContent = message, 		// 인포윈도우에 표시할 내용
		   					        iwRemoveable = true;
		   					    var infowindow = new kakao.maps.InfoWindow({ // 인포윈도우 생성
		   					        content : iwContent,
		   					        removable : iwRemoveable
		   					    });
		   					    infowindow.open(map, marker);	// 인포윈도우를 마커위에 표시
		   					    map.setCenter(locPosition);     // 지도 중심좌표를 접속위치로 변경
		   					}    
					   </script>
   						
   						
					</section>

					<section class="box special features">
						<div class="features-row">
							<section>
								<span class="icon solid major fa-map accent2"></span>
								<h3><a href = "a_destination.jsp">Destination</h3></a>
								<p>Integer volutpat ante et accumsan commophasellus sed aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis accumsan dolore magna aliquam veroeros.</p>
							</section>
							<section>
								<span class="icon solid major fa-drumstick-bite accent3"></span>
								<h3><a href = "a_restaurant.jsp">Restaurant</h3></a>
								<p>Integer volutpat ante et accumsan commophasellus sed aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis accumsan dolore magna aliquam veroeros.</p>
							</section>
						</div>
						<div class="features-row">
							<section>
								<span class="icon solid major fa-coffee accent4"></span>
								<h3><a href = "a_cafe.jsp">Cafe</h3></a>
								<p>커피는 위에 매우매우 안좋다 동준이와 idle 팀 여러분들 카페인을 멀리 하십시오. 가까이 지내다간 위내시경을 피하지 못할지니.. 위가 쓰려 잠이 오지않는 상황을 맞닥뜨리고 싶지 않다면 카페인을 멀리하시고 물을 가까이 하십시오. 특히 팀장님 몬스터 멈춰!</p>
							</section>
							<section>
								<span class="icon solid major fa-magic accent5"></span>
								<h3><a href = "a_event.jsp">Event</h3></a>
								<p>이벤트 어떻게 구현할지 집에서 생각해봐야겠다 하지만 난 오늘 치킨을 먹으며 야구를 볼 것이다. 친구집 옥상에서 벌써 설렌다희희. 이벤트 페이지 구현은 미래의 나에게 맡긴다 집 보내줘 칼퇴할래</p>
							</section>
						</div>
					</section>

					<div class="row">
						<div class="col-6 col-12-narrower">

							<section class="box special">
								<span class="image featured"><img src="images/jeju_board.PNG" alt="" /></span>
								<h3>사용자 게시판</h3>
								<p>다른 사용자들은 무슨 글을 남겼을까?</p>
								<ul class="actions special">
									<li><a href="#" class="button alt">게시판 들어가기</a></li>
								</ul>
							</section>

						</div>
						<div class="col-6 col-12-narrower">

							<section class="box special">
								<span class="image featured"><img src="images/pic03.jpg" alt="" /></span>
								<h3>Accumsan integer</h3>
								<p>Integer volutpat ante et accumsan commophasellus sed aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis accumsan dolore magna aliquam veroeros.</p>
								<ul class="actions special">
									<li><a href="#" class="button alt">Learn More</a></li>
								</ul>
							</section>

						</div>
					</div>

				</section>

			<!-- CTA -->
				<section id="cta">

					<h2>Sign up for use</h2>
					<p>여긴 대충 뭐라 써야할까 좋은 문장 추천 받습니다</p>

					<form>
						<div class="row gtr-50 gtr-uniform">
							<div class="col-8 col-12-mobilep">
								<input type="email" name="email" id="email" placeholder="Email Address" />
							</div>
							<div class="col-4 col-12-mobilep">
								<input type="submit" value="Sign Up" class="fit" />
							</div>
						</div>
					</form>

				</section>

			<!-- Footer -->
				<footer id="footer">
					<ul class="icons">
						<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
						<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
						<li><a href="#" class="icon brands fa-google-plus"><span class="label">Google+</span></a></li>
					</ul>
					<ul class="copyright">
						<li>&copy; djWaidle</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</footer>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>