<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page  import="java.sql.*" %>
<%@ page  import="com.tech.blog.helper.*" %>
<%@ page import="com.tech.blog.dao.*" %>
<%@ page import="com.tech.blog.entities.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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

<!-- NAVBAR -->
<%@include  file="normal_navbar.jsp"%>

<!-- BANNER -->
<div class="container-fluid p-0 m-0 banner-background">
	<div class="jumbotron primary-background ">
	<div class="container ">
		<h3 class="display-3">WELCOME  To Tech Blog</h3>
		<p>Welcome to technical blog, world of technology</p>
		<p>Looking for tech blogs to keep up with the latest technology trends? No worries! Your search ends here! Read on</p>
		<p>People from different walks of life are intrigued by the way technology is progressing at a profuse rate, shaping our lives into the digital world!</p>
		<p>With new tech trends being introduced every quarter and information becoming obsolete as technology evolves, it's now an obligation to stay relevant and learn about the newest technologies, digital industry, social media, and the web in general!</p>
		
		
		<a href="register.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start ! It's Free</a>
		&nbsp;&nbsp;
		<a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>  Login</a>
		
		
	</div>
	</div>
</div>

<!-- CARDS -->
<div class="container">
<div class="row">
<%
	PostDao dao =new PostDao(ConnectionProvider.getConnection());
	List<Post> plist = dao.getAllPosts();
	int cnt=1;
	for(Post p:plist){
		cnt++;
		if(cnt==6)
			break;
%>
	
		<div class="col-md-4">
			<div class="card" >
			  <div class="card-body">
			    <h5 class="card-title"><%=p.getP_title() %></h5>
			    <p class="card-text"><%=p.getP_content() %></p>
			    <a href="#" class="btn btn-primary primary-background text-white">READ NOW</a>
			  </div>
			</div>
		</div>	
		
<%
	}
%>		
</div>	
</div>



<!-- JAVA SCRIPT -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myJS.js" type="text/javascript"></script>
</body>
</html>