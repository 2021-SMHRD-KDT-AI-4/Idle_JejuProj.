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
		#btn1, #btn2, #btn3{
			border-top-left-radius: 5px;
			border-top-right-radius: 5px;
			border-bottom-left-radius: 5px;
			border-bottom-right-radius: 5px;
			border: 1px solid #ADACAC;
			background-color:#ADACAC;
			color : white;
			box-shadow: 1px 2px 0 rgb(0,0,0,0.5);
		}
		#btn1:hover, #btn2:hover, #btn3:hover{
			border: 1px solid #F97B5A;
			background-color:#F97B5A ;
			color : white;
			box-shadow: 1px 2px 0 rgb(0,0,0,0.5);
		}
		#btn1:active, #btn2:active, #btn3:active {
			border: 1px solid #E9E8E7;
			background-color:#F97B5A ;
			color : white;
			position: relative;
			box-shadow: 0px 0px 0 rgb(0,0,0,0.5);
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
									
									<%	if(info!=null){ %>
										<li><a href="l_mypage.jsp">mypage</a></li>
										
									<%	}else{ %>
										<li><a href="#">mypage</a>
											<ul>
												<li><a href="signin.jsp">sign in please</a></li>
											</ul>
										</li>
									<%	} %>
										
									<li><a href="#">top</a></li>
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
						        level: 8 // ������ Ȯ�� ����
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
	   					    //infowindow.open(map, marker);	// ���������츦 ��Ŀ���� ǥ��
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
						
						function btn(sample){
							alert(sample);
						}
						</script>
						<h3>�� �ֺ� ī�� </h3>
						<form action = "index.jsp" method = "post">
							<table align = "center">
								<tr align = "center">
									<td stlye="width: 10px;">�̸�</td>
									<td>Ƽ��</td>
									<td>�ƿ콺��</td>
									<td>��ȭ</td>
								</tr>
								<tr align = "center">
									<td stlye="width: 10px;"></td>
									<td><img src = "images/p1.PNG"></td>
									<td><img src = "images/p2.PNG"></td>
									<td><img src = "images/p3.PNG"></td>
								</tr>
								<tr align = "center">
									<td stlye="width: 10px;">�Ұ�</td>
									<td>������ ��ġ�� �� ������</td>
									<td>��Ȳ�۹� �����Ͻô� �е��� ������ ���ƿ�. �ƴ� ����ũ�� ���� �������� ���ھ��</td>
									<td>��..���÷� 1��9õ�� ���� ���ҽ��ϴ�. ������ �Ĵ���.... �׸��� �ڷγ������� �ѽð��ִ� �����ߵȴ��~ ó����.. �׳� ī�信 �ɾ� ��ġ�� �ִ°� �����ϴ°� ������.. Ŀ��2�ܿ� ���÷��� ���� 3������ �ٵ� �ѽð� ó���ϰ� �����ö󳻿�. �������� ģ��.. �̷� �� ���� ������ �������</td>
								</tr>
								<tr align = "center">
									<td stlye="width: 10px;">�ּ�</td>
									<td>���ֱ����� ���� ����</td>
									<td>���ֱ����� ���� ���� �����25���� 4-1</td>
									<td>���ֱ����� ���� ���� ����õ�� 151-31</td>
								</tr>
								<tr align = "center">
								
									<td stlye="width: 10px;"> </td>									
									<td><input type = 'submit' value = "����" id = "btn1" onclick ="javascript:btn('�̿� �� ����� �Խ��ǿ� �ı⸦ �����ֽø� ������� �帳�ϴ�.!')"></button></td>
									<td><input type = 'submit' value = "����" id = "btn1" onclick ="javascript:btn('�̿� �� ����� �Խ��ǿ� �ı⸦ �����ֽø� ������� �帳�ϴ�.!')"></button></td>
									<td><input type = 'submit' value = "����" id = "btn1" onclick ="javascript:btn('�̿� �� ����� �Խ��ǿ� �ı⸦ �����ֽø� ������� �帳�ϴ�.!')"></button></td>
									<!--<td><button id = "btn1" onclick ="javascript:btn('�̿� �� ����� �Խ��ǿ� �ı⸦ �����ֽø� ������� �帳�ϴ�.!')">����</button></td>-->
								</tr>
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