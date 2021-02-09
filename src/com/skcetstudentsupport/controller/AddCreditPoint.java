package com.skcetstudentsupport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skcetstudentsupport.model.CreditPoint;
import com.skcetstudentsupport.model.Faculty;
import com.skcetstudentsupport.service.CreditPointDao;


@WebServlet("/AddCreditPoint")
public class AddCreditPoint extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int semNo = Integer.parseInt(request.getParameter("semester").trim());
		String subjectCode = request.getParameter("subjectCode").trim();
		String subject = request.getParameter("subject").trim();
		float credits = Float.parseFloat(request.getParameter("credits").trim());
		String department = ((Faculty)request.getSession().getAttribute("user")).getDepartment();
		
		new CreditPointDao().saveCreditPoint(new CreditPoint(semNo, subjectCode, subject, credits, department));
		response.sendRedirect("add-credits.jsp");
		
	}

}
