package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
	private int p_id;
	private String p_title;
	private String p_content;
	private String p_code;
	private String p_pic;
	private Timestamp p_date;
	private int c_id;
	private int user_id;
	public Post(int p_id, String p_title, String p_content, String p_code, String p_pic, Timestamp p_date, int c_id ,int user_id) {
		super();
		this.p_id = p_id;
		this.p_title = p_title;
		this.p_content = p_content;
		this.p_code = p_code;
		this.p_pic = p_pic;
		this.p_date = p_date;
		this.c_id = c_id;
		this.user_id=user_id;
	}
	public Post(String p_title, String p_content, String p_code, String p_pic, Timestamp p_date, int c_id,int user_id) {
		super();
		this.p_title = p_title;
		this.p_content = p_content;
		this.p_code = p_code;
		this.p_pic = p_pic;
		this.p_date = p_date;
		this.c_id = c_id;
		this.user_id=user_id;
	}
	public Post() {
		super();
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getP_pic() {
		return p_pic;
	}
	public void setP_pic(String p_pic) {
		this.p_pic = p_pic;
	}
	public Timestamp getP_date() {
		return p_date;
	}
	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	
}
