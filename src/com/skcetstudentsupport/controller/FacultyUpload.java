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

import com.skcetstudentsupport.model.Faculty;
import com.skcetstudentsupport.service.FacultyDao;


@WebServlet("/FacultyUpload")
@MultipartConfig
public class FacultyUpload extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Part filePart = request.getPart("faculty-file"); 
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
	    	String facultyId=temp[j++];
	    	String name=temp[j++];
	    	String email=temp[j++];
	    	String phone=temp[j];
	    	if (valid(facultyId, name, email, phone)) {
	    		Faculty model=new Faculty(facultyId, name, email, phone);
		    	new FacultyDao().save(model);
	    	}
	    }
	    
    	response.sendRedirect("admin-dashboard.jsp");
		
	}

	private boolean valid(String facultyId, String name, String email, String phone) {
		
		return Pattern.matches("^[\\d]{2}[a-zA-Z]{2}[\\d]{4}$", facultyId)
				&& Pattern.matches("^[a-zA-Z\\.]*$", name)
				&& Pattern.matches("^[6789]{1}[\\d]{9}$", phone)
				&& email.endsWith("@skcet.ac.in");
	
	}

}
