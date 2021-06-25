<%@page import="com.TourDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.TourInfoDTO"%>
<%@page import="com.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>JEJUGo������ �������Ʈ</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	
	<style>
		@font-face {
			font-family : "jejuFont";
			src: url("./assets/css/jejuFont.ttf")
		}
		.jfont{
			font-family: "jejuFont";
		}
		
		.check{
			position: absolute;
			left: 50%; 
			top: 50%;
			z-index: -1;
			transform: translate(-50%,-75%);
			width: 500px;
			height: 500px; 
			box-shadow: 0 0 10px rgba(0,0,0,0.5);
			background : #FFFFF5; 
			border-radius: 5px;
			text-align: right;
			padding: 20px;
			box-sizing: border-box;
			opacity: 0;
			transition: all 0.5s;
			
		}
		td{
			background: #FFFFF8;
			color: black;
		}
		
		.check a{
			color: gray;
			text-decoration: none;
		}
		.check:target{
			opacity: 1;
			z-index: 5;
		}
		
		.check:target + .dim{
			opacity: 1;
			z-index: 2;
		}
			.dim {
			position: absolute;
			left: 0;
			top: 0;
			z-index:-1;
			width: 100%;
			height: 100%;
			background: rgba(0,0,0,0.6);
			opacity: 0;
			transition: all 0.5s
		}
	
	</style>
	
</head>
<body class="landing is-preload">
		<div id="page-wrapper">

			<!-- Header -->
			<%
				// ����� ���� (id, pw, name, age, phone)
				MemberDTO info =  (MemberDTO)session.getAttribute("info");
				// ����� �±� ���� (tag, day, people)
				TourInfoDTO tag_info =  (TourInfoDTO)session.getAttribute("tag_info");
				// ���� ��ġ_������ ����(name, lat, lon)
				TourInfoDTO loc =  (TourInfoDTO)session.getAttribute("loc");
				// ��õ ������ ����(name, info, addr, img, lat, lon, cal)
				ArrayList<TourDTO> recommend = (ArrayList)session.getAttribute("recommend");
				// �ٳణ ������ ����Ʈ(name)
				ArrayList<String> visited = (ArrayList)session.getAttribute("visited");
				ArrayList<String> visited_res = (ArrayList)session.getAttribute("visited_res");
				ArrayList<String> visited_cafe = (ArrayList)session.getAttribute("visited_cafe");
				Double gps_lat = 33.510650537434664;
				Double gps_lon = 126.49125683810726;
				if(loc != null) {
					gps_lat = loc.getLat();
					gps_lon = loc.getLon();
				}
			%>
				<header id="header" class="alt">
					<h1>JEJUGo</a> by djWaidle</h1>
					<nav id="nav">
						<ul>
							<li><a href="index.jsp">Home</a></li>
							<li>
								<a href="#" class="icon solid fa-angle-down">MENU</a>
								<ul>
									<li><a href="l_aboutjejugo.jsp">AboutJEJUGo</a></li>
									
									<%	if(info!=null){ %>
										<li><a href="l_mypage.jsp">mypage</a></li>
										
									<%	}else{ %>
										<li><a href="#">mypage</a>
											<ul>
												<li><a href="signin.jsp">sign in please</a></li>
											</ul>
										</li>
									<%	} %>
										
									<li><a href="index.jsp">top</a></li>
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
					<h2 class="jfont" style="font-size:100px;">JEJUGo</h2>
					<p class="jfont"><font size="50px">����� ����� ���� ����Ʈ. �Բ����� ���ֵ�</font></p>
					<ul class="actions special">
					<!-- <li><a href="signin.jsp" class="button primary">Sing In</a></li> -->	
							
						<script>
							function btnno() {
								alert("�α��� �� �̿����ּ���.");
							}
							function tagbtnyes() {
								location.href="#check_tag";
							}
							function tag_infoNo() {
								alert("�±� ���� �� �̿����ּ���");
							}
						</script>
						
					<%if(info==null){ %>
						<li onclick="btnno()"><a class="button primary" id="primary">���</a ></li>
					<%}else{ %>
						<li onclick="tagbtnyes()"><a class="button primary" id="primary">���</a ></li>
					<%} %>
						<form action="Tour_info" method="post">
							<div id="check_tag" class="check">	
								
								<a href="#a">�ݱ�</a>
								<table class="cht">
									<tr>
										<td>
											<select name="people">
												<option>����</option>
												<option>ģ��</option>
												<option>����</option>
												<option>ȥ��</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											<select name="day">
												<option>1��2��</option>
												<option>2��3��</option>
												<option>3��4��</option>
												<option>4��5��</option>
											</select>
										</td>
									</tr>
									<tr align="center">
										<td>
											<input type="checkbox" name="tag" value="����" class="ct" id="family"><label for="family">����</label>
											<input type="checkbox" name="tag" value="����" class="ct" id="friend"><label for="friend">����</label><br>
											<input type="checkbox" name="tag" value="����" class="ct" id="couple"><label for="couple">����</label>
											<input type="checkbox" name="tag" value="������" class="ct" id="healing"><label for="healing">������</label> 
										</td>
									</tr>
									<tr align="center">
										<td bgcolor=white;>
											<input type="submit" value="Ȯ��" style="background-color: gray;">
										</td>
									</tr>
								</table>
							</div>
						</form>
							<div class="dim"></div>
					</ul>
				
				</section>
						

			<!-- Main -->
				<section id="main" class="container">

					<section class="box special">
						<header class="major">
							<h2 style="font-size:50px;">�� �ֺ��� ���� ������ �� �������� 
							<br />
							���� Ȯ���� ������</h2>
							<p><%	if(info == null){ 	%>
								<!-- �α��� �������� -->
									�α����� ���ּ���.
							<%	}else{ %>	
									<%= info.getName() %>���� ���� ��ġ�Դϴ�
							<%	} %>
							</p>
						</header>
					
						<span id = "map" class="image featured" style="height:600px;"><img src="images/pic01.jpg" alt="" /></span>
					
  						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2521ce63b91e985888264b8d22f1ec&libraries=services"></script>
   						<script>
   						
	   						var mapContainer = document.getElementById('map'), 		// ������ ǥ���� div 
	   					    mapOption = { 
	   					        center: new kakao.maps.LatLng(33.5101562, 126.4681157), // ������ �߽���ǥ/ �ϴ� ���ְ���
	   					        level: 8 // ���� Ȯ�� ���� 
	   					    }; 
	
		   					var map = new kakao.maps.Map(mapContainer, mapOption); // ���� ����
		
		   					if (navigator.geolocation){			// HTML5�� geolocation���� ����� �� �ִ��� Ȯ��
		   					    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
 		   					    navigator.geolocation.getCurrentPosition(function(position) {
		   					        var lat = position.coords.latitude, 		// ����
		   					            lon = position.coords.longitude; 		// �浵
		   					        var locPosition = new kakao.maps.LatLng(<%= gps_lat %>, <%= gps_lon %>), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� ����
		   					            message = '<div style="font-size:20px;width:150px;text-align:center;padding:6px 0;">������ġ</div>';	// ���������쿡 ǥ�õ� ����
		   					        displayMarker(locPosition, message);	 	// ��Ŀ, ���������� ǥ��
		   					      });
		   					} else { 			// HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
		   					    var locPosition = new kakao.maps.LatLng(lat, lon),   // ���ְ���
		   					        message = '��Ʈ��ũ�� Ȯ���ϼ���'
		   					    displayMarker(locPosition, message);
		   					}
		   					function displayMarker(locPosition, message) {	// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ�
		   					    var marker = new kakao.maps.Marker({  		// ��Ŀ ����
		   					        map: map, 
		   					        position: locPosition
		   					    }); 
		   					    var iwContent = message, 		// ���������쿡 ǥ���� ����
		   					        iwRemoveable = false;
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
							<%if(info==null){ %>
								<section onclick = "btnno()">
							<% } else if(tag_info == null) { %>
								<section onclick = "tag_infoNo()">
							<% }else{ %>
								<section onclick = "location.href='RecommendDist'">		
							<%} %>
									<span class="icon solid major fa-map accent2"></span>
									<h3>SIGHTS</h3></a>
									<p>�� �ֺ� �������� ��õ�մϴ�.<br>��ó�� ������ �� ���� ��� �������?</p>
								</section>
							
							<%if(info==null){ %>
								<section onclick = "btnno()">
							<% } else if(tag_info == null) { %>
								<section onclick = "tag_infoNo()">
							<%}else{ %>
									<section onclick = "location.href='RecommendRes'">
							<%} %>
									<span class="icon solid major fa-drumstick-bite accent3"></span>
									<h3>Restaurant</h3></a>
									<p>�� �ֺ� �������� ��õ�մϴ�.<br>�������� �ʳ���?��ó���� �Ļ� �ϰ� ������.</p>
								</section>
						</div>
						<div class="features-row">
						<%if(info==null){ %>
							<section onclick = "btnno()">
						<% } else if(tag_info == null) { %>
								<section onclick = "tag_infoNo()">
						<%}else{ %>
							<section onclick = "location.href='RecommendCafe'">
						<%} %>
								<span class="icon solid major fa-coffee accent4"></span>
								<h3>Cafe</h3></a>
								<p>�� �ֺ� ī�並 ��õ�մϴ�.<br> �ٸ��� ���µ� ������ ������.</p>
							</section>
							<section>
							<h2 class="jfont" style = "color: #FACC2E; font-weight: bold; font-size:80px;"><br>JEJUGo</h2>
							</section>
						</div>
					</section>

					<div class="row">
						<div class="col-6 col-12-narrower">

							<section class="box special">
								<span class="image featured"><img src="images/jeju_board.PNG" style=" height: 300px;" alt=""  /></span>
								<h3>����� �Խ���</h3>
								<p>�ٸ� ����ڵ��� ���� ���� ��������?</p>
								<ul class="actions special">
									<li><a href="b_boardmain.jsp" class="button alt">�Խ��� ����</a></li>
								</ul>
							</section>

						</div>
						<div class="col-6 col-12-narrower">
												
							<section class="box special">
								<span class="image featured"><img src="images/jeju_map.PNG" style="height: 300px;" alt="" /></span>
								<h3>������ ��������</h3>
								<p>���� �ٳ�� ��Ҹ� �� ���� ����!</p>
								<ul class="actions special">
								
								<%if(info==null){ %>
									<li onclick="btnno()"><a class="button alt">��������</a></li>
								<%}else{ %>
									<li><a href="Mymap" class="button alt">��������</a></li>
								<%} %>
								</ul>
							</section>
						</div>
					</div>

				</section>

			<!-- CTA -->
				<section id="cta">

					<h2>Feedback Please</h2>
					<p>�̿��� �����ߴ� �κ��� �������ּ���</p>

					<form>
						<div class="row gtr-50 gtr-uniform">
							<div class="col-8 col-12-mobilep">
								<input type="text" name="feedback" id="feedback" placeholder="feedback" />
							</div>
							<div class="col-4 col-12-mobilep">
								<input type="submit" value="send" class="fit" />
							</div>
						</div>
					</form>

				</section>

			<!-- Footer -->
				<footer id="footer">
					<ul class="icons">
						<li><a href="https://www.youtube.com/channel/UCubIpLB7cA9tWIUZ26WFKPg" class="icon brands fa-youtube"><span class="label">Twitter</span></a></li>
						<li><a href="https://www.facebook.com/pages/category/Nonprofit-Organization/%EC%8A%A4%EB%A7%88%ED%8A%B8%EB%AF%B8%EB%94%94%EC%96%B4%EC%9D%B8%EC%9E%AC%EA%B0%9C%EB%B0%9C%EC%9B%90-1043825482459539/" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
						<li><a href="https://www.instagram.com/smhrd0317" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="https://github.com/2021-SMHRD-KDT-AI-4/Idle_JejuProj." class="icon brands fa-github"><span class="label">Github</span></a></li>
						<li><a href="https://www.smhrd.or.kr/" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
						<li><a href="https://www.youtube.com/channel/UCaOOXBwWoih0n7v5kIZM0aA" class="icon brands fa-google-plus"><span class="label">ȣ�ξƺ�</span></a></li>
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