<%@page import="com.TourDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.TourInfoDTO"%>
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
	
	<style>
		#choice1, #choice2, #choice3{
			border-top-left-radius: 5px;
			border-top-right-radius: 5px;
			border-bottom-left-radius: 5px;
			border-bottom-right-radius: 5px;
			border: 1px solid #ADACAC;
			background-color:#ADACAC;
			color : white;
			box-shadow: 1px 2px 0 rgb(0,0,0,0.5);
			font-size : 15px;
			padding: 10px 28px;
		}
		#choice1:hover, #choice2:hover, #choice3:hover{
			border: 1px solid #F97B5A;
			background-color:#F97B5A ;
			color : white;
			box-shadow: 1px 2px 0 rgb(0,0,0,0.5);
		}
		#choice1:active, #choice2:active, #choice3:active {
			border: 1px solid #E9E8E7;
			background-color:#F97B5A ;
			color : white;
			position: relative;
			box-shadow: 0px 0px 0 rgb(0,0,0,0.5);
			top:2px;
		}
		
		img{
			width: 200px;
			height: 260px;
			object-fit: cover;
		}
		
		td{
			width : 33%;
		}
	</style>	
</head>
<body class="is-preload">
		<div id="page-wrapper">

			<!-- Header -->
			<%
				// ����� ���� (id, pw, name, age, phone)
				MemberDTO info =  (MemberDTO)session.getAttribute("info");
				// ������ �±� ���� (tag, day, people)
				TourInfoDTO tag_info =  (TourInfoDTO)session.getAttribute("tag_info");
				// ���� ��ġ_������ ����(lat, lon)
				TourInfoDTO loc =  (TourInfoDTO)session.getAttribute("loc");
				// ��õ ������ ����(name, info, addr, img, lat, lon, cal)
				ArrayList<TourDTO> recommend_cafe = (ArrayList)session.getAttribute("recommend_cafe");
				
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
										
									<li><a href="a_cafe.jsp">top</a></li>
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
						<a href = "a_cafe.jsp"><h2>CAFE</h2></a>
						<p>�ֺ��� �̷� ī�䰡 �ֳ׿�~</p>
					</header>
					<div class="box">
						<span id = "map" class="image featured"><img src="images/pic01.jpg" alt="" /></span>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2521ce63b91e985888264b8d22f1ec&libraries=services"></script>	
						<script>
						var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
						    mapOption = { 
						        center: new kakao.maps.LatLng(35.11096661278524, 126.87736495574595), // ������ �߽���ǥ
						        level: 7 // ������ Ȯ�� ����
						    };
						
						//------------------------���� ��ġ(���Ƿ� ���ְ���) ��������----------------------
						var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
						
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
						
						//---------------------------��Ŀ ������----------------------------
						// ��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 
						var positions = [
						    {
						        title: '<%= recommend_cafe.get(0).getName() %>', 
						        latlng: new kakao.maps.LatLng(<%= recommend_cafe.get(0).getLat() %>,<%= recommend_cafe.get(0).getLon() %>)
						    },
						    {
						        title: '<%= recommend_cafe.get(1).getName() %>', 
						        latlng: new kakao.maps.LatLng(<%= recommend_cafe.get(1).getLat() %>, <%= recommend_cafe.get(1).getLon() %>)
						    },
						    {
						        title: '<%= recommend_cafe.get(2).getName() %>', 
						        latlng: new kakao.maps.LatLng(<%= recommend_cafe.get(2).getLat() %>, <%= recommend_cafe.get(2).getLon() %>)
						    }
						];
						
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
						
						function btn1(){
							alert('�湮 �� ����� �Խ��ǿ� �ı⸦ �����ֽø� ������� �帳�ϴ�.!');
							window.location.href='Choice?index=0&lat='+<%= recommend_cafe.get(0).getLat() %>+'&lon='+<%= recommend_cafe.get(0).getLon() %>;
						}
						function btn2(){
							alert('�湮 �� ����� �Խ��ǿ� �ı⸦ �����ֽø� ������� �帳�ϴ�.!');
							window.location.href='Choice?index=1&lat='+<%= recommend_cafe.get(1).getLat() %>+'&lon='+<%= recommend_cafe.get(1).getLon() %>;
						}
						function btn3(){
							alert('�湮 �� ����� �Խ��ǿ� �ı⸦ �����ֽø� ������� �帳�ϴ�.!');
							window.location.href="Choice?index=2&lat="+<%= recommend_cafe.get(2).getLat() %>+"&lon="+<%= recommend_cafe.get(2).getLon() %>;
						}
						</script>
						<h3>�� �ֺ� ������ </h3>
							<table align = "center">
								<tr align = "center">
									<td stlye="width: 10px;">�̸�</td>
									<td><%= recommend_cafe.get(0).getName() %></td>
									<td><%= recommend_cafe.get(1).getName() %></td>
									<td><%= recommend_cafe.get(2).getName() %></td>
								</tr>
								<tr align = "center">
									<td stlye="width: 8px;"></td>
									<td><img src = "<%= recommend_cafe.get(0).getImg() %>"></td>
									<td><img src = "<%= recommend_cafe.get(1).getImg() %>"></td>
									<td><img src = "<%= recommend_cafe.get(2).getImg() %>"></td>
								</tr>
								<tr align = "center">
									<td stlye="width: 10px;">�Ұ�</td>
									<td><%= recommend_cafe.get(0).getInfo() %></td>
									<td><%= recommend_cafe.get(1).getInfo() %></td>
									<td><%= recommend_cafe.get(2).getInfo() %></td>
								</tr>
								<tr align = "center">
									<td stlye="width: 10px;">�ּ�</td>
									<td><%= recommend_cafe.get(0).getAddr() %></td>
									<td><%= recommend_cafe.get(1).getAddr() %></td>
									<td><%= recommend_cafe.get(2).getAddr() %></td>
								</tr>
								<tr align = "center">
								
									<td stlye="width: 10px;"> </td>									
									<td><button id="choice1" onclick ="btn1()">����</button></td>
									<td><button id="choice2" onclick ="btn2()">����</button></td>
									<td><button id="choice3" onclick ="btn3()">����</button></td>
									<!--<td><button id = "btn1" onclick ="javascript:btn('�̿� �� ����� �Խ��ǿ� �ı⸦ �����ֽø� ������� �帳�ϴ�.!')">����</button></td>-->
									
								</tr>
							</table>
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