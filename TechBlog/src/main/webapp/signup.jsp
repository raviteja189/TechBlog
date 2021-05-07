<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SignUp</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/NewFile.css" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner {
	clip-path: polygon(100% 0%, 89% 53%, 80% 100%, 0 100%, 13% 48%, 25% 0%);
}
</style>
</head>
<body>



<%@include file="normal_navbar.jsp" %>

<!--form  -->
   <main class="d-flex align-items-center  bg-dark banner" style="height:70vh">
       <div class="container ">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                
                        <div class="card">
                        
                            <div class="card-header bg-dark text-white">
                            <span class="fa fa-user-circle fa-2x"></span>
                           Register Here
                            </div>
                            <div class="card-body">
						<form  action="RegisterServlet" method="post">
						     <div class="form-group">
								<label for="exampleInputEmail1">UserName</label> <input
									name="username" type="text" class="form-control" id="username"
									aria-describedby="emailHelp" placeholder="Enter userName">
								
							</div>
							
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email"type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							
							
							<div class="form-group">
								<label for="gender">Gender</label> 
								<br>
								<input type="radio"  id="gender" name="gender" value="male">Male
								<input type="radio"  id="gender" name="gender" value="female">Female
									
							</div>
							
							
							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree to terms and conditions</label>
							</div>
							
							
							<button  type="submit" class="btn btn-primary">Register</button>
						</form>
					</div>
                        </div>
                </div>
            </div>
       </div>
   
   </main>










	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>





</body>
</html>