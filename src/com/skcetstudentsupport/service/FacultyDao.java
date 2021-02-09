package com.skcetstudentsupport.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.skcetstudentsupport.model.Faculty;

public class FacultyDao {
	
	private static final String insertQuery = "insert into faculties(faculty_id, name, department, email, phone, password) values(?, ?, ?, ?, ?, ?)";
	private static final String updateQuery = "update faculties set password = ? where faculty_id = ?";
	private static final String checkQuery = "select * from faculties where faculty_id = ? and password = ?";
	private static final String deleteQuery = "delete from faculties where faculty_id = ?";
	private Connection con;
	
	public FacultyDao() {
		con = DBConnection.getConnection();
	}
	
	public void save(Faculty faculty) {
		
		try {
			PreparedStatement ps = con.prepareStatement(insertQuery);
			ps.setString(1, faculty.getFacultyId());
			ps.setString(2, faculty.getName());
			ps.setString(3, faculty.getDepartment());
			ps.setString(4, faculty.getEmail());
			ps.setString(5, faculty.getPhone());
			ps.setString(6, faculty.getPassword());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void updatePassword(String facultyId, String password) {
		
		try {
			PreparedStatement ps = con.prepareStatement(updateQuery);
			ps.setString(1, password);
			ps.setString(2, facultyId.toLowerCase());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Faculty fetchUser(String facultyId, String password) {
		
		ResultSet rs = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(checkQuery);
			ps.setString(1, facultyId.toLowerCase());
			ps.setString(2, password);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				Faculty faculty = new Faculty(facultyId, name, email, phone);
				return faculty;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return null;
	}
	
	public void delete(String facultyId) {
		
		try {
			
			PreparedStatement ps = con.prepareStatement(deleteQuery);
			ps.setString(1, facultyId);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}