package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.BoardDAO;
import com.BoardDTO;

@WebServlet("/messageDelete")
public class messageDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		BoardDTO vlist = (BoardDTO)session.getAttribute("vlist");
		
		BoardDAO bdao = new BoardDAO();
		int cnt = bdao.delete(vlist.getNum());
		
		if (cnt > 0) {
			response.sendRedirect("b_boardmain.jsp");
		}else {
			response.sendRedirect("b_viewboard.jsp");
		}
	}
}
