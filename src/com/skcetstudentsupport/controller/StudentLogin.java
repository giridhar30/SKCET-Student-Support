package com.skcetstudentsupport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skcetstudentsupport.model.Student;
import com.skcetstudentsupport.service.StudentDao;


@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String registerNo = request.getParameter("registerNo").trim().toLowerCase();
		String password = request.getParameter("password").trim();
		
		Student student = new StudentDao().fetchUser(registerNo, password);
		if (student != null) {
			HttpSession session = request.getSession();
			session.setAttribute("logged-in", true);
			session.setAttribute("user", student);
			session.setAttribute("user_id", student.getRegisterNo());
			response.sendRedirect("student-dashboard.jsp");
		} else {
			response.sendRedirect("student-login.jsp?err=wrong_credentials");
		}
	
	}

}
