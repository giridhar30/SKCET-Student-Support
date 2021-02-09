package com.skcetstudentsupport.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CgpaDao {
private static final String getcredit = "select subject_code , subject , credits from credit_points where sem_no=? and department=?";
private static final String getcgpa="select * from cgpa_scores where register_no = ?";
private static final String gettotalcgpa="select sem1,sem2,sem3,sem4,sem5,sem6,sem7,sem8 from cgpa_scores where register_no = ?  ";
private static final String fetchTotalCGPA = "select cgpa from cgpa_scores where register_no = ?";

	
	public ArrayList<ArrayList<String>> getCredits(String semester, String department)
	{
		Connection con=DBConnection.getConnection();
		ArrayList<ArrayList<String>> ans=new ArrayList<ArrayList<String>>();
		try
		{
			PreparedStatement ps=con.prepareStatement(getcredit);			
			ps.setInt(1, Integer.parseInt(semester));
			ps.setString(2, department);
			ResultSet res=ps.executeQuery();
			
			while(res.next())
			{
				ArrayList<String> temp=new ArrayList<String>();
				temp.add(res.getString("subject_code"));
				temp.add(res.getString("subject"));
				temp.add(res.getString("credits"));
				ans.add(temp);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public ArrayList<Double> getCgpa(String registerNo)
	{
		Connection con=DBConnection.getConnection();
		ArrayList<Double> ans=new ArrayList<Double>();
		
		try
		{
			PreparedStatement pstmt = con.prepareStatement(getcgpa);
			pstmt.setString(1, registerNo);
			ResultSet res=pstmt.executeQuery();
			int i=1;
			res.next();
			while(i<=8)
			{
				String a="sem"+i;
				if(res.getDouble(a)!=0)
					ans.add(res.getDouble(a));
				else
					ans.add(0.0);
				i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public void storeCgpa(double cgpa,int semester,String register_no)
	{   try
	   {
		Connection con=DBConnection.getConnection();
		Statement st=con.createStatement();
		ResultSet res = st.executeQuery("select 1 from cgpa_scores where register_no='" + register_no+"'");
		if (!res.next()) {
			st.executeUpdate("insert into cgpa_scores (register_no,sem1,sem2,sem3,sem4,sem5,sem6,sem7,sem8,cgpa) values ('"+ register_no + "',0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)");
		}
		String query="Update cgpa_scores set sem"+semester+" = "+cgpa+" where register_no='"+register_no+"'";
		st.executeUpdate(query);
		ArrayList<Double> sgpa=getCgpa(register_no);
		double sum=0.0;
		int count=0;
		for(int i=0;i<sgpa.size();i++)
		{ 
			sum+=sgpa.get(i);
			if(sgpa.get(i)!=0.0)
				count++;
		}
		sum/=count;
		query="Update cgpa_scores set cgpa = "+sum+" where register_no='"+register_no+"'";
		st.executeUpdate(query);
	  }
	catch(Exception e)
	   {
		e.printStackTrace();
    	}
	
	}

	public ArrayList<Double> getTotalCgpa(String from,String to)
	{
		Connection con=DBConnection.getConnection();
		ArrayList<Double> ans=new ArrayList<Double>();
		for(int i=0;i<8;i++)
		{
			ans.add(0.0);
		}
		try
		{
			String a=from.substring(0,6);//18euit
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
				
				PreparedStatement pstmt = con.prepareStatement(gettotalcgpa);
				pstmt.setString(1, registerNo);
				ResultSet res=pstmt.executeQuery();
				int j=1;
				if(res.next())
				{
					while(j<=8)
					{
						String columnName="sem"+j;
						if(res.getDouble(columnName)!=0.0)
						{
							double temp=ans.get(j-1);
							ans.set(j-1,res.getDouble(columnName)+temp);
						}
						j++;
					}
				}
			}
			int n=toRollNo-fromRollNo+1;
			for(int i=0;i<8;i++)
			{
				double temp=ans.get(i)/n;
				ans.set(i,temp);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public double fetchTotalCgpa (String registerNo) {
		
		double cgpa = 0.0;
		Connection con = DBConnection.getConnection();
		try {
			
			PreparedStatement pstmt = con.prepareStatement(fetchTotalCGPA);
			pstmt.setString(1, registerNo);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cgpa = rs.getDouble("cgpa");
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cgpa;
		
	}

}
