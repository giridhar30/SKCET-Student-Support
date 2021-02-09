package com.skcetstudentsupport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skcetstudentsupport.model.Event;
import com.skcetstudentsupport.model.Faculty;
import com.skcetstudentsupport.service.EventDao;


@WebServlet("/AddEvent")
public class AddEvent extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		String organization = request.getParameter("organization");
		String description = request.getParameter("description");
		String date = request.getParameter("date");
		String expiryDate = request.getParameter("expiry_date");
		String contact = ((Faculty)request.getSession().getAttribute("user")).getEmail();
		String link = request.getParameter("link");
		
		Event event = new Event(name, description, date, expiryDate, link, contact, organization);
		
		EventDao eventDao = new EventDao();
		eventDao.addEvent(event);
		response.sendRedirect("event-dashboard.jsp");
		
	}

}
