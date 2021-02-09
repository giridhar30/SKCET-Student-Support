package com.skcetstudentsupport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skcetstudentsupport.service.CgpaDao;

/**
 * Servlet implementation class StoreCgpa
 */
@WebServlet("/StoreCgpa")
public class StoreCgpa extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// create obj for cgpadao and call store cgpa(request.getParameter("totalsum");
		 CgpaDao obj=new CgpaDao();
		// System.out.println(request.getParameter("totalsum"));
		 //System.out.println(request.getParameter("semester"));
		 String arr[]=request.getParameter("totalsum_sem").split("\\?");
		 double totalsum=Double.parseDouble(arr[0]);
		 int semester=Integer.parseInt(arr[1]);
		 HttpSession session=request.getSession();
		 String register_no=(String)session.getAttribute("user_id");
		 obj.storeCgpa(totalsum,semester,register_no);
		 
		 
	}

}
