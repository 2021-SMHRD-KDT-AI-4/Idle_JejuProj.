package com;

public class TourDTO {

	private String name;
	private String tag1;
	private String tag2;
	private String tag3;
	private String info;
	private String addr;
	private String img;
	private String agroup;
	private String bgroup;
	private String food_group;
	private double lat;
	private double lon;
	private double cal;
	

	
	public TourDTO(String name, String info, String addr, String img, double lat, double lon, double cal) {
		this.name = name;
		this.info = info;
		this.addr = addr;
		this.img = img;
		this.lat = lat;
		this.lon = lon;
		this.cal = cal;
	}
	public TourDTO(double lat, double lon) {
		this.lat = lat;
		this.lon = lon;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getTag2() {
		return tag2;
	}
	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}
	public String getTag3() {
		return tag3;
	}
	public void setTag3(String tag3) {
		this.tag3 = tag3;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAgroup() {
		return agroup;
	}
	public void setAgroup(String agroup) {
		this.agroup = agroup;
	}
	public String getBgroup() {
		return bgroup;
	}
	public void setBgroup(String bgroup) {
		this.bgroup = bgroup;
	}
	public String getFood_group() {
		return food_group;
	}
	public void setFood_group(String food_group) {
		this.food_group = food_group;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	public double getCal() {
		return cal;
	}
	public void setCal(double cal) {
		this.cal = cal;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}
