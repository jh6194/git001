package com.wecar.dto;

public class AllDto {
	private int rno;
	private String rprice;
	private String pdate;
	private String rdate;
	private int state;
	private String model;
	private String lname;
	
	public AllDto() {
		super();
	}

	public AllDto(int rno, String rprice, String pdate, String rdate, int state, String model, String lname) {
		super();
		this.rno = rno;
		this.rprice = rprice;
		this.pdate = pdate;
		this.rdate = rdate;
		this.state = state;
		this.model = model;
		this.lname = lname;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRprice() {
		return rprice;
	}

	public void setRprice(String rprice) {
		this.rprice = rprice;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	@Override
	public String toString() {
		return "AllDto [rno=" + rno + ", rprice=" + rprice + ", pdate=" + pdate + ", rdate=" + rdate + ", state="
				+ state + ", model=" + model + ", lname=" + lname + "]";
	}
}
