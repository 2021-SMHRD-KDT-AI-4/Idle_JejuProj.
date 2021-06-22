<%@page import="com.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
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
				MemberDTO info =  (MemberDTO)session.getAttribute("info");  
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
						<h2>BOARD</h2>
						<p>문의사항을 남겨주세요</p>
					</header>
					<div id = "board">
				<form action="">
				<table id="list">
					<tr>
						<td>TITLE</td>
						<td><input type="text" name="title"> </td>
					</tr>
					<tr>
						<td>WRITER</td>
						<td><input type="text" name="writer"> </td>
					</tr>
					<tr>
						<td colspan="2">CONTENT</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="file" style="float: right;">
							<textarea rows="10" style="resize: none;"></textarea>			
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<input type="reset" value="초기화">
							<input type="submit" value="작성하기">
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