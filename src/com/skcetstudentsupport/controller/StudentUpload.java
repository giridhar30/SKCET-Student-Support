package com.skcetstudentsupport.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.skcetstudentsupport.service.StudentDao;
import com.skcetstudentsupport.model.Student;

/**
 * Servlet implementation class StudentUpload
 */
@WebServlet("/StudentUpload")
@MultipartConfig
public class StudentUpload extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Part filePart = request.getPart("student-file"); 
	    InputStream fileContent = filePart.getInputStream();
	   
	    int c = 0;
	    StringBuilder sb = new StringBuilder();
	    while ((c = fileContent.read()) != -1) {
	    	sb.append((char)c);
	    }
	    String a[] = new String(sb).split("\\n");
	    
	    for(int i=0;i<a.length;i++)
	    {
	    	int j = 0;
	    	String temp[] = a[i].split(",");
	    	String registerNo=temp[j++];
	    	String name=temp[j++];
	    	char section=temp[j++].charAt(0);
	    	String phone=temp[j];
	    	if (valid(registerNo,name,phone)) {
	    		Student model=new Student(registerNo, name, section, phone);
		    	new StudentDao().save(model);
	    	}

	    }
	    
    	response.sendRedirect("admin-dashboard.jsp?add=student");
	}

	private boolean valid(String registerNo, String name, String phone) {

		return Pattern.matches("^[\\d]{2}[a-zA-Z]{4}[\\d]{3}$", registerNo)
				&& Pattern.matches("^[a-zA-Z\\.]*$", name)
				&& Pattern.matches("^[6789]{1}[\\d]{9}$", phone);
		
	}
}