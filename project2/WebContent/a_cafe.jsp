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
						        level: 8 // 지도의 확대 레벨
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
	   					    //infowindow.open(map, marker);	// 인포윈도우를 마커위에 표시
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
						
						function btn(sample){
							alert(sample);
						}
						</script>
						<h3>내 주변 카페 </h3>
						<form action = "index.jsp" method = "post">
							<table align = "center">
								<tr align = "center">
									<td stlye="width: 10px;">이름</td>
									<td>티앗</td>
									<td>아우스밀</td>
									<td>온화</td>
								</tr>
								<tr align = "center">
									<td stlye="width: 10px;"></td>
									<td><img src = "images/p1.PNG"></td>
									<td><img src = "images/p2.PNG"></td>
									<td><img src = "images/p3.PNG"></td>
								</tr>
								<tr align = "center">
									<td stlye="width: 10px;">소개</td>
									<td>동명동에 위치한 차 전문점</td>
									<td>구황작물 좋아하시는 분들은 좋은것 같아요. 아닌 케이크도 자주 나왔으면 좋겠어요</td>
									<td>흠..수플레 1만9천원 맛은 좋았습니다. 가격이 후덜덜.... 그리고 코로나때문에 한시간있다 나가야된대요~ 처음들어봄.. 그냥 카페에 앉아 죽치고 있는거 방지하는거 같은데.. 커피2잔에 수플레면 거의 3만원돈 근데 한시간 처묵하고 나가시라내요. 직원들은 친절.. 이런 룰 만든 사장은 어딨을까</td>
								</tr>
								<tr align = "center">
									<td stlye="width: 10px;">주소</td>
									<td>광주광역시 동구 동명동</td>
									<td>광주광역시 동구 동명동 동명로25번길 4-1</td>
									<td>광주광역시 동구 동명동 동계천로 151-31</td>
								</tr>
								<tr align = "center">
								
									<td stlye="width: 10px;"> </td>									
									<td><input type = 'submit' value = "선택" id = "btn1" onclick ="javascript:btn('이용 후 사용자 게시판에 후기를 남겨주시면 응모권을 드립니다.!')"></button></td>
									<td><input type = 'submit' value = "선택" id = "btn1" onclick ="javascript:btn('이용 후 사용자 게시판에 후기를 남겨주시면 응모권을 드립니다.!')"></button></td>
									<td><input type = 'submit' value = "선택" id = "btn1" onclick ="javascript:btn('이용 후 사용자 게시판에 후기를 남겨주시면 응모권을 드립니다.!')"></button></td>
									<!--<td><button id = "btn1" onclick ="javascript:btn('이용 후 사용자 게시판에 후기를 남겨주시면 응모권을 드립니다.!')">선택</button></td>-->
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