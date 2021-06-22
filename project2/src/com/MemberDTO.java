package com;

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String age;
	private String phone;
	
	public MemberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
		
	}
	
	public MemberDTO(String id, String pw, String name, String age, String phone) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.phone = phone;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
}
