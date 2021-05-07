<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.tech.blog.entities.*,com.tech.blog.helper.*,com.tech.blog.dao.*,java.util.ArrayList,java.io.*;" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
        <% 
        
        String operation=request.getParameter("operation");
		int uid=Integer.parseInt(request.getParameter("uid"));
		int pid=Integer.parseInt(request.getParameter("pid"));
		
		LikeDao dao=new LikeDao(ConnectionProvider.getConnection());
		if(operation.equals("like"))
		{
			boolean f=dao.insertLike(pid, uid);
			
			out.print(f);
		}
        %>
        
</body>
</html>