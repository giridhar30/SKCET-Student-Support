package com.skcetstudentsupport.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skcetstudentsupport.model.Faculty;
import com.skcetstudentsupport.service.FacultyDao;


@WebServlet("/AddFaculty")
public class AddFaculty extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String facultyId = request.getParameter("facultyId").trim().toLowerCase();
		String name = request.getParameter("name").trim();
		String phone = request.getParameter("phone").trim();
		String email = request.getParameter("email").trim();
		
		if (valid(facultyId, name, email, phone)) {
			new FacultyDao().save(new Faculty(facultyId, name, email, phone));
    	}
		
		response.sendRedirect("admin-dashboard.jsp");
		
	}
	
	private boolean valid(String facultyId, String name, String email, String phone) {
		
		return Pattern.matches("^[\\d]{2}[a-zA-Z]{2}[\\d]{4}$", facultyId)
				&& Pattern.matches("^[a-zA-Z\\.]*$", name)
				&& Pattern.matches("^[6789]{1}[\\d]{9}$", phone)
				&& email.endsWith("@skcet.ac.in");
	
	}

}
