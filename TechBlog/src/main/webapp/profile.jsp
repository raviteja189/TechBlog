<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tech.blog.entities.*,com.tech.blog.helper.*,com.tech.blog.dao.*,java.util.ArrayList;" %>
    
    
    
    
    <%
    
      User user=(User)session.getAttribute("userdetails");
      if(user==null)
      {
    	  response.sendRedirect("login.jsp");
      }
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/NewFile.css" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark text-black">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>TechLearn </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Learn the New-Way <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
          categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Languages</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structures</a>
        </div>
      </li>
     <li class="nav-item">
        <a class="nav-link" href="#">contact</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">DoPost</a>
      </li>
      
    </ul>
		<ul class="navbar-nav mr-right">
			<li class="nav-item"><a class="nav-link" href="#!"
				data-toggle="modal" data-target="#profile-modal"> <span
					class="fa fa-user-circle "></span> <%= user.getName()%>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="logout.jsp">
					Logout
			</a></li>
		</ul>
	</div>
</nav>

<%
						Message m = (Message) session.getAttribute("msg");
						if (m != null) {
					%>
					<div class="alert <%=m.getCssclass() %>" role="alert">
						<%=m.getContent()%>
					</div>


					<%
						session.removeAttribute("msg");
						}
					%>
<!--end of nav  -->

<!-- start of main body -->
	<main>
	<div class="container fixed">
		<div class="row mt-4">

			<div class="col-md-4">
			<!-- categories -->
				<ul class="list-group">
					<a  href="#" onClick="getPosts(0,this)" class="list-group-item list-group-item-action   c-link ">All Posts</a>
					<%
					
					  PostDao p1=new PostDao(ConnectionProvider.getConnection());
					   ArrayList<Categories> list1=p1.getAllCategories();
					   for(Categories c:list1)
					   {
					%>
					<a  href="#" onClick="getPosts(<%=c.getCid() %>,this)" class="list-group-item list-group-item-action   c-link"><%=c.getName() %></a>
					<%
					   }
					
					%>
				</ul>

			</div>

			<div class="col-md-8" id="post-container">
			     <div class="container text-center" id="loader">
			         <span class="fa fa-refresh fa-4x fa-spin"></span>
			          <h3 class="mt-2">Loading...</h3>
			         
			     </div>
			     <div class="container-fluid">
			     </div>
			
			</div>
		</div>

	</div>

	</main>

	<!--end of main body  -->



<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content ">
      <div class="modal-header bg-dark text-white ">
        <h5 class="modal-title" id="exampleModalLabel">TechLearn</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <h3><%= user.getName() %></h3> 
        <!--table  -->
        
        <div id="profile-details">
        <table class="table">
  
  
  <tbody>
    <tr>
      <th scope="row">ID:</th>
      <td><%= user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender:</th>
      <td><%= user.getGender() %></td>
      
    </tr>
    <tr>
      <th scope="row">Email:</th>
      <td><%= user.getEmail() %></td>
      
    </tr>
  </tbody>
</table>
</div>

<!--profile edit in same modal -->
<div id="profile-edit" style="display :none">

						<h3 class="mt-2">Please Edit Carefully</h3>
						<form action="EditServlet" method="post">
							<table class="table">
								<tr>
									<td>ID :</td>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<td>Email :</td>
									<td><input type="email" class="form-control"
										name="user_email" required value="<%=user.getEmail()%>"></td>
								</tr>
								<tr>
									<td>Name :</td>
									<td><input type="text" class="form-control"
										name="user_name" required value="<%=user.getName()%>"></td>
								</tr>
								<tr>
									<td>Password :</td>
									<td><input type="password" class="form-control"
										name="user_password" required value="<%=user.getPassword()%>">
									</td>
								</tr>
								<tr>
									<td>Gender :</td>
									<td><%=user.getGender().toUpperCase()%></td>
								</tr>
								 </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>   
					</div>



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

<!--end of user modal  -->




<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <!-- form  -->
       <form id="add-post" action="AddPostServlet" method="post">
           <div class="form-group">
              <select class="form-control" name="cid">
                <option selected disabled>---select category---</option>
                <%
                 PostDao p=new PostDao(ConnectionProvider.getConnection());
                
                ArrayList<Categories> list=p.getAllCategories();
                for(Categories c:list)
                {
                	
                
                %>
                <option value="<%= c.getCid()%>"><%=c.getName() %></option>
               
                <%
                }
                %>
              </select>
           </div>
           <div class="form-group">
              <input name="posttitle"type="text" placeholder="Enter post title" class="form-control">
           </div>
           <div class="form-group">
              <textarea name="postcontent" placeholder="Enter post content" class="form-control" rows="9" cols="10"></textarea> 
           </div>
           <div class="form-group">
              <textarea name="postprogram" placeholder="Enter program (if any)" class="form-control" rows="9" cols="10"></textarea> 
           </div>
          <div class="container">
          <button type="submit" class="btn btn-primary text-center">Post</button>
          
         </div> 
              </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
 
 <script>
     $(document).ready(function()
    		 {
    	     let status=false;
    	        $("#edit-profile-button").click(function()
    	        		{
    	        	if(status==false)
    	        		{
    	        		$("#profile-details").hide()
        	        	$("#profile-edit").show()
        	        	status=true;
    	        		$(this).text("Back");
    	        		}
    	        	else
    	        		{
    	        		$("#profile-details").show()
        	        	$("#profile-edit").hide()
        	        	status=false;
    	        		$(this).text("Edit");
    	        		}
    	        	
    	        		})
    		 });
 
 
 </script>
 
 <!--loading posts using ajax  -->
<script>
 
 function getPosts(catId,temp)
 {
	   $("#loader").show();
	   $("#post-container").hide()
	   $(".c-link").removeClass('bg-dark text-white')
	 $.ajax({
		  url:"loadpost.jsp",
		  data:{cid:catId},
	      success: function(data,textStatus,jqXHR){
	    	  
	    	   console.log("post loading");
	    	   $("#loader").hide();
	    	   $("#post-container").show();
	    	   
	    	   $("#post-container").html(data)
	    	   $(temp).addClass('bg-dark  text-white');
	      }
	  })
 }
  $(document).ready(function(e){
	  let allPostRef=$(".c-link")[0]
	  getPosts(0,allPostRef)
	  
  });
 </script>
 
 
</body>
</html>