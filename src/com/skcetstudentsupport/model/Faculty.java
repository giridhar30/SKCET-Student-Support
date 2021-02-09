package com.skcetstudentsupport.model;

public class Faculty {
	
	private String facultyId;
	private String name;
	private String department;
	private String email;
	private String phone;
	private String password;
	
	public Faculty(String facultyId, String name, String email, String phone) {
		this.facultyId = facultyId.toLowerCase();
		this.name = name;
		this.department = this.facultyId.substring(2, 4).toUpperCase();
		this.email = email.toLowerCase();
		this.phone = phone;
		this.password = this.facultyId;
	}

	public String getFacultyId() {
		return facultyId;
	}
	
	public void setFacultyId(String facultyId) {
		this.facultyId = facultyId;
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
