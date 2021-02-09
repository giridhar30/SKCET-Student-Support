package com.skcetstudentsupport.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skcetstudentsupport.service.StudentDao;


@WebServlet("/DeleteStudents")
public class DeleteStudents extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String from = request.getParameter("from").trim();
		String to = request.getParameter("to").trim();
		if (!valid(from, to)) {
			response.sendRedirect("admin-dashboard.jsp?err=cannot_delete");
			return;
		}
		String prefix = from.substring(0, 6);
		int f = Integer.parseInt(from.substring(6, from.length()));
		int t = Integer.parseInt(to.substring(6, to.length()));
		StudentDao studentDao = new StudentDao();
		
		for (int i = f; i <= t; i++) {
			
			String registerNo = "";
			if (i < 10) {
				registerNo = prefix + "00" + i;
			} else if (i < 100) {
				registerNo = prefix + "0" + i;
			} else {
				registerNo = prefix + i;
			}
			
			studentDao.delete(registerNo);
			
		}
		
		response.sendRedirect("admin-dashboard.jsp");
		
	}

	private boolean valid(String from, String to) {
		
		return from.substring(0, 6).equalsIgnoreCase(to.substring(0, 6))
				&& Pattern.matches("^[\\d]{2}[a-zA-Z]{2}[\\d]{4}$", from)
				&& Pattern.matches("^[\\d]{2}[a-zA-Z]{2}[\\d]{4}$", to);
		
	}

}
