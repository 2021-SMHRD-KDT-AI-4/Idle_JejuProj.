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
				MemberDTO info =  (MemberDTO)session.getAttribute("info");  // ������ �ٿ�ĳ������
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
						<p>Ŀ�� �� �� �ϰ� ��� ��������~~</p>
					</header>
					<div class="box">
						<span id = "map" class="image featured"><img src="images/pic01.jpg" alt="" /></span>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2521ce63b91e985888264b8d22f1ec&libraries=services"></script>	
						<script>
						var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
						    mapOption = { 
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
						        level: 5 // ������ Ȯ�� ����
						    };
						
						//------------------------���� ��ġ(���Ƿ� ���ְ���) ��������----------------------
						var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
						
						if (navigator.geolocation) {			// HTML5�� geolocation���� ����� �� �ִ��� Ȯ��
	   					    
	   					    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
	   					    navigator.geolocation.getCurrentPosition(function(position) {
	   					        var lat = position.coords.latitude, 		// ����
	   					            lon = position.coords.longitude; 		// �浵
	   					        var locPosition = new kakao.maps.LatLng(33.51063521319914, 126.49142468197101), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� ����
	   					            message = ''; 							// ���������쿡 ǥ�õ� ����
	   					        displayMarker(locPosition, message);	 	// ��Ŀ, ���������� ǥ��
	   					      });
	   					    
	   					} else { 			// HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
	   					    var locPosition = new kakao.maps.LatLng(33.51063521319914, 126.49142468197101),   // ���ְ���
	   					        message = '��Ʈ��ũ�� Ȯ���ϼ���'
	   					    displayMarker(locPosition);
	   					}
						
						function displayMarker(locPosition) {	// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ�
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
						
						//---------------------------��Ŀ ������----------------------------
						// ��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 
						var positions = [
						    {
						        title: '�ضߴ���', 
						        latlng: new kakao.maps.LatLng(35.15595085281, 126.92737015264)
						    },
						    {
						        title: '����ŷ ������', 
						        latlng: new kakao.maps.LatLng(35.147003663439, 126.91712994455)
						    },
						    {
						        title: '������� ������', 
						        latlng: new kakao.maps.LatLng(35.146984594399, 126.91677314745)
						    }
						];
						
						// ��Ŀ �̹����� �̹��� �ּ�
						var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
						    
						for (var i = 0; i < positions.length; i ++) {
						    
						    // ��Ŀ �̹����� �̹��� ũ�� 
						    var imageSize = new kakao.maps.Size(24, 35); 
						    
						    // ��Ŀ �̹����� ���� 
						    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
						    
						    // ��Ŀ�� ����
						    var marker = new kakao.maps.Marker({
						        map: map, // ��Ŀ�� ǥ���� ����
						        position: positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
						        title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
						        image : markerImage // ��Ŀ �̹��� 
						    });
						}
						</script>
						<h3>�� �ֺ� ī�� </h3>
						<div class="table-wrapper">
							<table>
								<thead>
									<tr>
										<th>ī��</th>
										<th>�Ұ�</th>
										<th>�ּ�</th>
										<th>�ϸ�ũ</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>��Ÿ���� ��</td>
										<td>Ante turpis integer aliquet porttitor.</td>
										<td>29.99</td>
										<td><a href = "a_destination.jsp">�߰�</a></td>
									</tr>
									<tr>
										<td>Nothing</td>
										<td>Vis ac commodo adipiscing arcu aliquet.</td>
										<td>19.99</td>
										<td><a href = "">�߰�</a></td>
									</tr>
									<tr>
										<td>Something</td>
										<td> Morbi faucibus arcu accumsan lorem.</td>
										<td>29.99</td>
										<td><a href = "">�߰�</a></td>
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