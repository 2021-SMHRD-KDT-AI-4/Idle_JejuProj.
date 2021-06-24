package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.BoardDAO;
import com.BoardDTO;

@WebServlet("/viewBoard")
public class viewBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO bdao = new BoardDAO();
		BoardDTO vlist = bdao.view(num);
		
		if (vlist != null) {
			System.out.println("view ¼º°ø");
			session.setAttribute("vlist", vlist);
			response.sendRedirect("b_viewboard.jsp");
		}else {
			response.sendRedirect("b_boardmain.jsp");
		}

	}
}