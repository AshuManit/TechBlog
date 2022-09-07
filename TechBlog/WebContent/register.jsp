<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register page</title>
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

<main class="d-flex align-items-center primary-background banner-background " style=" padding-top:50px;padding-bottom:50px;  ">
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-plus fa-3x"></span>
						<h3>Register here</h3>
					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="POST">
						
						  <div class="form-group">
						    <label for="user name">User name</label>
						    <input type="text" class="form-control" id="user_name" placeholder="Enter user name" name="user_name">
						  </div>
						
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="user_email">
						  </div>
						
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="user_password">
						  </div>

						  <div class="form-group">
						    <label for="gender">Select Gender</label>
						    <br>
						    <input type="radio" name="user_gender" value="Male" id="gender">Male
						    <input type="radio" name="user_gender" value="Female" id="gender">Female
						  </div>
						 
						 <div class="form-group">
						 	<textarea class="form-control"  cols="5" placeholder="write something about yourself" name="about"></textarea>
						 </div>
						 
						  <div class="form-check">
						    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
						    <label class="form-check-label" for="exampleCheck1">Agreement & Terms</label>
						  </div>
						  <br>
						  <div class="container text-center" id="loader" style="display:none;">
							  <span class="fa fa-refresh fa-spin fa-4x"></span>
						  	  <h4>Please wait...</h4>
						  </div>
						  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/myJS.js" type="text/javascript"></script>

<script>
$(document).ready(function (){
	console.log("loaded..");
	$('#reg-form').on('submit',function(event){//submit hoga to event fire karega
		/*
		The preventDefault() method cancels the event if it is cancelable, meaning that the default action that belongs to the event will not occur.

		For example, this can be useful when:

		Clicking on a "Submit" button, prevent it from submitting a form
		Clicking on a link, prevent the link from following the URL
		*/
		event.preventDefault();	//servlet me nhi jayega
	
	/*
		If HTML form element is provided, it automatically captures its fields.
		The special thing about FormData is that network methods, such as fetch,
		can accept a FormData object as a body. It’s encoded and sent out with Content-Type: multipart/form-data.*/
		let form =new FormData(this);
		
		$("#submit-btn").hide();
		$("#loader").show();
		
		//send register servlet
		$.ajax({
			url:"RegisterServlet",
			type:'POST',
			data:form,
			success: function (data,textStatus,jqXHR){
				console.log(data)//print response
				$("#submit-btn").show();
				$("#loader").hide();
				//if(data.trim()=== 'done'){

					swal("Register Successfull.. We are going to directing to login page.")
					.then((value) => {
					 	window.location="login_page.jsp"	
					});	
				//}else{
				//	swal(data);
				//}
				
			},
			error: function(jqXHR,textStatus,errorThrown){
				console.log(jqXHR)
				$("#submit-btn").show();
				$("#loader").hide();
				swal("Something went wrong , Please try again");
			},
			processData:false,//kon sa data process kar rhe nhi batana hai
			contentType:false//content type nhi batana hai
		});
	});
});

</script>

</body>
</html>