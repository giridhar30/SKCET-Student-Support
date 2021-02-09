package com.skcetstudentsupport.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skcetstudentsupport.model.Achievement;
import com.skcetstudentsupport.service.AchievementDao;

/**
 * Servlet implementation class UpdateAchievement
 */
@WebServlet("/UpdateAchievement")
public class UpdateAchievement extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession();
		
		String registerNo=(String)session.getAttribute("user_id");
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
		int id=Integer.parseInt(request.getParameter("update_id"));
		
		Achievement obj=new Achievement(registerNo,type,host,date,awards,description,certificate);
		new AchievementDao().update(obj,id);
		
		response.sendRedirect("achievements.jsp");
	}
}
