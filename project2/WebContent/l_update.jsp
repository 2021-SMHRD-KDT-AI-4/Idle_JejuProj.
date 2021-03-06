<%@page import="com.MemberDAO"%>
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
			MemberDTO info = (MemberDTO)session.getAttribute("info");  // 오른쪽 다운캐스팅함
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
								<li><a href="l_mypage.jsp">Mypage</a></li>
										
							<%	}else{ %>
								<li><a href="#">Mypage</a>
									<ul>
										<li><a href="signin.jsp">sign in please</a></li>
									</ul>
								</li>
							<%	} %>
							<li><a href="l_mypage.jsp">Top</a></li>
						</ul>
					</li>
					<li><a href="signup.jsp" class="button">Sign Up</a></li>
				</ul>
			</nav>
		</header>
					
				<!-- Form -->
					<section id="main" class="container">
						<header>
							<h2 align="center">회원정보 수정</h2>
						</header>
						<section class="box">
						<form method="post" action="MypageUpdate">
							<div class="row"  >
								<div class="col-12 col-8-mobilep">
									
										<div class="row gtr-uniform gtr-50" align="right">
											<div class="col-12 col-12-mobilep">
												<input type="password" name="pw" id="pw" value="" placeholder="비밀번호를 입력하세요" />
											</div>
											<div class="col-12 col-12-mobilep">
												<input type="text" name="name" id="name" value="" placeholder="이름을 입력하세요" />
											</div>
											<div class="col-12 col-12-mobilep">
												<input type="text" name="age" id="age" value="" placeholder="나이를 입력하세요 (숫자만 입력)" />
											</div>
											<div class="col-12 col-12-mobilep">
												<input type="text" name="phone" id="phone" value="" placeholder="연락처를 입력하세요 ('-'을 제외한 숫자만 입력)" />
											</div>
											
											<div class="col-12">
												<input type="submit" name="sub" value="정보 수정"  class="button special small">
												<a href="l_mypage.jsp" class="button alt small">취소</a>
											</div>
										</div>						
									</div>
								</div>
							</form>
						</section>
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