package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
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
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		
		User user=dao.getUserByEmailAndPassword(email, password);
		

		HttpSession session=request.getSession();
		if(user==null)
		{
//			PrintWriter out=response.getWriter();
//			out.println("details are wrong");
			Message msg=new Message("invalid details !try with another","error", "alert-danger");
			session.setAttribute("msg",msg);
			response.sendRedirect("login.jsp");
		}
		else
		{
			session.setAttribute("userdetails", user);
			response.sendRedirect("profile.jsp");
			
		}
		
	}

}
