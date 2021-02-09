package com.skcetstudentsupport.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.skcetstudentsupport.model.Event;

public class EventDao {
	
	private static final String storeQuery = "insert into events(name, description, date, expiry_date, link, contact, organization) values (?, ?, ?, ?, ?, ?, ?)";
	private static final String fetchQuery = "select events.*, count(event_id) as icount from events left join interests on events.id=interests.event_id where events.expiry_date >= curdate() group by events.id order by icount desc";
	private static final String deleteQuery = "delete from events where id=?";
	private static final String deleteInterestsQuery = "delete from interests where event_id=?";
	
	private Connection con;
	
	public EventDao() {
		
		con = DBConnection.getConnection();
	
	}
	
	public void addEvent(Event event) {
		
		try {
			
			PreparedStatement ps = con.prepareStatement(storeQuery);
			ps.setString(1, event.getName());
			ps.setString(2, event.getDescription());
			ps.setString(3, event.getDate());
			ps.setString(4, event.getExpiryDate());
			ps.setString(5, event.getLink());
			ps.setString(6, event.getContact());
			ps.setString(7, event.getOrganization());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Event> fetchAllEvents() {
		
		ArrayList<Event> events = new ArrayList<Event>();
		
		try {
			
			PreparedStatement ps = con.prepareStatement(fetchQuery);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Event event = new Event(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getString("description"), 
						rs.getString("date"), 
						rs.getString("expiry_date"), 
						rs.getString("link"), 
						rs.getString("contact"), 
						rs.getString("organization")
					);
				events.add(event);						
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return events;
		
	}
	
	public void deleteEvent(int id) {
		
		try {
			
			PreparedStatement ps = con.prepareStatement(deleteQuery);
			ps.setInt(1, id);
			ps.executeUpdate();
			
			ps = con.prepareStatement(deleteInterestsQuery);
			ps.setInt(1, id);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
