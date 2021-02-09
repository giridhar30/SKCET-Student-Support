package com.skcetstudentsupport.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.skcetstudentsupport.model.Student;

public class StudentDao {
	
	private static final String insertQuery = "insert into students(register_no, name, department, section, email, phone, password) values(?, ?, ?, ?, ?, ?, ?)";
	private static final String updateQuery = "update students set password = ? where register_no = ?";
	private static final String checkQuery = "select * from students where register_no = ? and password = ?";
	private static final String deleteQuery = "delete from students where register_no = ?";
	private static final String fetchQuery = "select * from students where register_no = ?";
	private Connection con;
	
	public StudentDao() {
		con = DBConnection.getConnection();
	}
	
	public void save(Student student) {
		
		try {
			PreparedStatement ps = con.prepareStatement(insertQuery);
			ps.setString(1, student.getRegisterNo());
			ps.setString(2, student.getName());
			ps.setString(3, student.getDepartment());
			ps.setString(4, student.getSection()+"");
			ps.setString(5, student.getEmail());
			ps.setString(6, student.getPhone());
			ps.setString(7, student.getPassword());
			ps.executeUpdate();
			con.createStatement().executeUpdate("insert into cgpa_scores (register_no,sem1,sem2,sem3,sem4,sem5,sem6,sem7,sem8,cgpa) values ('"+ student.getRegisterNo() + "',0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void updatePassword(String registerNo, String password) {
		
		try {
			PreparedStatement ps = con.prepareStatement(updateQuery);
			ps.setString(1, password);
			ps.setString(2, registerNo.toLowerCase());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Student fetchUser(String registerNo, String password) {
		
		ResultSet rs = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(checkQuery);
			ps.setString(1, registerNo.toLowerCase());
			ps.setString(2, password);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				char section = rs.getString("section").charAt(0);
				Student student = new Student(registerNo, name, section, phone, true);
				return student;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return null;
		
	}
	
	public Student fetchUser(String registerNo) {
		
		ResultSet rs = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(fetchQuery);
			ps.setString(1, registerNo.toLowerCase());
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				char section = rs.getString("section").charAt(0);
				Student student = new Student(registerNo, name, section, phone, true);
				return student;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return null;
		
	}
	
	public void delete(String registerNo) {
		
		try {
			
			PreparedStatement ps = con.prepareStatement(deleteQuery);
			ps.setString(1, registerNo);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
