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

@WebServlet("/messageUpdate")
public class messageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		BoardDTO vlist = (BoardDTO)session.getAttribute("vlist");
		String content = request.getParameter("content");
		
		BoardDAO bdao = new BoardDAO();
		BoardDTO bdto = new BoardDTO(vlist.getTitle(), content, vlist.getId());
		int cnt = bdao.update(bdto);
		
		if (cnt >0) {
			response.sendRedirect("b_boardmain.jsp");
		}else {
			response.sendRedirect("b_updateboard.jsp");
		}
		
	}

}
