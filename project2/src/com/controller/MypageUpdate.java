package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.MemberDAO;
import com.MemberDTO;


@WebServlet("/MypageUpdate")
public class MypageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		
		MemberDTO info = (MemberDTO)session.getAttribute("info");  // ������ �ٿ�ĳ������
		
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		String sub = request.getParameter("sub");
	
		MemberDTO dto = new MemberDTO(info.getId(), pw, name, age, phone);
		MemberDAO dao = new MemberDAO();
		
		if(sub.equals("���� ����")) {
			int cnt = dao.update(dto);
			if(cnt>0) {
				session.setAttribute("info",dto);
				System.out.println("������Ʈ ����");
				response.sendRedirect("l_mypage.jsp");
			}else {
				response.sendRedirect("l_update.jsp");
				System.out.println("����");
			}
		}else {
			int cnt = dao.delete(info.getId());
			if(cnt>0) {
				session.removeAttribute("info");
				System.out.println("Ż�� ����");
				response.sendRedirect("index.jsp");
			}else {
				response.sendRedirect("l_mypage.jsp");
				System.out.println("����");
			}
		}
		
	}

}
