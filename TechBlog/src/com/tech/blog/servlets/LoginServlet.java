package com.tech.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.*;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//    fetch usesrname and password from request
		response.getWriter().append("Login servlet me aa gaya");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		response.getWriter().println(""+email+""+password);
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		response.getWriter().println(dao);
		
		
		User u=dao.getUserByEmailAndPassword(email, password);
		response.getWriter().println(u);

		if(u==null){
			//login error
			//response.getWriter().append("Invalid details try again");
			Message msg=new Message("Invalide Details ! try with another","error","alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("login_page.jsp");
		}else{
			//login error
			HttpSession s=request.getSession();
			s.setAttribute("current_user", u);
			response.getWriter().append("Valid User ..");
			response.sendRedirect("profile.jsp");
		}
		
		doGet(request, response);
	}

}
