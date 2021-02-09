package com.skcetstudentsupport.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class InterestDao {
	
	private static final String checkQuery = "select 1 from interests where register_no=? and event_id=?";
	private static final String createQuery = "insert into interests(register_no, event_id) values (?, ?)";
	private static final String deleteQuery = "delete from interests where register_no=? and event_id=?";
	private static final String getCountQuery = "select count(*) from interests where event_id=?";
	
	private Connection con;
	
	public InterestDao() {
		
		con = DBConnection.getConnection();
		
	}
	
	public boolean checkInterest(String registerNo, int eventId) {
		
		boolean exists = false;
		
		try {
			
			PreparedStatement ps = con.prepareStatement(checkQuery);
			ps.setString(1, registerNo);
			ps.setInt(2, eventId);
			ResultSet rs = ps.executeQuery();
			
			exists = rs.next();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return exists;
		
	}
	
	public boolean updateInterest(String registerNo, int eventId) {
		
		PreparedStatement ps;
		boolean interested = false;
		
		try {
			
			if (checkInterest(registerNo, eventId)) {
				ps = con.prepareStatement(deleteQuery);
			} else {
				ps = con.prepareStatement(createQuery);
				interested = true;
			}
			
			ps.setString(1, registerNo);
			ps.setInt(2, eventId);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return interested;
		
	}
	
	public int getInterestCount(int eventId) {
		
		int count = 0;
		
		try {
			
			PreparedStatement ps = con.prepareStatement(getCountQuery);
			ps.setInt(1, eventId);
			ResultSet rs = ps.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
		
	}

}
