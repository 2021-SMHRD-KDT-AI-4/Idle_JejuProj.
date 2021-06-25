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
			// 태그 지정
			String sql = "SELECT * FROM J_SIGHT WHERE AGROUP=? OR AGROUP IN('누구나') ";
			for (int i = 0; i < tag_info.getTag().length; i++) {
				sql += "OR BGROUP =?";
			}
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tag_info.getPeople());
			for (int i = 0; i < tag_info.getTag().length; i++) {
				psmt.setString(i+2, tag_info.getTag()[i]);
			}
			rs = psmt.executeQuery();
			
			// 방문 지역 제외
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
				
				// 거리 계산 공식
				double theta = lon1 - lon2;
				double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
				
				dist = Math.acos(dist);
				dist = rad2deg(dist);
				dist = dist * 60 * 1.1515;
				dist = dist*1.609344;
				
				// 거리 조절
				if (dist >= 6.0 && dist <= 10.0) {
					if (name != null) {
						distdto = new TourDTO(name, tInfo, addr, img, lat2, lon2, dist);
						recommend.add(distdto);
					}else {
						continue;
					}
				}
			}
			// DTO 정렬
			recommend = (ArrayList<TourDTO>) recommend.stream().sorted(Comparator.comparing(TourDTO::getCal)).collect(Collectors.toList());

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return recommend;
	}
	
	public ArrayList<TourDTO> res(ArrayList<String> visited_res, Double lat1, Double lon1) {
		
		
		ArrayList<TourDTO> restaurant = new ArrayList<TourDTO>();
		getConnection();
		try {
			// 태그 지정
			String sql = "SELECT * FROM J_RESTAURANT ";
			
			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();
			
			// 방문 지역 제외
			
			while (rs.next()) {
				String name = rs.getString("NAME");
			
				if(visited_res.isEmpty()){
					name = rs.getString("NAME");
				}else {
					for (int i = 0; i < visited_res.size(); i++) {
						if (visited_res.get(i).equals(name)) {
							name = null;
						}
					}
				}
			
				String tInfo = rs.getString("info");
				String addr = rs.getNString("addr");
				String img = rs.getString("img");
				Double lat2 = rs.getDouble("LAT");
				Double lon2 = rs.getDouble("LONGI");
				
				// 거리 계산 공식
				double theta = lon1 - lon2;
				double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
				
				dist = Math.acos(dist);
				dist = rad2deg(dist);
				dist = dist * 60 * 1.1515;
				dist = dist*1.609344;
				
				// 거리 조절
				if (dist >= 1.0 && dist <= 5.0) {
					
					if (name != null) {
						distdto = new TourDTO(name, tInfo, addr, img, lat2, lon2, dist);
						restaurant.add(distdto);
					}else {
						continue;
					}
					
					
				}
			}
			// DTO 정렬
			restaurant = (ArrayList<TourDTO>) restaurant.stream().sorted(Comparator.comparing(TourDTO::getCal)).collect(Collectors.toList());

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return restaurant;
	}


	public ArrayList<TourDTO> cafe(ArrayList<String> visited_cafe, Double lat1, Double lon1) {
		
		
		ArrayList<TourDTO> r_cafe = new ArrayList<TourDTO>();
		getConnection();
		try {
			// 태그 지정
			String sql = "SELECT * FROM J_CAFE ";
		
			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();
			
		
			while (rs.next()) {
				String name = rs.getString("NAME");
				
				if(visited_cafe.isEmpty()){
					name = rs.getString("NAME");
				}else {
					for (int i = 0; i < visited_cafe.size(); i++) {
						if (visited_cafe.get(i).equals(name)) {
							name = null;
						}
					}
				}
				
				String tInfo = rs.getString("info");
				String addr = rs.getNString("addr");
				String img = rs.getString("img");
				Double lat2 = rs.getDouble("LAT");
				Double lon2 = rs.getDouble("LONGI");
				
				// 거리 계산 공식
				double theta = lon1 - lon2;
				double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
				
				dist = Math.acos(dist);
				dist = rad2deg(dist);
				dist = dist * 60 * 1.1515;
				dist = dist*1.609344;
				
				// 거리 조절
				if (dist >= 0.5 && dist <= 3.0) {
				
					if (name != null) {
						distdto = new TourDTO(name, tInfo, addr, img, lat2, lon2, dist);
						r_cafe.add(distdto);
					}else {
						continue;
					}
					
				}
			}
			// DTO 정렬
			r_cafe = (ArrayList<TourDTO>) r_cafe.stream().sorted(Comparator.comparing(TourDTO::getCal)).collect(Collectors.toList());
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return r_cafe;
	}
	

	public ArrayList<TourDTO> mymap(ArrayList<String> visited) {
		getConnection();
		ArrayList<TourDTO> visited_info = new ArrayList<TourDTO>();
		System.out.println(visited.size());
		try {
			
			String sql = "SELECT * FROM J_SIGHT WHERE ";
			for (int i = 0; i < visited.size(); i++) {
				sql += "NAME = ? ";
				if (i != (visited.size()-1)) {

					sql += " OR ";
				}
			}
			psmt = conn.prepareStatement(sql);
			for (int i = 0; i < visited.size(); i++) {
				psmt.setString(i+1, visited.get(i));
			}
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString("NAME");
				String info = rs.getString("INFO");
				String addr = rs.getString("ADDR");
				Double lat = rs.getDouble("LAT");
				Double lon = rs.getDouble("LONGI");
				
				TourDTO visited_sight = new TourDTO(name, info, addr, lat, lon);
				visited_info.add(visited_sight);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return visited_info;
	}
}