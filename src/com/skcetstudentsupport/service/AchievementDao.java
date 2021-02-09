package com.skcetstudentsupport.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.skcetstudentsupport.model.Achievement;


public class AchievementDao {

	private static final String insertQuery = "insert into achievements(register_no, type , hosted_by, date , award_type, description ,certificate_link) values( ?, ?, ?, ?, ?, ?,?)";
	private static final String updateQuery = "update achievements set type = ? , hosted_by = ? , date = ? , award_type = ? , description = ? ,certificate_link = ? where id = ? " ; 
	private static final String deleteQuery = "delete from achievements where id = ? ";
	private static final String getQuery = "select * from achievements where register_no = ? ";
	private static final String getAchievement = "select count(*) as total from achievements where type = ? and register_no = ? "; 
	
	public void save(Achievement achievement)
	{
		Connection con = DBConnection.getConnection();
		try 
		{
			PreparedStatement ps = con.prepareStatement(insertQuery);
			ps.setString(1, achievement.getRegisterNo());
			ps.setString(2, achievement.getTypeOfAchievement());
			ps.setString(3, achievement.getHosted());
			ps.setDate(4,achievement.getDate());
			ps.setString(5, achievement.getAwards());
			ps.setString(6, achievement.getDescription());
			ps.setString(7, achievement.getCertificate());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void update(Achievement achievement,int id)
	{
		Connection con = DBConnection.getConnection();
		try 
		{
			PreparedStatement ps = con.prepareStatement(updateQuery);
			ps.setString(1, achievement.getTypeOfAchievement());
			ps.setString(2, achievement.getHosted());
			ps.setDate(3,achievement.getDate());
			ps.setString(4, achievement.getAwards());
			ps.setString(5, achievement.getDescription());
			ps.setString(6, achievement.getCertificate());
			ps.setInt(7,id);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void delete(int id)
	{
		Connection con = DBConnection.getConnection();
		try 
		{
			PreparedStatement ps = con.prepareStatement(deleteQuery);
			ps.setInt(1,id);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public ArrayList<ArrayList<String>> getData(String registerNo)
	{
		Connection con = DBConnection.getConnection();
		ArrayList<ArrayList<String>> ans=new ArrayList<ArrayList<String>>();
		try 
		{
			PreparedStatement ps = con.prepareStatement(getQuery);
			ps.setString(1, registerNo);
			ResultSet res=ps.executeQuery();
			while(res.next())
			{
				ArrayList<String> temp=new ArrayList<String>();
				temp.add(String.valueOf(res.getInt("id")));
				temp.add(res.getString("type"));
				temp.add(res.getString("hosted_by"));
				temp.add(String.valueOf(res.getDate("date")).trim());
				temp.add(res.getString("award_type"));
				temp.add(res.getString("description"));
				temp.add(res.getString("certificate_link"));
				ans.add(temp);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();			
		}
		return ans;
	}	
	public ArrayList<Integer> getAchievement(String from,String to)
	{
		Connection con=DBConnection.getConnection();
		ArrayList<Integer> ans=new ArrayList<Integer>();
		for(int i=0;i<7;i++)
		{
			ans.add(0);
		}
		ArrayList<String> type=new ArrayList<String>();
		type.add("Workshop");type.add("Paper Presentation");type.add("Hackathon");type.add("Internship");
		type.add("Culturals");type.add("Sports");
		try
		{
			for(int j=0;j<type.size();j++)
			{
				PreparedStatement pstmt = con.prepareStatement(getAchievement);
				pstmt.setString(1, type.get(j));
				String a=from.substring(0,6);
				int fromRollNo=Integer.parseInt(from.substring(6,from.length()));
				int toRollNo=Integer.parseInt(to.substring(6,to.length()));
				for(int i=fromRollNo;i<=toRollNo;i++)
				{
					String registerNo = "";
					if (i < 10) {
						registerNo=a+"00"+i;
					} else if (i < 100) {
						registerNo=a+"0"+i;
					} else registerNo=a+i;
					
					pstmt.setString(2 , registerNo );
					ResultSet res=pstmt.executeQuery();
					if(res.next())
					{
						int temp=ans.get(j);
						ans.set(j, temp+res.getInt("total"));
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
}