package com.skcetstudentsupport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skcetstudentsupport.service.InterestDao;


@WebServlet("/UpdateInterest")
public class UpdateInterest extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String registerNo = request.getParameter("registerNo");
		int eventId = Integer.parseInt(request.getParameter("eventId"));
		
		InterestDao interestDao = new InterestDao();
		response.getWriter().print(interestDao.updateInterest(registerNo, eventId));
		
	}

}
