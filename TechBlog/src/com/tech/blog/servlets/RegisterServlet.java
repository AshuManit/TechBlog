package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.*;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig 
/*The @MultipartConfigannotation is used to annotate a servlet class in order to handle
 *  multipart/form-data requests and configure various upload settings.
 *   When a servlet is annotated by this annotation, 
 *   we can access all parts via the methods getParts() and 
 *   an individual part via the method getPart(name)
 *    of the HttpServletRequest object, and write the upload file to disk via the method 
 *    write(fileName) of the Part object.*/
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//fetching data from webpage
		String name=request.getParameter("user_name");
		String email=request.getParameter("user_email");
		String password=request.getParameter("user_password");
		String gender=request.getParameter("user_gender");
		String about=request.getParameter("about");
		String check=request.getParameter("check");

		response.setContentType("text/html;charset=UTF-8");
		
		if(check==null){
			response.getWriter().append("BOX not checked");
		}else{
		//create User object and set all data 
		User user=new User(name,email,password,gender,about);
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		if(dao.saveUser(user)){
			response.getWriter().append("DATA are saved to DATABASE");
		}else{
			response.getWriter().append("Soething error occur");
		}
		
		doGet(request, response);
		}
	}

}
