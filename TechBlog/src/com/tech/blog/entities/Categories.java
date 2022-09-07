package com.tech.blog.entities;

public class Categories {
	private int c_id;
	private String name;
	private String description;
	
	public Categories(int c_id, String name, String description) {
		super();
		this.c_id = c_id;
		this.name = name;
		this.description = description;
	}

	public Categories(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}

	public Categories() {
		super();
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
}
