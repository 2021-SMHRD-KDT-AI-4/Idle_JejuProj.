package com;

public class BoardDTO {
	
	private int num;
	private String title;
	private String content;
	private String id;
	private String day;
	
	
	public BoardDTO(int num, String title, String content, String id, String day) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.day = day;
	}
	public BoardDTO(String title, String content, String id) {
		this.title = title;
		this.content = content;
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	
}
