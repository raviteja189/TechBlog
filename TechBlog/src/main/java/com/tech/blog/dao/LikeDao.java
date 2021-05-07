package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {

	private Connection con;
	
	public LikeDao(Connection con) {
		
		this.con = con;
	}

	public boolean insertLike(int pid,int uid)
	{
		boolean f=false;
		try
		{
			 String s="insert into likes(pid,uid) values(?,?)";
			 PreparedStatement ps=con.prepareStatement(s);
			 ps.setInt(1, pid);
			 ps.setInt(2, uid);
			 
			 ps.executeUpdate();
			 f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
		
	}
	
	public int countLikes(int pid)
	{
		int count=0;
		
		String q="select count(*) from likes where pid=?";
		try
		{
			 PreparedStatement ps=con.prepareStatement(q);
			 ps.setInt(1, pid);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 count=rs.getInt("count(*)");
			 }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return count;
	}
	
	
	public boolean likedByUser(int pid,int uid)
	{
		boolean f=false;
		
		try
		{
			 String s="select * from likes where pid=? and uid=?";
			 PreparedStatement ps=con.prepareStatement(s);
			 ps.setInt(1, pid);
			 ps.setInt(2, uid);
			 
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 f=true; 
			 }
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	
	public boolean deleteLike(int pid,int uid)
	{
		boolean f=false;
		try
		{
			 String s="delete from likes where pid=? and uid=?";
			 PreparedStatement ps=con.prepareStatement(s);
			 ps.setInt(1, pid);
			 ps.setInt(2, uid);
			 
			 ps.executeUpdate();
			 f=true;
			 
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
}
