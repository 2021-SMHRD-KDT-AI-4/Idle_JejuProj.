package com;

public class TourInfoDTO {
	
	private String[] tag;
	private String day;
	private String people;
	
	private Double lat;
	private Double lon;
	
	public TourInfoDTO(String[] tag, String day, String people) {
		this.tag = tag;
		this.day = day;
		this.people = people;
	}
	public TourInfoDTO(Double lat, Double lon) {
		this.lat = lat;
		this.lon = lon;
	}

	public String[] getTag() {
		return tag;
	}
	public void setTag(String[] tag) {
		this.tag = tag;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLon() {
		return lon;
	}
	public void setLon(Double lon) {
		this.lon = lon;
	}

}
