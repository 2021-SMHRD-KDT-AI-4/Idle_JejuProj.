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

@WebServlet("/RecommendDist")
public class RecommendDist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		TourInfoDTO loc =  (TourInfoDTO)session.getAttribute("loc");
		TourInfoDTO tag_info =  (TourInfoDTO)session.getAttribute("tag_info");
		ArrayList<String> visited = (ArrayList)session.getAttribute("visited");
		Double gps_lat = loc.getLat();
		Double gps_lon = loc.getLon();
		
		TourDAO tdao = new TourDAO();
		ArrayList<TourDTO> recommend = tdao.dist(visited, tag_info, gps_lat, gps_lon);

		session.setAttribute("recommend", recommend);
		response.sendRedirect("a_destination.jsp");
	}
}
