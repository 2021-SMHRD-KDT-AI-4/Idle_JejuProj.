<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>게시판│JEJUGo</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	
	<style>
		
		a {
		-moz-transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		-webkit-transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		-ms-transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		border-bottom-color: transparent;
		color: #777;
		text-decoration: none;
		}
		a:hover {
			border-bottom: dotted 1px;
		}
	
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
		
		table { table-layout:fixed; }
		
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
									
							<li><a href="b_boardmain.jsp">top</a></li>
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
				<a href = "b_boardmain.jsp"><h2>NOTICE BOARD</h2></a>
				<p>게시판</p>
			</header>
			<div id="board">
			<table id = "list">
				<thead>
					<tr>
						<th width = "8%" align = "center">번호</th>
						<th width = "52%" align = "center">제목</th>
						<th width = "25%" align = "center">작성자</th>
						<th width = "25%" align = "center">작성일</th>
					</tr>
				</thead>
				<tbody>
				
				
				<% /*	
					// ★수정필요★
					ArrayList list = new ArrayList(); 
					for(int i=0; i<list.size(); i++){ %>
					<tr>
						<td><%= i+1 %></td>
						<td><a href = "b_viewboard.jsp"><%= list.get(i).getTitle() %></a></td>
						<td><%= list.get(i).getName() %></td>
						<td><%= list.get(i).getDay() %></td>
						<!--<td><a href = "MessageDeleteOne?num=<%= list.get(i).getNum()%>">삭제</td>-->
					</tr>
				<%	} */%>
					<tr>
						<td width = "8%" >1</td>
						<td width = "52%"><a href = "b_viewboard.jsp">이것은 제목이다</td>
						<td width = "25%">작성자</td>
						<td width = "25%">2021/06/21</td>
					</tr>
				
				</tbody>
			</table>
				<% if(info == null) { %>
					<a href="b_boardmain.jsp"><button id = "btn1" align ="right" id="writer">작성하기</button></a>
					<script> alert("로그인 후 이용해주세요"); </script>
					
				<% } else {%>
					<a href="b_writeboard.jsp"><button id = "btn1" align ="right" id="writer">작성하기</button></a>
				<% } %>
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

		

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

			</script>



	</body>
</html>