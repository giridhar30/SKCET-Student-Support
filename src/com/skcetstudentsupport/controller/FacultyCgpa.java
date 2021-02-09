package com.skcetstudentsupport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.skcetstudentsupport.model.Faculty;
import com.skcetstudentsupport.service.CgpaDao;
/**
 * Servlet implementation class FacultyCgpa
 */
@WebServlet("/FacultyCgpa")
public class FacultyCgpa extends HttpServlet {
	   
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		
  	  CgpaDao obj=new CgpaDao();
      response.setContentType("text/html");
      PrintWriter out=response.getWriter();  	
   		
      String s[]=request.getParameter("from").split("\\?");
      String from=s[0];
      String to=s[1];
      

      String dept = to.substring(4, 6);
      Object user = request.getSession().getAttribute("user");
		if (user instanceof Faculty && to.substring(0, 4).equals(from.substring(0, 4))) {
			if (!((Faculty)user).getDepartment().equalsIgnoreCase(dept)) {
				return;
			}
		} else return;
      
      
      
      ArrayList<Double> a=obj.getTotalCgpa(s[0], s[1]);
      
      String details="";
      for(int i=0;i<a.size();i++)
      {
    	  if(i==a.size()-1)
    		  details+=a.get(i);
    	  else
    		  details+=a.get(i)+"||";
      }
      out.println(details);
	}
}

