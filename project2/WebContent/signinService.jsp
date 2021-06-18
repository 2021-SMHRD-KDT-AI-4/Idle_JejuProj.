<%@page import="java.sql.ResultSet"%>
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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "hr";
		String db_pw = "hr";
		Connection conn = DriverManager.getConnection(db_url, db_id, db_pw);
		
		String sql = "SELECT * FROM JEJU_MEMBER WHERE ID = ? AND PW = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pw);
		
		 ResultSet rs = psmt.executeQuery();
		if(rs.next()){
			 String login_id = rs.getString(1);
		     String login_pw = rs.getString(2);
		     String login_name = rs.getString(3);
		     String login_age = rs.getString(4);
		     String login_phone = rs.getString(5);
		}
		
		if(rs != null){
			rs.close();
		}
		if(psmt != null){
			psmt.close();
		}
		if(conn != null){
			conn.close();
		}
	%>
</body>
</html>