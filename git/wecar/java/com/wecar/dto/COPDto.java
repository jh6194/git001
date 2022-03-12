package com.wecar.dto;

public class COPDto {
	private boolean smoking;
	private boolean navigation;
	private boolean smart;
	private boolean rear;
	private boolean bluetooth;
	private String cno;
	
	public COPDto() {
		super();
	}

	public COPDto(boolean smoking, boolean navigation, boolean smart, boolean rear, boolean bluetooth, String cno) {
		super();
		this.smoking = smoking;
		this.navigation = navigation;
		this.smart = smart;
		this.rear = rear;
		this.bluetooth = bluetooth;
		this.cno = cno;
	}

	public boolean isSmoking() {
		return smoking;
	}

	public void setSmoking(boolean smoking) {
		this.smoking = smoking;
	}

	public boolean isNavigation() {
		return navigation;
	}

	public void setNavigation(boolean navigation) {
		this.navigation = navigation;
	}

	public boolean isSmart() {
		return smart;
	}

	public void setSmart(boolean smart) {
		this.smart = smart;
	}

	public boolean isRear() {
		return rear;
	}

	public void setRear(boolean rear) {
		this.rear = rear;
	}

	public boolean isBluetooth() {
		return bluetooth;
	}

	public void setBluetooth(boolean bluetooth) {
		this.bluetooth = bluetooth;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	@Override
	public String toString() {
		return "COPDto [smoking=" + smoking + ", navigation=" + navigation + ", smart=" + smart + ", rear=" + rear
				+ ", bluetooth=" + bluetooth + ", cno=" + cno + "]";
	}
}
