package com.wecar.dto;

public class CDto {
	private String cno;
	private String brand;
	private String model;
	private String type;
	private String personnel;
	private String vehicle_year;
	private String fuel;
	private String lno;
	private int cprice;
	private String cimg;
	private String cdate;
	private String cip;
	
	public CDto() {
		super();
	}

	public CDto(String cno, String brand, String model, String type, String personnel, String vehicle_year, String fuel, String lno, int cprice,
			String cimg, String cdate, String cip) {
		super();
		this.cno = cno;
		this.brand = brand;
		this.model = model;
		this.type = type;
		this.personnel = personnel;
		this.vehicle_year = vehicle_year;
		this.fuel = fuel;
		this.lno = lno;
		this.cprice = cprice;
		this.cimg = cimg;
		this.cdate = cdate;
		this.cip = cip;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}

	public String getLno() {
		return lno;
	}

	public void setLno(String lno) {
		this.lno = lno;
	}

	public int getCprice() {
		return cprice;
	}

	public void setCprice(int cprice) {
		this.cprice = cprice;
	}

	public String getCimg() {
		return cimg;
	}

	public void setCimg(String cimg) {
		this.cimg = cimg;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getCip() {
		return cip;
	}

	public void setCip(String cip) {
		this.cip = cip;
	}

	@Override
	public String toString() {
		return "CDto [cno=" + cno + ", brand=" + brand + ", model=" + model + ", type=" + type + ", personnel="
				+ personnel + ", vehicle_year=" + vehicle_year + ", fuel=" + fuel + ", lno=" + lno + ", cprice="
				+ cprice + ", cimg=" + cimg + ", cdate=" + cdate + ", cip=" + cip + "]";
	}
}
