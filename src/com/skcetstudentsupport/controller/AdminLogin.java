package com.skcetstudentsupport.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skcetstudentsupport.model.Admin;
import com.skcetstudentsupport.service.AdminDao;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private AdminDao adminDao;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		
		if (!email.endsWith("@skcet.ac.in")) {
			response.sendRedirect("admin-login.jsp?err=wrong_credentials");
			return;
		}
		
		Admin admin = new Admin(email, password);
		
		adminDao = new AdminDao();
		if (adminDao.userExists(admin)) {
			HttpSession session = request.getSession();
			session.setAttribute("admin-logged-in", true);
			response.sendRedirect("admin-dashboard.jsp");
		} else {
			response.sendRedirect("admin-login.jsp?err=wrong_credentials");
		}

	}


}
