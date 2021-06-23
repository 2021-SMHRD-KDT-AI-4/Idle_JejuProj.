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
		<title>����������JEJUGo</title>
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
				// �ٳణ ������ ����(name, addr, info, lat, lon)
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
						<!-- �α��� �������� -->
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
						<p>������ ���ֿ��������� ��������</p>
					</header>
					<div class="box">
						<span id = "map" class="image featured"><img src="images/pic01.jpg" alt="" /></span>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2521ce63b91e985888264b8d22f1ec&libraries=services"></script> 						
   						<script>
   						
   						var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
					    mapOption = { 
					        center: new kakao.maps.LatLng(33.37420714240573, 126.5376342291527), // ������ �߽���ǥ
					        level: 10 // ������ Ȯ�� ����
					    };
					
					//------------------------���� ��ġ(���Ƿ� ���ְ���) ��������----------------------
					var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
<%-- 					
					if (navigator.geolocation) {			// HTML5�� geolocation���� ����� �� �ִ��� Ȯ��
   					    
   					    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
   					    navigator.geolocation.getCurrentPosition(function(position) {
   					        var lat = position.coords.latitude, 		// ����
   					            lon = position.coords.longitude; 		// �浵
   					        var locPosition = new kakao.maps.LatLng(<%= loc.getLat() %>,<%= loc.getLon() %>), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� ����
   					            message = '������ġ'; 						// ���������쿡 ǥ�õ� ����
   					        displayMarker(locPosition, message);	 	// ��Ŀ, ���������� ǥ��
   					      });
   					    
   					} else { 			// HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
   					    var locPosition = new kakao.maps.LatLng(<%= loc.getLat() %>,<%= loc.getLon() %>),   // ���ְ���
   					        message = '��Ʈ��ũ�� Ȯ���ϼ���'
   					    displayMarker(locPosition);
   					} --%>
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
					
					//---------------------------��Ŀ ������----------------------------
					// ��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 
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
					// ��Ŀ �̹����� �̹��� �ּ�
					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					// ��Ŀ �̹����� �̹��� ũ�� 
				    var imageSize = new kakao.maps.Size(24, 35);
				 // ��Ŀ �̹����� ���� 
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
					for (var i = 0; i < positions.length; i ++) {
					    // ��Ŀ�� �����մϴ�
					    var marker = new kakao.maps.Marker({
					        map: map, // ��Ŀ�� ǥ���� ����
					        position: positions[i].latlng, // ��Ŀ�� ��ġ
					        image : markerImage
					    });

					    // ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
					    var infowindow = new kakao.maps.InfoWindow({
					        content: positions[i].title // ���������쿡 ǥ���� ����
					    });
					    marker.setMap(map);

					    // ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
					    // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
					    // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
					    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					}

					// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
					function makeOverListener(map, marker, infowindow) {
					    return function() {
					        infowindow.open(map, marker);
					    };
					}
					// ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
					function makeOutListener(infowindow) {
					    return function() {
					        infowindow.close();
					    };
					}
   						
   						
   						
   							<%-- var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
   					    	mapOption = { 
   					       	 	center: new kakao.maps.LatLng(33.38158123679322, 126.53546236328559), // ������ �߽���ǥ
   					        	level: 10 // ������ Ȯ�� ����
   					    	};

		   					var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
		   					 
		   					// ��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 
/* 		   					var positions = [
		   						{
				   					title: '���¿���'
				   					latlng: new kakao.maps.LatLng(33.450705, 126.570677)
		   						},
		   					    {
		   					        title: '���¿���', 
		   					        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
		   					    },
		   					    {
		   					        title: '�Թ�', 
		   					        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
		   					    },
		   					    {
		   					        title: '�ٸ�����',
		   					        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
		   					    }
		   					]; */
		   					var size = <%= visited_info.size() %>;
		   					var positions = {title :"���¿���", latlng:new kakao.maps.LatLng(33.450936, 126.569477)};
		   					for (var i = 0; i < size; i++) {
								positions.title = "�Թ�";
								positions.latlng = new kakao.maps.LatLng(33.48945642595957, 126.6839924371252);
							}
		   					
							console.log(positions)
							
		   					// ��Ŀ �̹����� �̹��� �ּ��Դϴ�
		   					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		   					    
		   					for (var i = 0; i < positions.length; i ++) {
		   					    
		   					    // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
		   					    var imageSize = new kakao.maps.Size(24, 35); 
		   					    
		   					    // ��Ŀ �̹����� �����մϴ�    
		   					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		   					    
		   					    // ��Ŀ�� �����մϴ�
		   					    var marker = new kakao.maps.Marker({
		   					        map: map, // ��Ŀ�� ǥ���� ����
		   					        position: positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
		   					        title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
		   					        image : markerImage // ��Ŀ �̹��� 
		   					    });
		   					} --%>
					   	</script>
					   
						<h3>�ٳ�� �� ����Ʈ</h3>
						<form action = "c_mymap.jsp" method = "post">
							<table align = "center">
								<tr align = "center">
									<td>�̸�</td>
									<td>�ּ�</td>
									<td>����</td>
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