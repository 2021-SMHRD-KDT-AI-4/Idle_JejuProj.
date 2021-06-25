package com.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.MemberDAO;
import com.MemberDTO;

@WebServlet("/signinService")
public class signinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDTO dto = new MemberDTO(id, pw);
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.signin(dto);
		
		if (info != null) {
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
			response.sendRedirect("index.jsp");
		}else {
			response.sendRedirect("signin.jsp");
			System.out.println("로그인 실패");
		}
		
	}

}

