package com.skcetstudentsupport.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skcetstudentsupport.model.Faculty;
import com.skcetstudentsupport.model.Student;
import com.skcetstudentsupport.service.AchievementDao;
import com.skcetstudentsupport.service.CgpaDao;
import com.skcetstudentsupport.service.StudentDao;


@WebServlet("/GetReport")
public class GetReport extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String from = request.getParameter("from").trim();
		String to = request.getParameter("to").trim();
		String prefix = from.substring(0, 6);
		int f = Integer.parseInt(from.substring(6, from.length()));
		int t = Integer.parseInt(to.substring(6, to.length()));
		
		String dept = to.substring(4, 6);
		
		Object user = request.getSession().getAttribute("user");
		if (user instanceof Faculty && to.substring(0, 4).equals(from.substring(0, 4))) {
			if (!((Faculty)user).getDepartment().equalsIgnoreCase(dept)) {
				response.sendRedirect("faculty-dashboard.jsp?err=diff_dept");
			}
		} else response.sendRedirect("faculty-dashboard.jsp?err=wrong_cred");
		
		
		StudentDao studentDao = new StudentDao();
		ArrayList<Student> students = new ArrayList<Student>();
		
		for (int i = f; i <= t; i++) {
			
			String registerNo = "";
			if (i < 10) {
				registerNo = prefix + "00" + i;
			} else if (i < 100) {
				registerNo = prefix + "0" + i;
			} else {
				registerNo = prefix + i;
			}
			
			Student s = studentDao.fetchUser(registerNo);
			if (s != null) students.add(s);
			
		}
		
		StringBuilder sb = new StringBuilder();
		String fileName = from + "_to_" + to;
		
		if (request.getParameter("student") != null) {
			
			int i = 1;
			sb.append("SNo,Register No,Name,Phone,Email" + "\n");
			for (Student s: students) {
				sb.append(i++ + "," + s.getRegisterNo() + "," + s.getName() + "," + s.getPhone() + "," + s.getEmail() + "\n");
			}
			
			fileName = fileName + "_student_report.csv";
			
		} else if (request.getParameter("achievement") != null) {
			
			int i = 1;
			sb.append("SNo,Register No,Name,Achievement,Organization,Date,Award\n");
			AchievementDao achievementDao = new AchievementDao();
			for (Student s: students) {
				ArrayList<ArrayList<String>> data = achievementDao.getData(s.getRegisterNo());
				for (ArrayList<String> datum: data) {
					sb.append(i++ + "," + s.getRegisterNo() + "," + s.getName() + "," + datum.get(1) + "," + datum.get(2) + "," + datum.get(3) + "," + datum.get(4) + "\n");
				}
			}
			
			fileName = fileName + "_achievement_report.csv";
			
		} else if (request.getParameter("cgpa") != null) {
			
			int i = 1;
			sb.append("SNo,Register No,Name,CGPA\n");
			CgpaDao cgpaDao = new CgpaDao();
			for (Student s: students) {
				sb.append(i++ + "," + s.getRegisterNo() + "," + s.getName() + "," + cgpaDao.fetchTotalCgpa(s.getRegisterNo()) + "\n");
			}
			
			fileName = fileName + "_cgpa_report.csv";
			
		}
		
		response.setContentType("text/csv");
		response.setHeader("Content-disposition", "attachment; " + "filename=" + fileName);
		response.getOutputStream().print(new String(sb));
		response.getOutputStream().flush();
		response.getOutputStream().close();

	
	}

}
