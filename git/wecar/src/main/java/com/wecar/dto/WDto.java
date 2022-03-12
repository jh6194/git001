package com.wecar.dto;

public class WDto {
	private int uno;
	private String id;
	private String pass;
	private String name;
	private String birth;
	private String date;
	private String phone;
	private String email;
	private String post;
	private String address;
	private String address_detail;
	private int rank;
	private String ip;
	private String kakao;
	
	public WDto() {
		super();
	}

	public WDto(int uno, String id) {
		super();
		this.uno = uno;
		this.id = id;
	}
	
	public WDto(int uno, String id, String pass, String name, String birth, String date, String phone, String email,
			String post, String address, String address_detail, int rank, String ip) {
		super();
		this.uno = uno;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.birth = birth;
		this.date = date;
		this.phone = phone;
		this.email = email;
		this.post = post;
		this.address = address;
		this.address_detail = address_detail;
		this.rank = rank;
		this.ip = ip;
	}

	public WDto(int uno, String id, String pass, String name, String birth, String date, String phone, String email,
			String post, String address, String address_detail, int rank, String ip, String kakao) {
		super();
		this.uno = uno;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.birth = birth;
		this.date = date;
		this.phone = phone;
		this.email = email;
		this.post = post;
		this.address = address;
		this.address_detail = address_detail;
		this.rank = rank;
		this.ip = ip;
		this.kakao = kakao;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getKakao() {
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
	}

	@Override
	public String toString() {
		return "WDto [uno=" + uno + ", id=" + id + ", pass=" + pass + ", name=" + name + ", birth=" + birth + ", date="
				+ date + ", phone=" + phone + ", email=" + email + ", post=" + post + ", address=" + address
				+ ", address_detail=" + address_detail + ", rank=" + rank + ", ip=" + ip + ", kakao=" + kakao + "]";
	}
}
