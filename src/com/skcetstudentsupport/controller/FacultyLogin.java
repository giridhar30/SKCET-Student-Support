package com.skcetstudentsupport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skcetstudentsupport.model.Faculty;
import com.skcetstudentsupport.service.FacultyDao;


@WebServlet("/FacultyLogin")
public class FacultyLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String facultyId = request.getParameter("facultyId").trim().toLowerCase();
		String password = request.getParameter("password").trim();
		
		Faculty faculty = new FacultyDao().fetchUser(facultyId, password);
		if (faculty != null) {
			HttpSession session = request.getSession();
			session.setAttribute("logged-in", true);
			session.setAttribute("user", faculty);
			response.sendRedirect("faculty-dashboard.jsp");
		} else {
			response.sendRedirect("faculty-login.jsp?err=wrong_credentials");
		}
	
	}

}
