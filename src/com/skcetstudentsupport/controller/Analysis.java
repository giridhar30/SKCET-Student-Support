package com.skcetstudentsupport.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skcetstudentsupport.service.AchievementDao;

/**
 * Servlet implementation class Analysis
 */
@WebServlet("/Analysis")
public class Analysis extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		AchievementDao obj=new AchievementDao();
		HttpSession session=request.getSession();
		response.setContentType("text/html");
	    PrintWriter out=response.getWriter();
	      
		String registerNo=(String)session.getAttribute("user_id");
		ArrayList<ArrayList<String>> data=obj.getData(registerNo);
		HashMap<String , Integer> a=new HashMap<String, Integer>();
		a.put("Others",0);a.put("Sports", 0);a.put("Culturals", 0);a.put("Hackathon", 0);a.put("Internship", 0);
		a.put("Paper Presentation", 0);a.put("Workshop", 0);
		
		ArrayList<String> type=new ArrayList<String>();
		type.add("Workshop");type.add("Paper Presentation");type.add("Hackathon");
		type.add("Internship");type.add("Culturals");type.add("Sports");
		for(int i=0;i<data.size();i++)
		{
			String s=data.get(i).get(1);
			if(type.contains(s))
			{
				int temp=a.get(s);
				a.put(s,temp+1);
			}
			else
			{
				int temp=a.get("Others");
				a.put("Others", temp+1);
			}
		}
		String details="";
		for(Map.Entry<String, Integer> i:a.entrySet())
		{
			details+=i.getValue()+"||";
		}
		out.println(details);
	}
}