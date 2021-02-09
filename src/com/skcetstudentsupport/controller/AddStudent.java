package com.skcetstudentsupport.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skcetstudentsupport.model.Student;
import com.skcetstudentsupport.service.StudentDao;


@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String registerNo = request.getParameter("registerNo").trim();
		String name = request.getParameter("name").trim();
		char section = request.getParameter("section").trim().charAt(0);
		String phone = request.getParameter("phone").trim();
		if (valid(registerNo,name,phone)) {
			new StudentDao().save(new Student(registerNo, name, section, phone));
    	}
		
		response.sendRedirect("admin-dashboard.jsp?add=student");
		
	}
	
	private boolean valid(String registerNo, String name, String phone) {

		return Pattern.matches("^[\\d]{2}[a-zA-Z]{4}[\\d]{3}$", registerNo)
				&& Pattern.matches("^[a-zA-Z\\.]*$", name)
				&& Pattern.matches("^[6789]{1}[\\d]{9}$", phone);
		
	}

}
