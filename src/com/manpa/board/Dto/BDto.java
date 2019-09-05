package com.manpa.board.Dto;

import java.sql.Timestamp;

public class BDto {
	
	int num;
	String writer;
	String title;
	String content;
	Timestamp issue_date;
	int readcount;
	
	public BDto() {
		
	}
	
	public BDto(int num, String writer, String title, String content, Timestamp issue_date, int readcount) {
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.issue_date = issue_date;
		this.readcount = readcount;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public Timestamp getIssue_date() {
		return issue_date;
	}

	public void setIssue_date(Timestamp issue_date) {
		this.issue_date = issue_date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	

	
}
