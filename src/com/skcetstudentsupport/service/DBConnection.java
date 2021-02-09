package com.skcetstudentsupport.service;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection con = null;
	
	public static Connection getConnection() {
		
		try {
			if (con != null && !con.isClosed()) 
				return con;

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/skcet_student_support",		// mysql url
					"root",		// mysql username
					"123"		// mysql password
				);
		} catch (Exception e) {  
			e.printStackTrace();
		}
		return con;	
	}
}