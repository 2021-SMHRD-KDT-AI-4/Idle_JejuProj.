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

@WebServlet("/Mymap")
public class Mymap extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		 
		ArrayList<String> visited = (ArrayList)session.getAttribute("visited");
		
		TourDAO tdao = new TourDAO();
		ArrayList<TourDTO> visited_info = tdao.mymap(visited);
		session.setAttribute("visited_info", visited_info);
		response.sendRedirect("c_mymap.jsp");
		 
	
	}

}
