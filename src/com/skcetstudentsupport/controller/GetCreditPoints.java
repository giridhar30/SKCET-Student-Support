package com.skcetstudentsupport.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skcetstudentsupport.model.Faculty;
import com.skcetstudentsupport.model.Student;
import com.skcetstudentsupport.service.CgpaDao;


@WebServlet("/GetCreditPoints")
public class GetCreditPoints extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CgpaDao obj=new CgpaDao();
	      response.setContentType("text/html");
	      PrintWriter out=response.getWriter();
	      
	      ArrayList<String> no_subject=new ArrayList<String>();
	      no_subject.add("one");no_subject.add("two");no_subject.add("three");no_subject.add("four");
	      no_subject.add("five");no_subject.add("six");no_subject.add("seven");no_subject.add("eight");
	      
	      ArrayList<String> subject_credits=new ArrayList<String>();
	      subject_credits.add("onecredit");subject_credits.add("twocredit");subject_credits.add("threecredit");subject_credits.add("fourcredit");
	      subject_credits.add("fivecredit");subject_credits.add("sixcredit");subject_credits.add("sevencredit");subject_credits.add("eightcredit");
	      
	      ArrayList<ArrayList<String>> a = null;
	      Object user = request.getSession().getAttribute("user");
	      if (user instanceof Student) 
	    	  a=obj.getCredits(request.getParameter("semester"),((Student)user).getDepartment());
	      else
	    	  a=obj.getCredits(request.getParameter("semester"),((Faculty)user).getDepartment());
	      
	      //out.println("<table> <tr> <td style= \"width : 70px;\"> S.No </td> <td style= \"width : 150px;\"> Subject Code </td> <td style= \"width : 250px;\"> Subject Name </td> <td style= \"width : 100px;\"> Credits </td> <td> Grades </td> </tr>");
	      out.println("<table> <tr>"+
                "<td style= \"width : 30px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center> S.No </center></td>"+ 
                "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center> Subject Code </center></td>"+ 
               "<td style= \"width : 250px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center> Subject Name </center></td>"+ 
               "<td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center> Credits </center></td> "+
                "<td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center> Action </center></td> "+
               "</tr>");
	      for(int i=0;i<a.size();i++)
	      {
	    	  out.println("<tr> <td style=\"width : 30px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+ (i+1) +"</td>"
	    	  		+ " <td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"> "+ a.get(i).get(0) +" </td> "
	    	  		+ "<td style= \"width : 250px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"> "+ a.get(i).get(1) +" </td> "
	    	  		+ "<td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\" id = \""+subject_credits.get(i)+"\" name = \""+subject_credits.get(i)+"\" value="+a.get(i).get(2)+"> "+ a.get(i).get(2) +" </td>"
	    	  		+ " <td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"> <button onclick=\"deleteCreditPoint('" + a.get(i).get(0) + "', '" + ((Faculty)user).getDepartment() + "')\" style=\"color: red; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 7px;\" name = \""+no_subject.get(i)+"\" id = \""+no_subject.get(i)+"\" > Delete </button>");
	      }
	      out.println("</table>");
		
	}

}
