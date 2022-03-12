package com.wecar.dto;

public class AjaxDto {
	private String cno;
	private String model;
	private String personnel;
	private String vehicle_year;
	private String cprice;
	private String cimg;
	private String tname;
	private String fname;
	private String brname;
	private String lname;
	private Boolean smoking;
	private Boolean navigation;
	private Boolean smart;
	private Boolean rear;
	private Boolean bluetooth;
	private String cnt;
	
	public AjaxDto() {
		super();
	}

	public AjaxDto(String cno, String model, String personnel, String vehicle_year, String cprice, String cimg,
			String tname, String fname, String brname, String lname, Boolean smoking, Boolean navigation, Boolean smart,
			Boolean rear, Boolean bluetooth, String cnt) {
		super();
		this.cno = cno;
		this.model = model;
		this.personnel = personnel;
		this.vehicle_year = vehicle_year;
		this.cprice = cprice;
		this.cimg = cimg;
		this.tname = tname;
		this.fname = fname;
		this.brname = brname;
		this.lname = lname;
		this.smoking = smoking;
		this.navigation = navigation;
		this.smart = smart;
		this.rear = rear;
		this.bluetooth = bluetooth;
		this.cnt = cnt;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getPersonnel() {
		return personnel;
	}

	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}

	public String getVehicle_year() {
		return vehicle_year;
	}

	public void setVehicle_year(String vehicle_year) {
		this.vehicle_year = vehicle_year;
	}

	public String getCprice() {
		return cprice;
	}

	public void setCprice(String cprice) {
		this.cprice = cprice;
	}

	public String getCimg() {
		return cimg;
	}

	public void setCimg(String cimg) {
		this.cimg = cimg;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getBrname() {
		return brname;
	}

	public void setBrname(String brname) {
		this.brname = brname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public Boolean getSmoking() {
		return smoking;
	}

	public void setSmoking(Boolean smoking) {
		this.smoking = smoking;
	}

	public Boolean getNavigation() {
		return navigation;
	}

	public void setNavigation(Boolean navigation) {
		this.navigation = navigation;
	}

	public Boolean getSmart() {
		return smart;
	}

	public void setSmart(Boolean smart) {
		this.smart = smart;
	}

	public Boolean getRear() {
		return rear;
	}

	public void setRear(Boolean rear) {
		this.rear = rear;
	}

	public Boolean getBluetooth() {
		return bluetooth;
	}

	public void setBluetooth(Boolean bluetooth) {
		this.bluetooth = bluetooth;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "AjaxDto [cno=" + cno + ", model=" + model + ", personnel=" + personnel + ", vehicle_year="
				+ vehicle_year + ", cprice=" + cprice + ", cimg=" + cimg + ", tname=" + tname + ", fname=" + fname
				+ ", brname=" + brname + ", lname=" + lname + ", smoking=" + smoking + ", navigation=" + navigation
				+ ", smart=" + smart + ", rear=" + rear + ", bluetooth=" + bluetooth + ", cnt=" + cnt + "]";
	}
}
