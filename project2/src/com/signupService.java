package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signupService")
public class signupService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		
		MemberDTO dto = new MemberDTO(id, pw, name, age, phone);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.signup(dto);
		
		if(cnt > 0 ){
			response.sendRedirect("index.jsp");
		}else{
			response.sendRedirect("signup.jsp");
		}
	}

}
