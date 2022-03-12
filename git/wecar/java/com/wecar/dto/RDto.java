package com.wecar.dto;

public class RDto {
	private int rno;
	private int rprice;
	private int state;
	private String pdate;
	private String rdate;
	private String date;
	private String rip;
	private String cno;
	private int uno;
	private String insu;
	
	public RDto() {
		super();
	}

	public RDto(int rno) {
		super();
		this.rno = rno;
	}

	public RDto(int rno, int rprice, int state, String pdate, String rdate) {
		super();
		this.rno = rno;
		this.rprice = rprice;
		this.state = state;
		this.pdate = pdate;
		this.rdate = rdate;
	}

	public RDto(int rno, int rprice, int state, String pdate, String rdate, String rip, String cno, int uno, String insu) {
		super();
		this.rno = rno;
		this.rprice = rprice;
		this.state = state;
		this.pdate = pdate;
		this.rdate = rdate;		
		this.rip = rip;
		this.cno = cno;
		this.uno = uno;
		this.insu = insu;
	}
	
	public RDto(int rno, int rprice, int state, String pdate, String rdate, String date, String rip, String cno,
			int uno, String insu) {
		super();
		this.rno = rno;
		this.rprice = rprice;
		this.state = state;
		this.pdate = pdate;
		this.rdate = rdate;
		this.date = date;
		this.rip = rip;
		this.cno = cno;
		this.uno = uno;
		this.insu = insu;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getRprice() {
		return rprice;
	}

	public void setRprice(int rprice) {
		this.rprice = rprice;
	}

	public int isState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getState() {
		return state;
	}

	public String getRip() {
		return rip;
	}

	public void setRip(String rip) {
		this.rip = rip;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getInsu() {
		return insu;
	}

	public void setInsu(String insu) {
		this.insu = insu;
	}

	@Override
	public String toString() {
		return "RDto [rno=" + rno + ", rprice=" + rprice + ", state=" + state + ", pdate=" + pdate + ", rdate=" + rdate
				+ ", date=" + date + ", rip=" + rip + ", cno=" + cno + ", uno=" + uno + ", insu=" + insu + "]";
	}
}
