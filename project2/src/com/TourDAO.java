package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.stream.Collectors;

public class TourDAO {

	TourDTO distdto;
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
	
	private static double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}
	private static double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}
	
	public ArrayList<TourDTO> dist(ArrayList<String> visited, TourInfoDTO tag_info, Double lat1, Double lon1) {
		
		
		ArrayList<TourDTO> recommend = new ArrayList<TourDTO>();
		getConnection();
		try {
			// �±� ����
			String sql = "SELECT * FROM J_SIGHT WHERE AGROUP=? OR AGROUP IN('������') ";
			for (int i = 0; i < tag_info.getTag().length; i++) {
				sql += "OR BGROUP =?";
			}
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tag_info.getPeople());
			for (int i = 0; i < tag_info.getTag().length; i++) {
				psmt.setString(i+2, tag_info.getTag()[i]);
			}
			rs = psmt.executeQuery();
			
			// �湮 ���� ����
			while (rs.next()) {
				String name = rs.getString("NAME");
				if(visited.isEmpty()){
					name = rs.getString("NAME");
				}else {
					for (int i = 0; i < visited.size(); i++) {
						if (visited.get(i).equals(name)) {
							name = null;
						}
					}
				}
				String tInfo = rs.getString("info");
				String addr = rs.getNString("addr");
				String img = rs.getString("img");
				Double lat2 = rs.getDouble("LAT");
				Double lon2 = rs.getDouble("LONGI");
				
				// �Ÿ� ��� ����
				double theta = lon1 - lon2;
				double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
				
				dist = Math.acos(dist);
				dist = rad2deg(dist);
				dist = dist * 60 * 1.1515;
				dist = dist*1.609344;
				
				// �Ÿ� ����
				if (dist >= 5.0 && dist <= 10.0) {
					if (name != null) {
						distdto = new TourDTO(name, tInfo, addr, img, lat2, lon2, dist);
						recommend.add(distdto);
					}else {
						continue;
					}
				}
			}
			// DTO ����
			recommend = (ArrayList<TourDTO>) recommend.stream().sorted(Comparator.comparing(TourDTO::getCal)).collect(Collectors.toList());

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return recommend;
	}
}