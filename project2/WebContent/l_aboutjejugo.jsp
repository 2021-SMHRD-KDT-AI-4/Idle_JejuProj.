<%@page import="com.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
		<head>
		<title>About│JEJUGo</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		
		<style type="text/css">
			image{
				text-align: center;
			}
			table {
				margin: 0 0 2em 0;
				width: 100%;
			}

			table tbody tr {
				border: solid 1px #f8f8f8;
				border-left: 0;
				border-right: 0;
				background-color: white;
				
			}

			table tbody tr:nth-child(2n + 1) {
				background-color: white;
				height: 533px;
			}

		table td {
			padding: 0.75em 0.75em;
		}
			<!-- e5e5e5   f8f8f8 -->
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
										
							<li><a href="l_aboutjejugo.jsp">top</a></li>
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
				<a  href = "l_aboutjejugo.jsp"><h2>About JEJUGo</h2></a>
				<p>든든한 여행 메이트 JEJUGo</p>
			</header>
			<div class="box">
				<h3>제주고는</h3>
				<p> 　2021년 스마트 인재 개발원 인공지능 4차반에서 진행된 프로젝트로 사용자의 위치, 여행 특성을 이용해 다음 여행지를 추천해 줌으로써 제주도 관광을 도와주는 프로그램입니다.<br><br>
					　계획 없이 떠난 제주도, 여행 길잡이 제주고와 함께 행복한 추억 쌓아보시는게 어떤가요?
				</p>
				
				<span class="image featured"><img src="images/jeju_about.PNG" alt="" /></span>
				<div class="row">
					
					<div class="row-6 row-12-mobilep">
					
						<h3><br>프로젝트 참여인원</h3>
						<p>김동준(총괄)　dongjunHi@gmail.com<br>이인규  　　　  phosphorus@gmail.com <br>한혁진  　　　  jinjinjaRa@gmail.com <br>박정민  　　　 domdomdari@gmail.com</p>
					</div>
				</div>
				
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