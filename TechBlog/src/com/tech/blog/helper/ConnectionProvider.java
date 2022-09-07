package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider {
	
	private static Connection con;
	
	public static Connection getConnection(){
		try{
			if(con==null){
				System.out.println(con);
				// Driver class loading code..
				Class.forName("com.mysql.jdbc.Driver");
				
				String url="jdbc:mysql://localhost:3306/techblog";
				String uname="root";
				String upassword="root";
				
				//create a connection..
				con=DriverManager.getConnection(url,uname,upassword);
				System.out.print("after connection"+con);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return con;
	}
}
