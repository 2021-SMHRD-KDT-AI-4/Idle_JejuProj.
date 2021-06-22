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

			
						
						<h3>게시글 </h3>
						<div id="board">
							<table id = "list">
								<thead>
									<tr>
										<th>NUMBER</th>
										<th>TITLE</th>
										<th>CONTENT</th>
										<th>TIME</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><a href = "b_viewboard.jsp">1</a></td>
										<td>여행계획</td>
										<td>너무좋군</td>
										<td></td>
									</tr>
									<tr>
										<td><a href = "b_viewboard.jsp">2</a></td>
										<td>여행계획1</td>
										<td>너무좋군1</td>
										<td></td>
									</tr>
									<tr>
										<td><a href = "b_viewboard.jsp">3</a></td>
										<td>여행계획2</td>
										<td>너무좋군2</td>
										<td></td>
									</tr>
								</tbody>
							</table>
							<a href="b_writeboard.jsp"><button align ="center" id="writer">작성하러가기</button></a>
						</div>
					</div>
					
						
				

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