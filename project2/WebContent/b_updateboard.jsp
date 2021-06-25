<%@page import="com.BoardDTO"%>
<%@page import="com.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>게시글 작성│JEJUGo</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	
	<style>
		@font-face {
			font-family : "jejuFont";
			src: url("./assets/css/jejuFont.ttf")
		}
		.jfont{
			font-family: "jejuFont";
		}
	
		#btn1 {
			border-top-left-radius: 5px;
			border-top-right-radius: 5px;
			border-bottom-left-radius: 5px;
			border-bottom-right-radius: 5px;
			border: 1px solid #ADACAC;
			background-color:#ADACAC;
			color : white;
			box-shadow: 1px 2px 0 rgb(0,0,0,0.5);
		}
		#btn1:hover {
			border: 1px solid #F97B5A;
			background-color:#F97B5A ;
			color : white;
			box-shadow: 1px 2px 0 rgb(0,0,0,0.5);
		}
		#btn1:active {
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
			BoardDTO vlist = (BoardDTO)session.getAttribute("vlist");
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
										
							<li><a href="b_writeboard.jsp">top</a></li>
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
				<h2 class="jfont" style="font-size:100px;">NOTICE BOARD</h2>
				<p class="jfont" style="font-size:50px;">게시글 수정</p>
			</header>
			<div id = "board">
			<form action="messageUpdate" method="post">
				<table id="list">
					<tr>
						<td style = "width: 20%;", align = "center">제목</td>
						<td style = "width: 80%;"><%= vlist.getTitle() %></td>
					</tr>
					<tr>
						<td style = "width: 20%;", align = "center">내용</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="file" style="float: right;" name = "img">
							<textarea rows="10" style="resize: none;" name = "content"></textarea>			
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<input id = "btn1" type="reset" value="초기화">
							<input id = "btn1" type="submit" value="수정하기">
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