package com.skcetstudentsupport.controller;
import java.io.PrintWriter;
import java.lang.Math.*;
import java.util.ArrayList;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skcetstudentsupport.model.Faculty;
import com.skcetstudentsupport.service.CgpaDao;
@WebServlet("/IndividualCgpa")
public class IndividualCgpa extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		  CgpaDao obj=new CgpaDao();
	      response.setContentType("text/html");
	      PrintWriter out=response.getWriter();
	      //System.out.println("hi");
	      String reg_no=request.getParameter("reg_no");	
	      
	      HttpSession session = request.getSession();
	      Object user = session.getAttribute("user");
	      if (user != null && user instanceof Faculty) {
	    	  if (!((Faculty)user).getDepartment().equalsIgnoreCase(reg_no.substring(4, 6))) {
	    		  out.print("Not your department!");
		    	  return;
	    	  }
	      }
	      
	      ArrayList<Double> sgpa=obj.getCgpa(reg_no);
	      double sum=0.0;
			int count=0;
			for(int i=0;i<sgpa.size();i++)
			{ 
				sum+=sgpa.get(i);
				if(sgpa.get(i)!=0.0)
					count++;
			}
			sum/=count;
	     out.println("<table><tr>"
	     		+ "<td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center>Semester</td>"
	     		+ "<td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center>Sgpa</center></td></tr>");
	     
	      for(int i=0;i<sgpa.size();i++)
	      {
	    	  out.println("<tr><td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"><center>"+(i+1)+"</center> </td> "
	    	  		+ "<td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"><center>"+sgpa.get(i)+"</center></td></tr>");
	      }
	      out.println("<tr><td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"><center>"+"CGPA"+"</center></td>"
	      		+ "<td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"><center>"+Math.round(sum*100.0)/100.0+"</center></td></tr>");
	      
	      out.println("</table>");
	}
}
