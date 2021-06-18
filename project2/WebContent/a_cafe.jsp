<%@page import="com.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>Generic - Alpha by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
		<div id="page-wrapper">

			<!-- Header -->
			<%
				MemberDTO info =  (MemberDTO)session.getAttribute("info");  // 오른쪽 다운캐스팅함
			%>
				<header id="header">
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
									<li><a href="l_bookmark_ca.jsp">Top</a></li>
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

			<!-- Main -->
				<section id="main" class="container">
					<header>
						<a href = "a_cafe.jsp"><h2>CAFE</h2></a>
						<p>커피 한 잔 하고 기운 차리세요~~</p>
					</header>
					<div class="box">
						<span id = "map" class="image featured"><img src="images/pic01.jpg" alt="" /></span>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2521ce63b91e985888264b8d22f1ec&libraries=services"></script>	
						<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
						    mapOption = { 
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 5 // 지도의 확대 레벨
						    };
						
						//------------------------현재 위치(임의로 제주공항) 가져오기----------------------
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						
						if (navigator.geolocation) {			// HTML5의 geolocation으로 사용할 수 있는지 확인
	   					    
	   					    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	   					    navigator.geolocation.getCurrentPosition(function(position) {
	   					        var lat = position.coords.latitude, 		// 위도
	   					            lon = position.coords.longitude; 		// 경도
	   					        var locPosition = new kakao.maps.LatLng(33.51063521319914, 126.49142468197101), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
	   					            message = ''; 							// 인포윈도우에 표시될 내용
	   					        displayMarker(locPosition, message);	 	// 마커, 인포윈도우 표시
	   					      });
	   					    
	   					} else { 			// HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	   					    var locPosition = new kakao.maps.LatLng(33.51063521319914, 126.49142468197101),   // 제주공항
	   					        message = '네트워크를 확인하세요'
	   					    displayMarker(locPosition);
	   					}
						
						function displayMarker(locPosition) {	// 지도에 마커와 인포윈도우를 표시하는 함수
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
						
						//---------------------------마커 찍을곳----------------------------
						// 마커를 표시할 위치와 title 객체 배열입니다 
						var positions = [
						    {
						        title: '해뜨는집', 
						        latlng: new kakao.maps.LatLng(35.15595085281, 126.92737015264)
						    },
						    {
						        title: '버거킹 충장점', 
						        latlng: new kakao.maps.LatLng(35.147003663439, 126.91712994455)
						    },
						    {
						        title: '서브웨이 충장점', 
						        latlng: new kakao.maps.LatLng(35.146984594399, 126.91677314745)
						    }
						];
						
						// 마커 이미지의 이미지 주소
						var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
						    
						for (var i = 0; i < positions.length; i ++) {
						    
						    // 마커 이미지의 이미지 크기 
						    var imageSize = new kakao.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성 
						    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
						    
						    // 마커를 생성
						    var marker = new kakao.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[i].latlng, // 마커를 표시할 위치
						        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
						    });
						}
						</script>
						<h3>내 주변 카페 </h3>
						<div class="table-wrapper">
							<table>
								<thead>
									<tr>
										<th>카페</th>
										<th>소개</th>
										<th>주소</th>
										<th>북마크</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>스타벅스 등</td>
										<td>Ante turpis integer aliquet porttitor.</td>
										<td>29.99</td>
										<td><a href = "a_destination.jsp">추가</a></td>
									</tr>
									<tr>
										<td>Nothing</td>
										<td>Vis ac commodo adipiscing arcu aliquet.</td>
										<td>19.99</td>
										<td><a href = "">추가</a></td>
									</tr>
									<tr>
										<td>Something</td>
										<td> Morbi faucibus arcu accumsan lorem.</td>
										<td>29.99</td>
										<td><a href = "">추가</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
						
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
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
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