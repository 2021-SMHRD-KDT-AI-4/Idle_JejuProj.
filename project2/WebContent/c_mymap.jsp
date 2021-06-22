<%@page import="com.MemberDAO"%>
<%@page import="com.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<html>
	<head>
		<title>Generic - Alpha by HTML5 UP</title>
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
			MemberDTO info = (MemberDTO)session.getAttribute("info");  // ������ �ٿ�ĳ������
			MemberDAO dao = new MemberDAO();
			//ArrayList<MessageDTO> list = dao.select(info.getEmail());
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
   					       	 	center: new kakao.maps.LatLng(33.38158123679322, 126.53546236328559), // ������ �߽���ǥ
   					        	level: 10 // ������ Ȯ�� ����
   					    	};

		   					var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
		   					 
		   					// ��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 
		   					var positions = [
		   					    {
		   					        title: 'īī��', 
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
		   					];
		
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
		   					}
					   	</script>
					   
					   
						<h3>�ٳ�� �� ����Ʈ</h3>
						<form action = "c_mymap.jsp" method = "post">
							<table align = "center">
								<tr align = "center">
									<td>�̸�</td>
									<td>�ּ�</td>
									<td>������</td>
								</tr>
								<tr align = "center">
									<td>Ƽ��</td>
									<td>���ֱ����� ���� ����</td>
									<td>
										<form method="post" action="#">
										<div class="row gtr-uniform gtr-50">
											<div class="col-9 col-12-mobilep">
												<input type="text" name="rating" id="query" value="" placeholder="Query" />
											</div>
											<div class="col-3 col-12-mobilep">
												<input type="submit" id = "btn1" value="���" class="fit" />
											</div>
										</div>
										</form>
									
									</td>
								</tr>
								<tr>	
									<td>�ƿ콺��</td>
									<td>���ֱ����� ���� ���� �����25���� 4-1</td>
									<td>
										<div class="row gtr-uniform gtr-50">
											<div class="col-9 col-12-mobilep">
												<input type="text" name="rating" id="query" value="" placeholder="Query" />
											</div>
											<div align = "center" class="col-3 col-9-mobilep">
												<input type="submit" id = "btn1" value="���" class="fit" />
											</div>
										</div>
									</td>	
								</tr>
								<tr align = "center">
									<td>��ȭ</td>
									<td>���ֱ����� ���� ���� ����õ�� 151-31</td>
									<td>
										<div class="row gtr-uniform gtr-50">
											<div class="col-9 col-12-mobilep">
												<input type="text" name="rating" id="query" value="" placeholder="Query" />
											</div>
											<div align = "center" class="col-3 col-9-mobilep">
												<input type="submit" id = "btn1" value="���" class="fit" />
											</div>
										</div>
									</td>
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