package com.tech.blog.dao;
import java.sql.*;
import com.tech.blog.entities.*;
public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		
		this.con = con;
	}
	
	public boolean saveUser(User user)
	{
		boolean z=false;
		try
		{
			
			String query="insert into user(username,email,password,gender) values(?,?,?,?)";
			PreparedStatement ptmt=this.con.prepareStatement(query);
			ptmt.setString(1, user.getName());
			ptmt.setString(2, user.getEmail());
			ptmt.setString(3,user.getPassword());
			ptmt.setString(4, user.getGender());
			
			ptmt.executeUpdate();
			z=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return z;
	}
	//get user with email and password
	public User getUserByEmailAndPassword(String Email,String password)
	{
		User user=null;
		
		try
		{
			String q="select * from user where email=? and password=?";
			PreparedStatement ptmt=this.con.prepareStatement(q);
			ptmt.setString(1, Email);
			ptmt.setString(2, password);
			ResultSet rs=ptmt.executeQuery();
			
			if(rs.next())
			{
				user=new User();
				String name=rs.getString("username");
				user.setName(name);
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setPassword(rs.getString("password"));
				user.setId(rs.getInt("id"));
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean updateUser(User user)
	{
		boolean f=false;
		try
		{
		String update="update user set username=?,email=?,password=?,gender=? where id=?";
		PreparedStatement ps=this.con.prepareStatement(update);
		ps.setString(1, user.getName());
		ps.setString(2,user.getEmail());
		ps.setString(3,user.getPassword());
		ps.setString(4,user.getGender());
		ps.setInt(5, user.getId());
		ps.executeUpdate();
		 f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	
	public User getUserByUserId(int uid)
	{
		User user=null;
		
		try{
			String username="select * from user where id=?";
			PreparedStatement ps=this.con.prepareStatement(username);
			ps.setInt(1, uid);
			ResultSet rs=ps.executeQuery();
			user=new User();
			while(rs.next())
			{
				String name=rs.getString("username");
				user.setName(name);
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setPassword(rs.getString("password"));
				user.setId(rs.getInt("id"));
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
	}
	
}
