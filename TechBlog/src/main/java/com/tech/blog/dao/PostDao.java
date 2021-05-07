package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.User;
public class PostDao {

	private Connection con;

	public PostDao(Connection con) {
		
		this.con = con;
	}
	
	public ArrayList<Categories> getAllCategories()
	{
		ArrayList<Categories> list=new ArrayList<Categories>();
		
		try
		{
			String q="select * from categories";
			
		     Statement ps=this.con.createStatement();
			ResultSet rs=ps.executeQuery(q);
			while(rs.next())
			{
				int cid=rs.getInt("cid");
				String name=rs.getString("name");
				String description=rs.getString("description");
				Categories c=new Categories(cid,name,description);
				list.add(c);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	//inserting post data into posts table
	public boolean savePost(Posts posts)
	{
		boolean f=false;
		
		try{
			
			String s="insert into posts(ptitle,pcontent,pcode,cid,userid) values(?,?,?,?,?)";
			PreparedStatement ps=this.con.prepareStatement(s);
			ps.setString(1, posts.getPtitle());
			ps.setString(2, posts.getPcontent());
			ps.setString(3, posts.getPcode());
			ps.setInt(4, posts.getCid());
			ps.setInt(5, posts.getUserid());
			
			ps.executeUpdate();
			
			f=true;
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	public List<Posts> getAllPosts()
	{
	    List<Posts> list=new ArrayList<Posts>();
	    try
	    {
	    	String s="select * from posts order by pid desc";
	    	PreparedStatement ps=this.con.prepareStatement(s);
	    	ResultSet rs=ps.executeQuery();
	    	
	    	while(rs.next())
	    	{
	    		int pid=rs.getInt("pid");
	    		String ptitle=rs.getString("ptitle");
	    		String pcontent=rs.getString("pcontent");
	    		String pcode=rs.getString("pcode");
	    		Timestamp pdate=rs.getTimestamp("pdate");
	    		int catId=rs.getInt("cid");
	    		int userid=rs.getInt("userid");
	    		Posts post=new Posts(pid,ptitle,pcontent,pcode,pdate,catId,userid);
	    		list.add(post);
	    		
	    	}
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	    return list;
	}
	public List<Posts> getPostsByCatId(int cid)
	{
	    List<Posts> list=new ArrayList<Posts>();
	    try
	    {
	    	String s="select * from posts where cid=?";
	    	PreparedStatement ps=this.con.prepareStatement(s);
	    	ps.setInt(1, cid);
	    	ResultSet rs=ps.executeQuery();
	    	
	    	while(rs.next())
	    	{
	    		int pid=rs.getInt("pid");
	    		String ptitle=rs.getString("ptitle");
	    		String pcontent=rs.getString("pcontent");
	    		String pcode=rs.getString("pcode");
	    		Timestamp pdate=rs.getTimestamp("pdate");
	    		
	    		int userid=rs.getInt("userid");
	    		Posts post=new Posts(pid,ptitle,pcontent,pcode,pdate,cid,userid);
	    		list.add(post);
	    		
	    	}
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	    
	    return list;
	}
	
	
	public Posts getPostById(int pId)
	{
		Posts post=null;
		try
		{
		String s="select * from posts where pid=?";
		PreparedStatement ps=this.con.prepareStatement(s);
		ps.setInt(1, pId);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			
	    		int pid=rs.getInt("pid");
	    		String ptitle=rs.getString("ptitle");
	    		String pcontent=rs.getString("pcontent");
	    		String pcode=rs.getString("pcode");
	    		Timestamp pdate=rs.getTimestamp("pdate");
	    		int cid=rs.getInt("cid");
	    		int userid=rs.getInt("userid");
	    		post=new Posts(pid,ptitle,pcontent,pcode,pdate,cid,userid);
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return post;
	}
	
	
	
}
