package com.skcetstudentsupport.model;

import java.sql.Date;

public class Achievement {

	private String registerNo;
	private String typeOfAchievement;
	private String hosted;
	private Date date;
	private String awards;
	private String description;
	private String certificate;
	
	
	public Achievement(String registerNo, String typeOfAchievement, String hosted, Date date, String awards,
			String description, String certificate) {
		super();
		this.registerNo = registerNo;
		this.typeOfAchievement = typeOfAchievement;
		this.hosted = hosted;
		this.date = date;
		this.awards = awards;
		this.description = description;
		this.certificate = certificate;
	}
	
	public String getRegisterNo() {
		return registerNo;
	}
	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}
	public String getTypeOfAchievement() {
		return typeOfAchievement;
	}
	public void setTypeOfAchievement(String typeOfAchievement) {
		this.typeOfAchievement = typeOfAchievement;
	}
	public String getHosted() {
		return hosted;
	}
	public void setHosted(String hosted) {
		this.hosted = hosted;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getAwards() {
		return awards;
	}
	public void setAwards(String awards) {
		this.awards = awards;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
}