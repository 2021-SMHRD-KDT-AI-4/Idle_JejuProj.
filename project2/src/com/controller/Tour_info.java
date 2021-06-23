package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TourInfoDTO;

@WebServlet("/Tour_info")
public class Tour_info extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		
		ArrayList<String> visited = new ArrayList<String>();
		
		String[] tag = request.getParameterValues("tag");
		String people = request.getParameter("people");
		String day = request.getParameter("day");
		Double lat = 33.510650537434664;
		Double lon = 126.49125683810726;
		
		TourInfoDTO loc = new TourInfoDTO(lat, lon);
		TourInfoDTO tag_info = new TourInfoDTO(tag, day, people);
		
		HttpSession session = request.getSession();
		session.setAttribute("visited", visited);
		session.setAttribute("loc", loc);
		session.setAttribute("tag_info", tag_info);
		response.sendRedirect("index.jsp");
	}

}
