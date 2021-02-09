package com.skcetstudentsupport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skcetstudentsupport.service.CreditPointDao;

@WebServlet("/DeleteCreditPoint")
public class DeleteCreditPoint extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String subjectCode = request.getParameter("subcode").trim();
		String department = request.getParameter("dept").trim();
		
		new CreditPointDao().delete(subjectCode, department);
		
	}

}
