<%@ page import="com.tech.blog.entities.*,com.tech.blog.helper.*,com.tech.blog.dao.*,java.util.*;" %>
      
  <div class="row">
   
<%
   
   PostDao post=new PostDao(ConnectionProvider.getConnection());
    int cid=Integer.parseInt(request.getParameter("cid"));
    List<Posts> posts=null;
    if(cid==0)
    {
    	 posts=post.getAllPosts();
    }
    else
    {
    	 posts=post.getPostsByCatId(cid);
    }
    if(posts.size()==0)
    {
    	out.print("Not Posts available");
    }
   for(Posts p : posts)
   {
	   %>
	   <div class="col-md-6 mt-2">
		<div class="card" style="width: 18rem;">
			
			<div class="card-body">
				<h5 class="card-title"><%=p.getPtitle() %></h5>
				<p class="card-text">
				<p><%=p.getPcontent() %></p>
				<pre><%=p.getPcode() %></pre>
				</p>
				
			</div>
			<div class="card-footer bg-dark">
                
                 <a href="show_post_blog.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read More..</a>
                 <%
                LikeDao dao2=new LikeDao(ConnectionProvider.getConnection());
                
                %>
                  <a href="#" onClick="doLike(<%=p.getPid() %>,<%=p.getUserid() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= dao2.countLikes(p.getPid()) %></span></a>
                  
                  
            
            </div>
		</div>

	</div>
	   <%
   }

%>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
 <script>
 
 function doLike(pid, uid)
 {
     console.log(pid + "," + uid)
     var d = {
         uid: uid,
         pid: pid,
         operation: 'like'
     }

     $.ajax({
         url: "LikeServlet.jsp",
         data: d,
         success: function (data, textStatus, jqXHR) {
             console.log(data);
             if(data.trim=='true')
            	 {
            	   var c=$(".like-counter").html()
            	   c++;
            	   $('.like-counter').html(c)
            	 }
             
         }
         
     })
 }
 </script>