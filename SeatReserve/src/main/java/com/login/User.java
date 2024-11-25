package com.login;

public class User {
	private int id;
	private String name;
	private String phone;
	private String email;
	private String username;
	private String password;

	public User(int id, String name, String phone, String email, String username, String password) {
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.username = username;
		this.password = password;
	}

	

	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}


	private static User instance;//using design patterns
	
	public static User getInstance() {//public methods to get instance
		if(instance==null) {
			instance=new User();
		}
		
		return instance;
	}
	
	private User() {//making the constructor private
		
	}

	
	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}
	
}
