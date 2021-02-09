package com.skcetstudentsupport.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.skcetstudentsupport.model.CreditPoint;

public class CreditPointDao {
	
	private static final String saveQuery = "insert into credit_points (sem_no, subject_code, subject, credits, department) values (?, ?, ?, ?, ?)";
	private static final String checkQuery = "select 1 from credit_points where department = ? and subject_code = ?";
	private static final String deleteQuery = "delete from credit_points where subject_code = ? and department = ?";
	private Connection con;
	
	public CreditPointDao() {
		con = DBConnection.getConnection();
	}
	
	public void saveCreditPoint(CreditPoint creditPoint) {
		
		if (creditPointNotUnique(creditPoint)) return;
		
		try {
			PreparedStatement ps = con.prepareStatement(saveQuery);
			int i = 1;
			ps.setInt(i++, creditPoint.getSemNo());
			ps.setString(i++, creditPoint.getSubjectCode());
			ps.setString(i++, creditPoint.getSubject());
			ps.setFloat(i++, creditPoint.getCredits());
			ps.setString(i++, creditPoint.getDepartment());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	private boolean creditPointNotUnique(CreditPoint creditPoint) {

		boolean exists = false;
		try {
			PreparedStatement ps = con.prepareStatement(checkQuery);
			ps.setString(1, creditPoint.getDepartment());
			ps.setString(2, creditPoint.getSubjectCode());
			exists = ps.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return exists;
	
	}
	
	public void delete(String subjectCode, String department) {
		
		try {
			
			PreparedStatement ps = con.prepareStatement(deleteQuery);
			ps.setString(1, subjectCode);
			ps.setString(2, department);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
