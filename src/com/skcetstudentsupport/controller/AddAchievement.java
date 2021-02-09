package com.skcetstudentsupport.controller;


import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skcetstudentsupport.model.Achievement;
import com.skcetstudentsupport.model.Student;
import com.skcetstudentsupport.service.AchievementDao;


@WebServlet("/AddAchievement")
public class AddAchievement extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		Student user=(Student)session.getAttribute("user");
		String registerNo = user.getRegisterNo();
		String type=request.getParameter("Type");
		if(type.equals("Others"))
			type=request.getParameter("Other");
		String host=request.getParameter("Host");
		Date date=Date.valueOf(request.getParameter("Date"));
		String awards=request.getParameter("Awards");
		if(awards.equals("Others"))
			awards=request.getParameter("OtherAward");
		String description=request.getParameter("Description");
		String certificate=request.getParameter("certificate");
		
		Achievement obj=new Achievement(registerNo,type,host,date,awards,description,certificate);
		new AchievementDao().save(obj);
		
		response.sendRedirect("achievements.jsp");
	}
}
