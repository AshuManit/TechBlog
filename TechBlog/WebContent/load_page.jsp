<%@page import="java.util.*"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>


<div class="row">
<%
	try{
	PostDao dao=new PostDao(ConnectionProvider.getConnection());
	int c_id=Integer.parseInt(request.getParameter("cid"));
	List<Post> posts=null;
	if(c_id==0){
		 posts=dao.getAllPosts();
	}else{
		 posts=dao.getPostByCatId(c_id);
	}
	if(posts.size()==0){
		out.println("<h3 class='display-3 text-center' >No post availabe in this category ..</h3>");
		return;
	}
	for(Post post:posts){
		
%>
<div class="col-md-6 mt-2">
	<div class="card">
		<img class="card-img-top" src="blog_pic/<%=post.getP_pic() %>" alt="card image cap">
		<div class="card=body">
			<b><%=post.getP_title() %></b>
			<%-- <p><%=post.getP_content() %></p> --%>
			<p><%
				String content=post.getP_content();
				for(int i=0;i<100;i++){
					out.print(content.charAt(i));
				}
			%><a href="show_blog.jsp?post_id=<%=post.getP_id() %>" > Read more...</a></p>
			
		</div>
		<div class="card-footer primary-backgorund text-center">
			<a href="#" class="btn btn-outline-dark btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
			<a href="#" class="btn btn-outline-dark btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
			
		</div>	
	</div>

</div>

<%		
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
%>

</div>