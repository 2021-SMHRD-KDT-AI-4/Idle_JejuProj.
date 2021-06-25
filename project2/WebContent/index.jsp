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
	<title>JEJUGo│제주 여행메이트</title>
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
				// 사용자 정보 (id, pw, name, age, phone)
				MemberDTO info =  (MemberDTO)session.getAttribute("info");
				// 사용자 태그 선택 (tag, day, people)
				TourInfoDTO tag_info =  (TourInfoDTO)session.getAttribute("tag_info");
				// 현재 위치_관광지 기준(name, lat, lon)
				TourInfoDTO loc =  (TourInfoDTO)session.getAttribute("loc");
				// 추천 여행지 정보(name, info, addr, img, lat, lon, cal)
				ArrayList<TourDTO> recommend = (ArrayList)session.getAttribute("recommend");
				// 다녀간 여행지 리스트(name)
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
					<h2 class="jfont" style="font-size:100px;">JEJUGo</h2>
					<p class="jfont"><font size="50px">당신의 든든한 여행 메이트. 함께가요 제주도</font></p>
					<ul class="actions special">
					<!-- <li><a href="signin.jsp" class="button primary">Sing In</a></li> -->	
							
						<script>
							function btnno() {
								alert("로그인 후 이용해주세요.");
							}
							function tagbtnyes() {
								location.href="#check_tag";
							}
							function tag_infoNo() {
								alert("태그 설정 후 이용해주세요");
							}
						</script>
						
					<%if(info==null){ %>
						<li onclick="btnno()"><a class="button primary" id="primary">출발</a ></li>
					<%}else{ %>
						<li onclick="tagbtnyes()"><a class="button primary" id="primary">출발</a ></li>
					<%} %>
						<form action="Tour_info" method="post">
							<div id="check_tag" class="check">	
								
								<a href="#a">닫기</a>
								<table class="cht">
									<tr>
										<td>
											<select name="people">
												<option>가족</option>
												<option>친구</option>
												<option>연인</option>
												<option>혼자</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											<select name="day">
												<option>1박2일</option>
												<option>2박3일</option>
												<option>3박4일</option>
												<option>4박5일</option>
											</select>
										</td>
									</tr>
									<tr align="center">
										<td>
											<input type="checkbox" name="tag" value="사진" class="ct" id="family"><label for="family">사진</label>
											<input type="checkbox" name="tag" value="관광" class="ct" id="friend"><label for="friend">관광</label><br>
											<input type="checkbox" name="tag" value="힐링" class="ct" id="couple"><label for="couple">힐링</label>
											<input type="checkbox" name="tag" value="누구나" class="ct" id="healing"><label for="healing">뭐든지</label> 
										</td>
									</tr>
									<tr align="center">
										<td bgcolor=white;>
											<input type="submit" value="확인" style="background-color: gray;">
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
							<h2 style="font-size:50px;">내 주변의 좋은 관광지 및 음식점을 
							<br />
							지금 확인해 보세요</h2>
							<p><%	if(info == null){ 	%>
								<!-- 로그인 안했을때 -->
									로그인을 해주세요.
							<%	}else{ %>	
									<%= info.getName() %>님의 현재 위치입니다
							<%	} %>
							</p>
						</header>
					
						<span id = "map" class="image featured" style="height:600px;"><img src="images/pic01.jpg" alt="" /></span>
					
  						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2521ce63b91e985888264b8d22f1ec&libraries=services"></script>
   						<script>
   						
	   						var mapContainer = document.getElementById('map'), 		// 지도를 표시할 div 
	   					    mapOption = { 
	   					        center: new kakao.maps.LatLng(33.5101562, 126.4681157), // 지도의 중심좌표/ 일단 제주공항
	   					        level: 8 // 지도 확대 레벨 
	   					    }; 
	
		   					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
		
		   					if (navigator.geolocation){			// HTML5의 geolocation으로 사용할 수 있는지 확인
		   					    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
 		   					    navigator.geolocation.getCurrentPosition(function(position) {
		   					        var lat = position.coords.latitude, 		// 위도
		   					            lon = position.coords.longitude; 		// 경도
		   					        var locPosition = new kakao.maps.LatLng(<%= gps_lat %>, <%= gps_lon %>), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
		   					            message = '<div style="font-size:20px;width:150px;text-align:center;padding:6px 0;">현재위치</div>';	// 인포윈도우에 표시될 내용
		   					        displayMarker(locPosition, message);	 	// 마커, 인포윈도우 표시
		   					      });
		   					} else { 			// HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		   					    var locPosition = new kakao.maps.LatLng(lat, lon),   // 제주공항
		   					        message = '네트워크를 확인하세요'
		   					    displayMarker(locPosition, message);
		   					}
		   					function displayMarker(locPosition, message) {	// 지도에 마커와 인포윈도우를 표시하는 함수
		   					    var marker = new kakao.maps.Marker({  		// 마커 생성
		   					        map: map, 
		   					        position: locPosition
		   					    }); 
		   					    var iwContent = message, 		// 인포윈도우에 표시할 내용
		   					        iwRemoveable = false;
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
							<%if(info==null){ %>
								<section onclick = "btnno()">
							<% } else if(tag_info == null) { %>
								<section onclick = "tag_infoNo()">
							<% }else{ %>
								<section onclick = "location.href='RecommendDist'">		
							<%} %>
									<span class="icon solid major fa-map accent2"></span>
									<h3>SIGHTS</h3></a>
									<p>내 주변 관광지를 추천합니다.<br>근처에 가볼만 한 곳이 어디 있을까요?</p>
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
									<p>내 주변 음식점을 추천합니다.<br>출출하지 않나요?근처에서 식사 하고 가세요.</p>
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
								<p>내 주변 카페를 추천합니다.<br> 다리도 아픈데 쉬었다 가세요.</p>
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
								<h3>사용자 게시판</h3>
								<p>다른 사용자들은 무슨 글을 남겼을까?</p>
								<ul class="actions special">
									<li><a href="b_boardmain.jsp" class="button alt">게시판 들어가기</a></li>
								</ul>
							</section>

						</div>
						<div class="col-6 col-12-narrower">
												
							<section class="box special">
								<span class="image featured"><img src="images/jeju_map.PNG" style="height: 300px;" alt="" /></span>
								<h3>나만의 여행지도</h3>
								<p>내가 다녀온 장소를 한 눈에 보자!</p>
								<ul class="actions special">
								
								<%if(info==null){ %>
									<li onclick="btnno()"><a class="button alt">여행지도</a></li>
								<%}else{ %>
									<li><a href="Mymap" class="button alt">여행지도</a></li>
								<%} %>
								</ul>
							</section>
						</div>
					</div>

				</section>

			<!-- CTA -->
				<section id="cta">

					<h2>Feedback Please</h2>
					<p>이용중 불편했던 부분을 말씀해주세요</p>

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
						<li><a href="https://www.youtube.com/channel/UCaOOXBwWoih0n7v5kIZM0aA" class="icon brands fa-google-plus"><span class="label">호두아빠</span></a></li>
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