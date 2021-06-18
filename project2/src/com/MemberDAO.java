package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	private void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs != null){
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int signup(MemberDTO dto) {
		
		int cnt = 0;
		
		try {
			getConnection();
			
			String sql = "INSERT INTO JEJU_MEMBER VALUES(?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,dto.getId());
			psmt.setString(2,dto.getPw());
			psmt.setString(3,dto.getName());
			psmt.setString(4,dto.getAge());
			psmt.setString(5,dto.getPhone());
			
			cnt = psmt.executeUpdate();
			
			if(cnt > 0){
				System.out.println("회원가입 성공");
			}else{
				System.out.println("회원가입 실패");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 회원 탈퇴
	public int out(MemberDTO dto) {
		
		int cnt = 0;
		
		try {
			getConnection();
			
			String sql = "DELETE FROM JEJU_MEMBER WHERE ID = ? AND PW = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,dto.getId());
			psmt.setString(2,dto.getPw());
			cnt = psmt.executeUpdate();
			
			if(cnt > 0){
				System.out.println("회원탈퇴 성공");
			}else{
				System.out.println("회원탈퇴 실패");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public MemberDTO signin(MemberDTO dto) {
		
		MemberDTO info = null;

		try {
			getConnection();
			
			String sql = "SELECT * FROM JEJU_MEMBER WHERE ID = ? AND PW = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			
			rs = psmt.executeQuery();
			if(rs.next()){
				 String login_id = rs.getString(1);
			     String login_pw = rs.getString(2);
			     String login_name = rs.getString(3);
			     String login_age = rs.getString(4);
			     String login_phone = rs.getString(5);
			     
			     System.out.println(login_id+"/ "+login_pw+"/ "+login_name+"/ "+login_phone+"/ "+login_age);
			     info = new MemberDTO(login_id, login_pw, login_name, login_age, login_phone);
			     
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return info;
		
	}

	// 회원정보 수정
	public int update(MemberDTO dto) {

		int cnt = 0;
		
		try {
			getConnection();
			
			String sql = "UPDATE JEJU_MEMBER SET NAME = ?, PHONE = ?, Age  = ? WHERE ID = ? AND PW = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,dto.getName());
			psmt.setString(2,dto.getPhone());
			psmt.setString(3,dto.getAge());
			psmt.setString(4,dto.getId());
			psmt.setString(5,dto.getPw());
			
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
