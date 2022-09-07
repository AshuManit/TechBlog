<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOGIN</title> 


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.banner-background{
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 67% 96%, 29% 94%, 0 100%, 0 0);
	}
</style>
</head>
<body>

<%@include file="normal_navbar.jsp" %>

<main class="d-flex align-items-center primary-background banner-background " style="height:70vh">
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-circle fa-3x"></span>
						<h3>Login here</h3>
					</div>
					
					<%
					Message m=(Message)session.getAttribute("msg");
					if(m!=null){
					%>
					<div class="alert <%=m.getCssClass() %>" role="alert">
  					<%= m.getContent() %>
					</div>
					<%
					session.removeAttribute("msg");
					} 
					%>
					<div class="card-body">
						<form action="LoginServlet" method="POST">
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
						    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						  <div class="input-group mb-4">
						   <label for="exampleInputPassword1">Password</label>
        					 <div class="input-group">
	        					 <input name="password" class="password" type="password"  />
								 <button  class="btn btn-secondary psd-btn form-control"  type="button"><span class="fa fa-low-vision"></span></button>
					     	 </div>
					      </div>
						  <div class="text-center ">
						 	 <button type="submit" class="btn primary-background text-white">Submit</button>
						  </div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</main>

<!-- JAVA SCRIPT -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myJS.js" type="text/javascript"></script>
<script >

$(".psd-btn").hover(function(){
	$(".password").attr('type','text')
},function(){
	$(".password").attr('type','password')
});
</script>
</body>
</html>