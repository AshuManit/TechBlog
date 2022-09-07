package com.tech.blog.dao;
import java.sql.*;
import com.tech.blog.entities.*;
import java.util.*;
public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<Categories> getAllCategories(){
		ArrayList<Categories> catList=new ArrayList();
		try{
			String query="select * from categories";
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()){
				int id=rs.getInt("c_id");
				String cName=rs.getString("name");
				String cDesc=rs.getString("description");
				Categories cat=new Categories(id,cName,cDesc);
				catList.add(cat);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return catList;
	}
	
	public List<Post> getAllPosts(){
		List<Post> list=new ArrayList<Post>();
		try{
			String query="select * from post order by p_id desc";
			PreparedStatement psmt=con.prepareStatement(query);
			ResultSet rs=psmt.executeQuery();
			while(rs.next()){
				int p_id=rs.getInt("p_id");
				String p_title = rs.getString("p_title");
				String p_content=rs.getString("p_content");
				String p_code=rs.getString("p_code");
				String p_pic=rs.getString("p_pic");
				Timestamp p_date=rs.getTimestamp("p_date");
				
				int c_id=rs.getInt("c_id");
				int user_id=rs.getInt("user_id");
				Post post = new Post(p_id, p_title, p_content, p_code, p_pic, p_date, c_id, user_id);
				list.add(post);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return  list;
	}
	
	
	public List<Post> getPostByCatId(int catId){
		List<Post> list=new ArrayList<Post>();		
		try{
			String query="select * from post where c_id=?";
			PreparedStatement psmt=con.prepareStatement(query);
			psmt.setInt(1, catId);
			ResultSet rs=psmt.executeQuery();
			while(rs.next()){
				int p_id=rs.getInt("p_id");
				String p_title = rs.getString("p_title");
				String p_content=rs.getString("p_content");
				String p_code=rs.getString("p_code");
				String p_pic=rs.getString("p_pic");
				Timestamp p_date=rs.getTimestamp("p_date");
				int c_id=rs.getInt("c_id");
				int user_id=rs.getInt("user_id");
				Post post = new Post(p_id, p_title, p_content, p_code, p_pic, p_date, c_id, user_id);
				list.add(post);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public boolean savePost(Post p){
		boolean f=false;
		try{
			String query="insert into post (p_title,p_content,p_code,p_pic,c_id,user_id) values (?,?,?,?,?,?)";
			PreparedStatement psmt=con.prepareStatement(query);
			psmt.setString(1, p.getP_title());
			psmt.setString(2, p.getP_content());
			psmt.setString(3, p.getP_code());
			psmt.setString(4, p.getP_pic());
			psmt.setInt(5, p.getC_id());
			psmt.setInt(6, p.getUser_id());
			psmt.executeUpdate();
			f=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
	
	public Post getPostByPostId(int post_id){
		Post p=null;
		String q="select * from  post where p_id=?";
		try{
		PreparedStatement psmt=con.prepareStatement(q);
		psmt.setInt(1,post_id);
		ResultSet rs=psmt.executeQuery();
		if(rs.next()){
			int p_id=rs.getInt("p_id");
			String p_title = rs.getString("p_title");
			String p_content=rs.getString("p_content");
			String p_code=rs.getString("p_code");
			String p_pic=rs.getString("p_pic");
			Timestamp p_date=rs.getTimestamp("p_date");
			int user_id=rs.getInt("user_id");
			int c_id=rs.getInt("c_id");
			p=new Post(p_title, p_content, p_code, p_pic, p_date, c_id, user_id);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return p;
	}
	
	
}
