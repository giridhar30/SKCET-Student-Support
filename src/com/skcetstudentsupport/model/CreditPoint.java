package com.skcetstudentsupport.model;

public class CreditPoint {
	
	private int semNo;
	private String subjectCode;
	private String subject;
	private float credits;
	private String department;
	
	public CreditPoint(int semNo, String subjectCode, String subject, float credits, String department) {
		this.semNo = semNo;
		this.subjectCode = subjectCode;
		this.subject = subject;
		this.credits = credits;
		this.department = department;
	}

	public int getSemNo() {
		return semNo;
	}

	public void setSemNo(int semNo) {
		this.semNo = semNo;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public float getCredits() {
		return credits;
	}

	public void setCredits(float credits) {
		this.credits = credits;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
}
