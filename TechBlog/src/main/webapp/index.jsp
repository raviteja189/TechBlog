<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

 <%@ page import="com.tech.blog.entities.*,com.tech.blog.helper.*,com.tech.blog.dao.*,java.util.ArrayList;" %>
    


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TechLearn</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/NewFile.css" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
  .banner{
      clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 81%, 62% 100%, 26% 80%, 0 100%, 0 0);
  }
</style>

</head>
<body>
  <%@ include file="normal_navbar.jsp" %>  
	<!-- banner -->

 <div class="container-fluid p-0 m-0 banner">
     <div class="jumbotron">
          <h3>Welcome to TechLearn</h3>
          
          <p>The new way of technology</p>
          
          <a href="signup.jsp" class="btn btn-dark tn-lg"><span class="fa fa-external-link" ></span>Start for Free</a>
          <a href="login.jsp"class="btn btn-dark tn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
     </div>
 </div>
 <!-- //cards
  -->
  
  <div class="container">
        <div class="row mb-4 mt-0">
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Java is a general-purpose, class-based, object-oriented programming language designed for having lesser implementation dependencies.</p>
						<a href="#" class="btn btn-primary">Read</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Python Programming</h5>
						<p class="card-text">Python is an interpreted, object-oriented, high-level programming language with dynamic semantics</p>
						<a href="#" class="btn btn-primary">Read</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">C Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read</a>
					</div>
				</div>
			</div>

		</div>
		
		<div class="row">
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">C++ Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Web Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Many more....</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read</a>
					</div>
				</div>
			</div>

		</div>
    
 </div>
 
 
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 


</body>
</html>



