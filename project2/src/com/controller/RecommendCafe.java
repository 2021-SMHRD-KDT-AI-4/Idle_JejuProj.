package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TourDAO;
import com.TourDTO;
import com.TourInfoDTO;


@WebServlet("/RecommendCafe")
public class RecommendCafe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		TourInfoDTO loc =  (TourInfoDTO)session.getAttribute("loc");
		ArrayList<String> visited_cafe = (ArrayList)session.getAttribute("visited_cafe");
		Double gps_lat = loc.getLat();
		Double gps_lon = loc.getLon();
		
		TourDAO tdao = new TourDAO();
		ArrayList<TourDTO> recommend_cafe = tdao.cafe(visited_cafe, gps_lat, gps_lon);

		session.setAttribute("recommend_cafe", recommend_cafe);
		response.sendRedirect("a_cafe.jsp");
	}

}
