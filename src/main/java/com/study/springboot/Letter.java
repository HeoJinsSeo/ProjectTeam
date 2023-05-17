package com.study.springboot;

public class Letter {
	private String check;
	private String order;
	private String date;
	private String title;
	private String writer;
	private int like;
	private String file_link;

	public Letter() {
	}

	public Letter(String order, String date, String title, String writer, int like) {
		this.order = order;
		this.date = date;
		this.title = title;
		this.writer = writer;
		this.like = like;
	}

	public Letter(String date, String title, String writer, int like) {
		this.date = date;
		this.title = title;
		this.writer = writer;
		this.like = like;
	}

	public String toString() {
		return "Letter [date=" + this.date + ", title=" + this.title + ", writer=" + this.writer + ", like=" + this.like
				+ "]";
	}

	public String getCheck() {
		return this.check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public String getOrder() {
		return this.order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return this.writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getLike() {
		return this.like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public String getFile_link() {
		return this.file_link;
	}

	public void setFile_link(String file_link) {
		this.file_link = file_link;
	}
}