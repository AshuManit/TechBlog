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

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int c_id=Integer.parseInt(request.getParameter("category"));
		String p_title=request.getParameter("pTitle");
		String p_content=request.getParameter("pContent");
		String p_code=request.getParameter("pCode");
		Part part=request.getPart("pPic");
		String p_pic=part.getSubmittedFileName();
		
		
		//getting user id
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("current_user");
		int user_id=user.getId();
		
		Post post=new Post(p_title, p_content, p_code, p_pic, null, c_id, user_id);
		PostDao dao=new PostDao(ConnectionProvider.getConnection());
		
		if(dao.savePost(post)){
			response.getWriter().append("save to database ");
			String path=request.getRealPath("/")+"blog_pic"+File.separator+p_pic;//getRealPath Target to webContent
			Helper.saveFile(part.getInputStream(),path);
			response.getWriter().append("pic Uploaded Done ");
			Message msg=new Message("Posted Successfully","success","fa fa-success");
		}
		else
			response.getWriter().append("not saved to database: ");
		
		response.getWriter().append("TITLE at: ").append(p_title);
		doGet(request, response);
	}

}
