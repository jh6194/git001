package com.wecar.dto;

public class EventDto {
	private int eno;
	private String ename;
	private String epass;
	private String etitle;
	private String econtent;
	private String eimg;
	private String edate;
	private int ehit;
	private String eip;
	
	public EventDto() {
		super();
	}
	
	public EventDto(int eno) {
		super();
		this.eno = eno;
	}

	public EventDto(int eno, String ename, String epass, String etitle, String econtent, String eimg, String edate,
			int ehit, String eip) {
		super();
		this.eno = eno;
		this.ename = ename;
		this.epass = epass;
		this.etitle = etitle;
		this.econtent = econtent;
		this.eimg = eimg;
		this.edate = edate;
		this.ehit = ehit;
		this.eip = eip;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEpass() {
		return epass;
	}

	public void setEpass(String epass) {
		this.epass = epass;
	}

	public String getEtitle() {
		return etitle;
	}

	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}

	public String getEcontent() {
		return econtent;
	}

	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}

	public String getEimg() {
		return eimg;
	}

	public void setEimg(String eimg) {
		this.eimg = eimg;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public int getEhit() {
		return ehit;
	}

	public void setEhit(int ehit) {
		this.ehit = ehit;
	}

	public String getEip() {
		return eip;
	}

	public void setEip(String eip) {
		this.eip = eip;
	}

	@Override
	public String toString() {
		return "EventDto [eno=" + eno + ", ename=" + ename + ", epass=" + epass + ", etitle=" + etitle + ", econtent="
				+ econtent + ", eimg=" + eimg + ", edate=" + edate + ", ehit=" + ehit + ", eip=" + eip + "]";
	}
}
