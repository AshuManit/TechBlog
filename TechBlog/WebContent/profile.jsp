<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.*" %>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.tech.blog.entities.Message" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<%
User u=(User)session.getAttribute("current_user");
if(u==null){
	response.sendRedirect("login_page.jsp");
}

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome user</title>


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
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span style="  font-family: 'Brush Script MT', cursive;"><b> <span class="fa fa-cogs"></span> TechBlog</b></span></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
     
        <a class="nav-link" href="#"><span class="	fa fa-bell-o"></span> BLog <span class="sr-only">(current)</span></a>
      </li>
     
      <!-- <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="fa fa-check-square-o"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">DATA STRUCTURE</a>
        </div>
      </li> -->
	  <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-group"></span> Contact us</a>
      </li>
	  <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#addPost_modal"><span class="fa fa-send-o" ></span> do post</a>
      </li>

    </ul>
    <ul class="navbar-nav mr-right">
    <li class="nav-item">
        <a data-toggle="modal" data-target="#profile-modal" class="nav-link" ><span class="fa fa-user-circle"></span></span> <%=u.getName().toUpperCase() %></a>
      </li>
    <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span></span> Logout</a>
      </li>
    </ul>
  </div>
</nav>
	<!-- End of Navbar -->

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
	<!-- Main Body  -->		
	<main>
		<div class="container">
			<div class="row mt-4">
			<!-- First Column -->
				<div class="col-md-4">
				<!-- categories -->
					<div class="list-group">
					  <a href="#" onclick="getPost(0,this)" class="c-link list-group-item list-group-item-action active">
					  All Posts
					  </a>
					  <%
					  	PostDao dao=new PostDao(ConnectionProvider.getConnection());
					  	ArrayList<Categories> list2=dao.getAllCategories();
					  	for(Categories c:list2 ){
					  %>
					  <a href="#" onclick="getPost(<%=c.getC_id() %>,this)" class="c-link list-group-item list-group-item-action"><%=c.getName() %></a>
					  <%} %>
					</div>
				</div>
			<!--End of First Column -->
			<!--Second Column -->
				<div class="col-md-8 ">
				<!-- Posts -->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-5x fa-spin"></i>
						<h3>Loading...</h3>
					</div>
					<div class="container-fluid" id="post_container">
					
					</div>
				</div>
			
			<!--End of Second Column -->
			</div>
		</div>
	</main>			
	<!-- End of Main Body  -->					
						
					
<!-- Profile Showing Modal -->
		<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header primary-background text-white">
		        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<div class="container text-center">
			      	 <div class="  mb-2">
			      		 <img src="pics/<%= u.getProfile() %>"  height="200px" width="150px" class="img-fluid" style="border-radius:50%;"><br>
			             <h5 class="modal-title" id="exampleModalLabel"><%=u.getName().toUpperCase() %></h5>
			         </div>
		             <div id="profile-detail">
			             <!--  Details  -->
			             <table class="table">
						  <tbody>
						    <tr>
						      <th scope="row">ID</th>
						      <td><%=u.getId() %></td>
						    </tr>
						    <tr>
						      <th scope="row">Email</th>
						      <td><%= u.getEmail() %></td>
						    
						    </tr>
						     <tr>
						      <th scope="row">Gender</th>
						      <td><%= u.getGender() %></td>
						    </tr>
						    <tr>
						      <th scope="row">Status</th>
						      <td><%= u.getAbout() %></td>
						    </tr>
						    <tr>
						      <th scope="row">Register Date</th>
						      <td><%= u.getDateTime() %></td>
						    </tr>
						  </tbody>
						</table>
					</div>
		<!-- Profile Showing Modal -->			
					
					
			<!-- Profile Edit  Modal-->
				<div id="profile-edit" style="display:none;">
						<h3>Please Edit Carefully</h3>
						<form action="EditProfileServlet" method="POST" enctype="multipart/form-data">  <!-- bcz form is getting img file too that why we are specifying multipart/form-data here  -->
							<table class="table">
								<tr>
							      <th scope="row">ID</th>
							      <td><%=u.getId() %></td>
							    </tr>
								<tr>
							      <th scope="row">EMAIL:</th>
							      <td><input type="email"  class="form-control" value="<%=u.getEmail() %>" name=user_email></td>
							    </tr>
								<tr>
							      <th scope="row">NAME:</th>
							      <td><input type="text"  class="form-control" value="<%=u.getName() %>" name=user_name></td>
							    </tr>
								<tr>
							      <th scope="row">PASSWORD:</th>
							      <td>
							     <%--  <div class="input-group">
		        					<input id="password" type="password" id="psd" value="<%=u.getPassword()%>"class="form-control" placeholder="password">
			       						<span class="input-group-btn">
						    			<button class="form-control"  class="btn btn-secondary psd-btn" type="button">
										<span class="fa fa-low-vision"></span>
								        </button>
							        </span>
							      </div> --%>
							       <div class="input-group">
		        					 <div class="input-group">
			        					 <input name="user_password" class="password" type="password"  value="<%=u.getPassword()%>"/>
										 <button  class="btn btn-secondary psd-btn form-control"  type="button"><span class="fa fa-low-vision"></span></button>
							     	 </div>
							      </div>
							      </td>
							    </tr>
							    
								 <tr>
							      <th scope="row">Gender</th>
							      <td><%= u.getGender() %></td>
						  		  </tr>
								<tr>
							      <th scope="row">Status</th>
							      <td><textarea class="form-control" name="user_about" row="5"><%=u.getAbout() %></textarea></td>
							    </tr>
								 <tr>
							      <th scope="row">Register Date</th>
							      <td><%= u.getDateTime() %></td>
							    </tr>
								 <tr>
							      <th scope="row">New Profile</th>
							      <td><input type="file"  name="user_img" class="form-control"></td>
							    </tr>
							    
							</table>
							<div class="container">
							<button type=""submit class="btn primary-background text-white form-control">save</button>
						</div>
						</form>
						
					</div>
		             
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button"  id="edit-button" class="btn btn-primary">EDIT</button>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- End of Modal -->
	
	<!-- Add Post Modal -->
	<!-- Modal -->
	<div class="modal fade" id="addPost_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<form id="addPost" action="AddPostServlet" method="POST" enctype="multipart/form-data">
	      		<div class="form-group">
	      			<select name="category" class="form-control">
	      				 <option selected disabled>----Select Categories-----</option>
	      				<%
	      					PostDao post=new PostDao(ConnectionProvider.getConnection());
	      					ArrayList<Categories> list=post.getAllCategories();
	      					for(Categories c:list){	      					
	      				%>
	      				<option value=<%=c.getC_id() %>><%=c.getName() %></option>
	      				<%} %> 
	      			</select>
	      		</div>
	      		<div class="form-group">
	      			<input type="text" name="pTitle" placeholder="please enter post title " class="form-control">
	      		</div>
	      		<div class="form-group">
	      			<textarea class="form-control" name="pContent" style="height:100px;" placeholder="enter your content"></textarea>
	      		</div>
	      		<div class="form-group">
	      			<textarea class="form-control" name="pCode" style="height:100px;" placeholder="enter your code"></textarea>
	      		<div class="form-group mt-3">
	      			<label> Select your pic</label>
	      			<input type="file" name="pPic" placeholder="please enter pic " class="form-control">
	      		</div>
	      		</div>
	      		<div class="container text-center">
	      			<button type="submit" class=" btn primary-background text-white" > post</button>  
	      		</div>
	      	</form>
	      </div>
	     
	    </div>
	  </div>
	</div>
	<!-- END Add  Post Modal -->
	
<!-- JAVA SCRIPT -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/myJS.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){
		let editStatus=false
		$("#edit-button").click(function(){
			if(editStatus==false){
				$("#profile-detail").hide()
				$("#profile-edit").show()
				editStatus=true
				$(this).text("BACK")
			}else{
				$("#profile-detail").show()
				$("#profile-edit").hide()
				editStatus=false
				$(this).text("EDIT")
			}
			
		});
	});
	
	$(".psd-btn").hover(function(){
		$(".password").attr('type','text')
	},function(){
		$(".password").attr('type','password')
	});
	
</script>



<script>
	
	$(document).ready(function (e){
		$("#addPost").on("submit",function (event){
			//this code called when form is submitted
			event.preventDefault();
			
			//getting all the data of form that we are passing there
			let form=new FormData(this);
			console.log("clicked on post")
			//requesting to server
			$.ajax({
				url:"AddPostServlet",
				type:'POST',
				data:form,
				success: function(data,textStatus,jqXHR){
					console.log(data)
					//if(data.trim()=='done'){
						swal("Good job!", "Saved Successfully", "success");
					//}else{
					//	swal("Error", "Something 1 Went wrong!! try again", "error");
					//}
				},
				error: function(jqXHR,textStatus,errorThrown){
					console.log("not success")
					swal("Error", "Something Went wrong!! try again", "error");

				},
				processData:false,
				contentType:false
			})
		})
	})
</script>

<!-- loading page through ajax -->
<script >
	function getPost(catId,temp){
		$('.c-link').removeClass('active')
		$.ajax({
			url:"load_page.jsp",
			data:{cid:catId},
			
			//data:{c_id:catId},
			success: function(data,textStatus,jqXHR){
				console.log(data)
				$("#loader").hide();
				$("#post_container").html(data);
				$(temp).addClass('active')
			}
		})
	}
	 $(document).ready(function (e){
		let allPost=$('.c-link')[0]
		 getPost(0,allPost)
	}) 
</script>
</body>
</html>