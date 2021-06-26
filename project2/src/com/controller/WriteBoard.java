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
import com.MemberDTO;

@WebServlet("/WriteBoard")
public class WriteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		
		String title = request.getParameter("title");
		MemberDTO id = (MemberDTO)session.getAttribute("info");
		String content = request.getParameter("content");
		
		System.out.println(content);
		
		BoardDTO bdto = new BoardDTO(title, content, id.getId());
		BoardDAO bdao = new BoardDAO();
		
		int cnt = bdao.writeBoard(bdto);
		
		if (cnt >0) {
			response.sendRedirect("b_boardmain.jsp");
		}else {
			System.out.println("입력 실패");
			response.sendRedirect("b_writeboard.jsp");
		}
		
	}

}
