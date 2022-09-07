 package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@WebServlet("/EditProfileServlet")
@MultipartConfig
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*
		 *  fetching data from editprofile
		 * */
		String name=request.getParameter("user_name");
		String email=request.getParameter("user_email");
		String password=request.getParameter("user_password");
		String about=request.getParameter("user_about");
		Part part=request.getPart("user_img");//get  image data including its file name , its extension and etc
		String imageName=part.getSubmittedFileName();//getting image name with extension
		
		/* Get the user from the session */
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("current_user");
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);
		String oldpath=user.getProfile();
		user.setProfile(imageName);
		
		
		UserDao userdao=new UserDao(ConnectionProvider.getConnection());
		boolean ans=userdao.updateUser(user);
		 if(ans){
			 response.getWriter().append("updated to db\n");
			 
			 String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();//getRealPath Target to webContent
			 
			 if(!oldpath.equals("default.png"))
				 Helper.deleteFile(request.getRealPath("/")+"pics"+File.separator+oldpath);
			
			 if(Helper.saveFile(part.getInputStream(), path)){
				 Message msg=new Message(" Profile Updated..","success","alert-success");
				 s.setAttribute("msg", msg);
			 }else{
				 Message msg=new Message("Something Went Wrong not uploaded !!..","error","alert-danger");
					
					s.setAttribute("msg", msg);
			 }
		 }else{
			 Message msg=new Message("Something Went Wrong !!..","error","alert-danger");
			
				s.setAttribute("msg", msg);
		 }
		 
		 response.sendRedirect("profile.jsp");
				doGet(request, response);
	}

}
