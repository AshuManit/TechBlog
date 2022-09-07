package com.tech.blog.dao;
import com.tech.blog.entities.*;
import com.tech.blog.helper.ConnectionProvider;

import java.sql.*;
public class UserDao {
	private Connection con;
	
	public UserDao(Connection con){
		this.con=con;
	}
	
	//method to insert user to Database
	public boolean saveUser(User user){
		boolean res=false;
		try{
			String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4,user.getGender());
			pstmt.setString(5,user.getAbout());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception	 e){
			e.printStackTrace();
		}
		return res;
	}//end of saveUser method
	
	public User getUserByEmailAndPassword(String email,String password){

		

		User user=null;
		try{
			String query="select * from user where email=? and password=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				user=new User();
				//fetch data from db
				String name = rs.getString("name");	
				
				//set data to user object
				user.setName(name);
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setProfile(rs.getString("profile"));
				user.setDateTime(rs.getTimestamp("rtime"));
			}
			
		}catch(Exception e){
			
		}
		
		return user;
	}
	
	public boolean updateUser(User u){
		boolean f=false;
		try{
			String query="update user set name=? , email=? ,password=?,about=?,profile=? where id=?";
			PreparedStatement psmt=con.prepareStatement(query);
			psmt.setString(1,u.getName());
			psmt.setString(2, u.getEmail());
			psmt.setString(3, u.getPassword());
			psmt.setString(4, u.getAbout());
			psmt.setString(5,u.getProfile());
			psmt.setInt(6, u.getId());
			psmt.executeUpdate();
			f=true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
	return f;	
	}
	
	public User getUserByUserId(int userId){
		User u=null;
		try{
			String q="select * from user where id=?";
			PreparedStatement psmt=con.prepareStatement(q);
			psmt.setInt(1, userId);
			ResultSet rs=psmt.executeQuery();
			while(rs.next()){
				u=new User();
				//fetch data from db
				//set data to user object
				u.setName(rs.getString("name"));
				u.setId(rs.getInt("id"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setGender(rs.getString("gender"));
				u.setAbout(rs.getString("about"));
				u.setProfile(rs.getString("profile"));
				u.setDateTime(rs.getTimestamp("rtime"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return u;
	}
}
