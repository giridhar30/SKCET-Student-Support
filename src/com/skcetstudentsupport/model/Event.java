package com.skcetstudentsupport.model;


public class Event {
	
	private int id;
	private String name;
	private String description;
	private String date;
	private String expiryDate;
	private String link;
	private String contact;
	private String organization;
	
	public Event(String name, String description, String date, String expiryDate, String link, String contact,
			String organization) {
		this.name = name;
		this.description = description;
		this.date = date;
		this.expiryDate = expiryDate;
		this.link = link;
		this.contact = contact;
		this.organization = organization;
	}

	public Event(int id, String name, String description, String date, String expiryDate, String link, String contact,
			String organization) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.date = date;
		this.expiryDate = expiryDate;
		this.link = link;
		this.contact = contact;
		this.organization = organization;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expirydate) {
		this.expiryDate = expirydate;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

}
