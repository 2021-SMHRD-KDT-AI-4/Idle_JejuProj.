package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.TourDTO;
import com.TourInfoDTO;

@WebServlet("/Choice")
public class Choice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ArrayList<TourDTO> recommend = (ArrayList)session.getAttribute("recommend");
		ArrayList<String> visited = (ArrayList)session.getAttribute("visited");
		TourInfoDTO loc =  (TourInfoDTO)session.getAttribute("loc");
		
		int index = Integer.parseInt(request.getParameter("index"));
		Double lat = Double.parseDouble(request.getParameter("lat"));
		Double lon = Double.parseDouble(request.getParameter("lon"));
		
		loc = new TourInfoDTO(lat, lon);

		visited.add(recommend.get(index).getName());

		session.setAttribute("loc", loc);
		session.setAttribute("visited", visited);
		response.sendRedirect("index.jsp");
	}

}
