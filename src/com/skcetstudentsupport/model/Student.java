package com.skcetstudentsupport.model;

public class Student {
	
	private String registerNo;
	private String name;
	private String department;
	private char section;
	private String email;
	private String phone;
	private String password;	
	
	public Student(String registerNo, String name, char section, String phone) {
		this.registerNo = registerNo.toLowerCase();
		this.name = name;
		this.department = this.registerNo.substring(4, 6).toUpperCase();
		this.section = section;
		this.phone = phone;
		this.password = this.registerNo;
		this.email = this.registerNo.toLowerCase() + "@skcet.ac.in";
	}
	
	public Student(String registerNo, String name, char section, String phone, boolean passNo) {
		this.registerNo = registerNo.toLowerCase();
		this.name = name;
		this.department = this.registerNo.substring(4, 6).toUpperCase();
		this.section = section;
		this.phone = phone;
		this.password = null;
		this.email = this.registerNo.toLowerCase() + "@skcet.ac.in";
	}
	
	public String getRegisterNo() {
		return registerNo;
	}
	
	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDepartment() {
		return department;
	}
	
	public void setDepartment(String department) {
		this.department = department;
	}
	
	public char getSection() {
		return section;
	}
	
	public void setSection(char section) {
		this.section = section;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
