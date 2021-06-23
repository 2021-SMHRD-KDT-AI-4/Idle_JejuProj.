<%@page import="com.google.gson.Gson"%>
<%@page import="com.TourDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.TourInfoDTO"%>
<%@page import="com.MemberDAO"%>
<%@page import="com.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<html>
	<head>
		<title>나의지도│JEJUGo</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		
		<style>
			#btn1{
				border-top-left-radius: 5px;
				border-top-right-radius: 5px;
				border-bottom-left-radius: 5px;
				border-bottom-right-radius: 5px;
				border: 1px solid #ADACAC;
				background-color:#ADACAC;
				color : white;
				box-shadow: 1px 2px 0 rgb(0,0,0,0.5);
			}
		#btn1:hover{
			border: 1px solid #F97B5A;
			background-color:#F97B5A ;
			color : white;
			box-shadow: 1px 2px 0 rgb(0,0,0,0.5);
		}
		#btn1:active{
			border: 1px solid #E9E8E7;
			background-color:#F97B5A ;
			color : white;
			position: relative;
			box-shadow: 0px 0px 0 rgb(0,0,0,0.5);
		}
			
		</style>
		
	</head>
	<body class="is-preload">
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
				// 다녀간 여행지 정보(name, addr, info, lat, lon)
				ArrayList<TourDTO> visited_info = (ArrayList)session.getAttribute("visited_info");
				
				Gson gson = new Gson();
	            String json = gson.toJson(visited_info);
				
				Double gps_lat = 33.510650537434664;
				Double gps_lon = 126.49125683810726;
				if(loc != null) {
					gps_lat = loc.getLat();
					gps_lon = loc.getLon();
				}
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
							
							<%	if(info!=null){ %>
								<li><a href="l_mypage.jsp">mypage</a></li>
										
							<%	}else{ %>
								<li><a href="#">mypage</a>
									<ul>
										<li><a href="signin.jsp">sign in please</a></li>
									</ul>
								</li>
							<%	} %>
							<li><a href="c_mymap.jsp">top</a></li>
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
						<a href = "c_mymap.jsp"><h2>My map</h2></a>
						<p>나만의 제주여행지도를 만들어보세요</p>
					</header>
					<div class="box">
						<span id = "map" class="image featured"><img src="images/pic01.jpg" alt="" /></span>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2521ce63b91e985888264b8d22f1ec&libraries=services"></script> 						
   						<script>
   						
   						var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					    mapOption = { 
					        center: new kakao.maps.LatLng(33.37420714240573, 126.5376342291527), // 지도의 중심좌표
					        level: 10 // 지도의 확대 레벨
					    };
					
					//------------------------현재 위치(임의로 제주공항) 가져오기----------------------
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
<%-- 					
					if (navigator.geolocation) {			// HTML5의 geolocation으로 사용할 수 있는지 확인
   					    
   					    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
   					    navigator.geolocation.getCurrentPosition(function(position) {
   					        var lat = position.coords.latitude, 		// 위도
   					            lon = position.coords.longitude; 		// 경도
   					        var locPosition = new kakao.maps.LatLng(<%= loc.getLat() %>,<%= loc.getLon() %>), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
   					            message = '현재위치'; 						// 인포윈도우에 표시될 내용
   					        displayMarker(locPosition, message);	 	// 마커, 인포윈도우 표시
   					      });
   					    
   					} else { 			// HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
   					    var locPosition = new kakao.maps.LatLng(<%= loc.getLat() %>,<%= loc.getLon() %>),   // 제주공항
   					        message = '네트워크를 확인하세요'
   					    displayMarker(locPosition);
   					} --%>
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
					
					//---------------------------마커 찍을곳----------------------------
					// 마커를 표시할 위치와 title 객체 배열입니다 
					<%-- var positions = [
					    {
					        title: '<%= recommend.get(0).getName() %>', 
					        latlng: new kakao.maps.LatLng(<%= recommend.get(0).getLat() %>,<%= recommend.get(0).getLon() %>)
					    },
					    {
					        title: '<%= recommend.get(1).getName() %>', 
					        latlng: new kakao.maps.LatLng(<%= recommend.get(1).getLat() %>, <%= recommend.get(1).getLon() %>)
					    },
					    {
					        title: '<%= recommend.get(2).getName() %>', 
					        latlng: new kakao.maps.LatLng(<%= recommend.get(2).getLat() %>, <%= recommend.get(2).getLon() %>)
					    }
					]; --%>
					
					var jsonStr = ('<%= json %>');
					console.log(jsonStr);
					var jsonObj = JSON.parse(jsonStr);
					console.log(jsonObj[0]['name']);
					
					
					var size = <%= visited_info.size() %>;
   					var positions = [{title :jsonObj[0]['name'], latlng:new kakao.maps.LatLng(jsonObj[0]['lat'], jsonObj[0]['lon'])}];
   					
   					if(size!=0){
	   					for (var i = 1; i < size; i++) {
							
	   						positions[i] = (
									{title : jsonObj[i]['name'],
									latlng:new kakao.maps.LatLng(jsonObj[i]['lat'], jsonObj[i]['lon'])
									})
							/* positions.latlng = new kakao.maps.LatLng(33.48945642595957, 126.6839924371252); */
						}
   					}
					console.log(positions)
					// 마커 이미지의 이미지 주소
					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					// 마커 이미지의 이미지 크기 
				    var imageSize = new kakao.maps.Size(24, 35);
				 // 마커 이미지를 생성 
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
					for (var i = 0; i < positions.length; i ++) {
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng, // 마커의 위치
					        image : markerImage
					    });

					    // 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new kakao.maps.InfoWindow({
					        content: positions[i].title // 인포윈도우에 표시할 내용
					    });
					    marker.setMap(map);

					    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
					    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					}

					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener(map, marker, infowindow) {
					    return function() {
					        infowindow.open(map, marker);
					    };
					}
					// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
					function makeOutListener(infowindow) {
					    return function() {
					        infowindow.close();
					    };
					}
   						
   						
   						
   							<%-- var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
   					    	mapOption = { 
   					       	 	center: new kakao.maps.LatLng(33.38158123679322, 126.53546236328559), // 지도의 중심좌표
   					        	level: 10 // 지도의 확대 레벨
   					    	};

		   					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		   					 
		   					// 마커를 표시할 위치와 title 객체 배열입니다 
/* 		   					var positions = [
		   						{
				   					title: '생태연못'
				   					latlng: new kakao.maps.LatLng(33.450705, 126.570677)
		   						},
		   					    {
		   					        title: '생태연못', 
		   					        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
		   					    },
		   					    {
		   					        title: '텃밭', 
		   					        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
		   					    },
		   					    {
		   					        title: '근린공원',
		   					        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
		   					    }
		   					]; */
		   					var size = <%= visited_info.size() %>;
		   					var positions = {title :"생태연못", latlng:new kakao.maps.LatLng(33.450936, 126.569477)};
		   					for (var i = 0; i < size; i++) {
								positions.title = "텃밭";
								positions.latlng = new kakao.maps.LatLng(33.48945642595957, 126.6839924371252);
							}
		   					
							console.log(positions)
							
		   					// 마커 이미지의 이미지 주소입니다
		   					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		   					    
		   					for (var i = 0; i < positions.length; i ++) {
		   					    
		   					    // 마커 이미지의 이미지 크기 입니다
		   					    var imageSize = new kakao.maps.Size(24, 35); 
		   					    
		   					    // 마커 이미지를 생성합니다    
		   					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		   					    
		   					    // 마커를 생성합니다
		   					    var marker = new kakao.maps.Marker({
		   					        map: map, // 마커를 표시할 지도
		   					        position: positions[i].latlng, // 마커를 표시할 위치
		   					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		   					        image : markerImage // 마커 이미지 
		   					    });
		   					} --%>
					   	</script>
					   
						<h3>다녀온 곳 리스트</h3>
						<form action = "c_mymap.jsp" method = "post">
							<table align = "center">
								<tr align = "center">
									<td>이름</td>
									<td>주소</td>
									<td>정보</td>
								</tr>
								<% for(int i =0; i<visited_info.size(); i++) { %>
									<tr align = "center">
										<td><%= visited_info.get(i).getName() %></td>
										<td><%= visited_info.get(i).getAddr() %></td>
										<td><%= visited_info.get(i).getInfo() %></td>
									</tr>
								<% } %>
							</table>
						</form>
						
						
					</div>
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