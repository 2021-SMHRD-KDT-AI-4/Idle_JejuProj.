<<<<<<< HEAD
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		System.out.println(id+"/"+pw+"/"+name+"/"+phone+"/"+age);

		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "hr";
		String db_pw = "hr";
		Connection conn = DriverManager.getConnection(db_url, db_id, db_pw);
		
		String sql = "INSERT INTO WEB_MEMBER VALUES(?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,id);
		psmt.setString(2,pw);
		psmt.setString(3,name);
		psmt.setString(4,age);
		psmt.setString(5,phone);
		
		int cnt = psmt.executeUpdate();
		
		if(cnt > 0){
			System.out.println("회원가입 성공");
		}else{
			System.out.println("회원가입 실패");
		}
		
		if(psmt != null){
			psmt.close();	
		}
		if(conn != null){
			conn.close();
		}
		
		if(cnt >0 ){
			response.sendRedirect("index.jsp");
		}else{
			response.sendRedirect("signup.jsp");
		}
		
		
		
	%>
</body>
=======
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		System.out.println(id+"/"+pw+"/"+name+"/"+phone+"/"+age);

		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "hr";
		String db_pw = "hr";
		Connection conn = DriverManager.getConnection(db_url, db_id, db_pw);
		
		String sql = "INSERT INTO WEB_MEMBER VALUES(?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,id);
		psmt.setString(2,pw);
		psmt.setString(3,name);
		psmt.setString(4,age);
		psmt.setString(5,phone);
		
		int cnt = psmt.executeUpdate();
		
		if(cnt > 0){
			System.out.println("회원가입 성공");
		}else{
			System.out.println("회원가입 실패");
		}
		
		if(psmt != null){
			psmt.close();	
		}
		if(conn != null){
			conn.close();
		}
		
		if(cnt >0 ){
			response.sendRedirect("index.jsp");
		}else{
			response.sendRedirect("signup.jsp");
		}
		
		
		
	%>
</body>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-AI-4/Idle_JejuProj..git
</html>