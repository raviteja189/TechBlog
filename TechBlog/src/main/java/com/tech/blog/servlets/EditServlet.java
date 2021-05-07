package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("user_name");
		String email=request.getParameter("user_email");
		String password=request.getParameter("user_password");
		
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("userdetails");
		
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		
		boolean result=dao.updateUser(user);
		PrintWriter out=response.getWriter();
		if(result==true)
		{
			
			
			Message msg=new Message("Your profile is updated!","success", "alert-success");
			session.setAttribute("msg",msg);
			response.sendRedirect("profile.jsp");
		}
		else
		{
			Message msg=new Message("something went wrong try again!","failed", "alert-danger");
			session.setAttribute("msg",msg);
			response.sendRedirect("profile.jsp");
		}
		
	}

}
