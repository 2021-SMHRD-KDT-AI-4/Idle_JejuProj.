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
				MemberDTO info =  (MemberDTO)session.getAttribute("info");  // ������ �ٿ�ĳ������
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
								<!-- �α��� �������� -->
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
					<p>���� ���� ������ �����شٴ� �� ���̴� �������η�</p>
					<ul class="actions special">
					<!-- <li><a href="signin.jsp" class="button primary">Sing In</a></li> -->	
						<li><a href="#" class="button primary">�±� ����</a></li>
					</ul>
				</section>

			<!-- Main -->
				<section id="main" class="container">

					<section class="box special">
						<header class="major">
							<h2>yeongEoro meosin neun mal sseonoki
							<br />
							���ֵ� ���ؿ�!!!?</h2>
							<p>Blandit varius ut praesent nascetur eu penatibus nisi risus faucibus nunc ornare<br />
							adipiscing nunc adipiscing. Condimentum turpis massa.</p>
						</header>
					
						
						<span id = "map" class="image featured"><img src="images/pic01.jpg" alt="" /></span>
					
  						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2521ce63b91e985888264b8d22f1ec&libraries=services"></script>
   						<script>
	   						var mapContainer = document.getElementById('map'), 		// ������ ǥ���� div 
	   					    mapOption = { 
	   					        center: new kakao.maps.LatLng(33.5101562, 126.4681157), // ������ �߽���ǥ/ �ϴ� ���ְ���
	   					        level: 5 // ���� Ȯ�� ���� 
	   					    }; 
	
		   					var map = new kakao.maps.Map(mapContainer, mapOption); // ���� ����
		
		   					if (navigator.geolocation) {			// HTML5�� geolocation���� ����� �� �ִ��� Ȯ��
		   					    
		   					    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
		   					    navigator.geolocation.getCurrentPosition(function(position) {
		   					        var lat = position.coords.latitude, 		// ����
		   					            lon = position.coords.longitude; 		// �浵
		   					        var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� ����
		   					            message = ''; 							// ���������쿡 ǥ�õ� ����
		   					        displayMarker(locPosition, message);	 	// ��Ŀ, ���������� ǥ��
		   					      });
		   					    
		   					} else { 			// HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
		   					    var locPosition = new kakao.maps.LatLng(33.5101562, 126.4681157),   // ���ְ���
		   					        message = '��Ʈ��ũ�� Ȯ���ϼ���'
		   					    displayMarker(locPosition, message);
		   					}
		   					function displayMarker(locPosition, message) {	// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ�
		   					    var marker = new kakao.maps.Marker({  		// ��Ŀ ����
		   					        map: map, 
		   					        position: locPosition
		   					    }); 
		   					    var iwContent = message, 		// ���������쿡 ǥ���� ����
		   					        iwRemoveable = true;
		   					    var infowindow = new kakao.maps.InfoWindow({ // ���������� ����
		   					        content : iwContent,
		   					        removable : iwRemoveable
		   					    });
		   					    infowindow.open(map, marker);	// ���������츦 ��Ŀ���� ǥ��
		   					    map.setCenter(locPosition);     // ���� �߽���ǥ�� ������ġ�� ����
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
								<p>Ŀ�Ǵ� ���� �ſ�ſ� ������ �����̿� idle �� �����е� ī������ �ָ� �Ͻʽÿ�. ������ �����ٰ� �����ð��� ������ ��������.. ���� ���� ���� �����ʴ� ��Ȳ�� �´ڶ߸��� ���� �ʴٸ� ī������ �ָ��Ͻð� ���� ������ �Ͻʽÿ�. Ư�� ����� ���� ����!</p>
							</section>
							<section>
								<span class="icon solid major fa-magic accent5"></span>
								<h3><a href = "a_event.jsp">Event</h3></a>
								<p>�̺�Ʈ ��� �������� ������ �����غ��߰ڴ� ������ �� ���� ġŲ�� ������ �߱��� �� ���̴�. ģ���� ���󿡼� ���� ����������. �̺�Ʈ ������ ������ �̷��� ������ �ñ�� �� ������ Į���ҷ�</p>
							</section>
						</div>
					</section>

					<div class="row">
						<div class="col-6 col-12-narrower">

							<section class="box special">
								<span class="image featured"><img src="images/jeju_board.PNG" alt="" /></span>
								<h3>����� �Խ���</h3>
								<p>�ٸ� ����ڵ��� ���� ���� ��������?</p>
								<ul class="actions special">
									<li><a href="#" class="button alt">�Խ��� ����</a></li>
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
					<p>���� ���� ���� ����ұ� ���� ���� ��õ �޽��ϴ�</p>

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