package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid=Integer.parseInt(request.getParameter("cid"));
		String posttitle=request.getParameter("posttitle");
		
		String postcontent=request.getParameter("postcontent");
		String postprogram=request.getParameter("postprogram");
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("userdetails");
		int userid=user.getId();
		
		
		
		//send data to entity that is post.java
		
		Posts p=new Posts(posttitle,postcontent,postprogram,null,cid,userid);
		PostDao post=new PostDao(ConnectionProvider.getConnection());
		
		PrintWriter out=response.getWriter();
		if(post.savePost(p)==true)
		{
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'post has been created' ,  'yay !' ,  'success' )");

			out.println("});");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
			rd.include(request, response);
		}
		else
		{
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'something went wrong' ,  'try again !' ,  'error' )");

			out.println("});");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
			rd.include(request, response);
		}
		
	}

}
