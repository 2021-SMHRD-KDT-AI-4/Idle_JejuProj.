package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	BoardDTO bdto;
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	int cnt = 0;
	
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
	
	public int writeBoard(BoardDTO bdto) {
		
		getConnection();
		
		try {
			String sql = "INSERT INTO J_BOARD VALUES (JBOARD_NUM.NEXTVAL, ?, ?, ?, SYSDATE)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bdto.getTitle());
			psmt.setString(2, bdto.getContent());
			psmt.setString(3, bdto.getId());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public ArrayList<BoardDTO> selectAll() {
		ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
		getConnection();
		try {
			String sql = "SELECT * FROM J_BOARD ORDER BY DAY DESC";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				String date = rs.getString("day");
				
				bdto = new BoardDTO(num, title, content, id, date);
				blist.add(bdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return blist;
	}
	
	public BoardDTO view(int num) {
		BoardDTO bdto = null;
		getConnection();
		try {
			String sql = "SELECT * FROM J_BOARD WHERE NUM = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int board_num = rs.getInt("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				String date = rs.getString("day");
				
				bdto = new BoardDTO(board_num, title, content, id, date);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return bdto;
	}
}
