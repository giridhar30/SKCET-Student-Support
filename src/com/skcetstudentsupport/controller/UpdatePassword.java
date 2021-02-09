package com.skcetstudentsupport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skcetstudentsupport.model.Faculty;
import com.skcetstudentsupport.model.Student;
import com.skcetstudentsupport.service.FacultyDao;
import com.skcetstudentsupport.service.StudentDao;


@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Object user = request.getSession().getAttribute("user");
		if (user != null) {
			if (user instanceof Student) {
				new StudentDao().updatePassword(((Student)user).getRegisterNo(), request.getParameter("pass").trim());
				response.sendRedirect("student-dashboard.jsp");
			} else {
				new FacultyDao().updatePassword(((Faculty)user).getFacultyId(), request.getParameter("pass").trim());
				response.sendRedirect("faculty-dashboard.jsp");
			}
		}
		
	}

}
