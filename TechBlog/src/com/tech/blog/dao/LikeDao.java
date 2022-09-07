package com.tech.blog.dao;
import java.sql.*;

public class LikeDao {
	
	Connection con ;
	
	public LikeDao(Connection con){
		this.con=con;
	}
	
	public boolean insertLike(int pid,int uid){
		boolean f=false;
		try{
			String q="insert into liked(p_id,u_id) values(?,?)";
			PreparedStatement psmt=this.con.prepareStatement(q);
			psmt.setInt(1,pid);
			psmt.setInt(2, uid);
			psmt.executeUpdate();
			f=true;
		}catch(Exception e){
			e.printStackTrace();
		}
	return f;
	}
	
	public int countLikeOnPost(int pid){
		int count=0;
		try{
			String q="select count(*) from liked where p_id=?";
			PreparedStatement psmt=con.prepareStatement(q);
			psmt.setInt(1, pid);
			ResultSet rs=psmt.executeQuery();
			if(rs.next()){
				count=rs.getInt("count(*)");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
	public boolean isLikedByUser(int pid,int uid){
		boolean f=false;
		try{
			String q="select * from liked where p_id=? , u_id=?";
			PreparedStatement psmt=this.con.prepareStatement(q);
			psmt.setInt(1,pid);
			psmt.setInt(2,uid);
			ResultSet rs=psmt.executeQuery();
			while(rs.next()){
				f=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteLike(int pid,int uid){
		boolean f=false;
		try{
			String q="delete from liked where p_id=? ,u_id=?";
			PreparedStatement psmt=this.con.prepareStatement(q);
			psmt.setInt(1,pid);
			psmt.setInt(2,pid);
			psmt.executeUpdate();
			f=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
}
