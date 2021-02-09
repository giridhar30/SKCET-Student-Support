package com.skcetstudentsupport.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.skcetstudentsupport.model.Admin;

public class AdminDao {
	
	private static final String checkQuery = "select 1 from admin where email = ? and password = ?";
	private Connection con;
	
	public AdminDao() {
		con = DBConnection.getConnection();
	}
	
	public boolean userExists(Admin admin) {
		ResultSet rs = null;
		boolean exists = false;
		
		try {
			PreparedStatement ps = con.prepareStatement(checkQuery);
			ps.setString(1, admin.getEmail());
			ps.setString(2, admin.getPassword());
			rs = ps.executeQuery();
			exists = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return exists;
	}

}
