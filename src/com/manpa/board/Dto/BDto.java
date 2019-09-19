package com.manpa.board.Dto;

import java.sql.Timestamp;

public class BDto {
	
	int id;
	String name;
	String title;
	String content;
	Timestamp bDate;
	int readcount;
	
	public BDto() {
		
	}
	
	public BDto(int id, String name, String title, String content, Timestamp bDate, int readcount) {
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.bDate = bDate;
		this.readcount = readcount;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getbDate() {
		return bDate;
	}

	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}


	

	
}
