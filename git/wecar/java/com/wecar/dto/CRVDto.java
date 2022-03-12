package com.wecar.dto;

public class CRVDto {	
	private int sno;
	private int star;
	private String sname;
	private String scontent;
	private String sfile;
	private String sdate;
	private String sip;
	private String cno;
	private int uno;
	private String model;
	
	public CRVDto() { super();  }
	
	public CRVDto(int star, String scontent, String sdate) {
		super();
		this.star = star;
		this.scontent = scontent;
		this.sdate = sdate;
	}

	public CRVDto(int star, String scontent, String sdate, String cno) {
		super();
		this.star = star;
		this.scontent = scontent;
		this.sdate = sdate;
		this.cno = cno;
	}

	public CRVDto(int sno, int star, String scontent, String sdate, String cno) {
		super();
		this.sno = sno;
		this.star = star;
		this.scontent = scontent;
		this.sdate = sdate;
		this.cno = cno;
	}

	public CRVDto(int sno, int star, String sname, String scontent, String sfile, String sdate, String sip) {
		super();
		this.sno = sno;
		this.star = star;
		this.sname = sname;
		this.scontent = scontent;
		this.sfile = sfile;
		this.sdate = sdate;
		this.sip = sip;
	}

	public CRVDto(int sno, int star, String sname, String scontent, String sfile, String sdate, String sip, String cno,
			int uno, String model) {
		super();
		this.sno = sno;
		this.star = star;
		this.sname = sname;
		this.scontent = scontent;
		this.sfile = sfile;
		this.sdate = sdate;
		this.sip = sip;
		this.cno = cno;
		this.uno = uno;
		this.model = model;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getScontent() {
		return scontent;
	}

	public void setScontent(String scontent) {
		this.scontent = scontent;
	}

	public String getSfile() {
		return sfile;
	}

	public void setSfile(String sfile) {
		this.sfile = sfile;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getSip() {
		return sip;
	}

	public void setSip(String sip) {
		this.sip = sip;
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

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Override
	public String toString() {
		return "CRVDto [sno=" + sno + ", star=" + star + ", sname=" + sname + ", scontent=" + scontent + ", sfile="
				+ sfile + ", sdate=" + sdate + ", sip=" + sip + ", cno=" + cno + ", uno=" + uno + ", model=" + model
				+ "]";
	}
}
