package com.skcetstudentsupport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skcetstudentsupport.service.EventDao;


@WebServlet("/DeleteEvent")
public class DeleteEvent extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		
		EventDao eventDao = new EventDao();
		eventDao.deleteEvent(id);
		response.sendRedirect("event-dashboard.jsp");
		
	}

}
