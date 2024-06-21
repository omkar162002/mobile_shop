package com.entity;

public class DeviceDtls {

	private int deviceId;
	private String deviceName;
	private String ino;
	private String price;
	private String deviceCategory;
	private String status;
	private String photoName;
	private String email;

	public DeviceDtls() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DeviceDtls(String deviceName, String ino, String price, String deviceCategory, String status, String photoName,
			String email) {
		super();
		this.deviceName = deviceName;
		this.ino = ino;
		this.price = price;
		this.deviceCategory = deviceCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}

	public int getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
	}

	public String getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}

	public String getIno() {
		return ino;
	}

	public void setIno(String ino) {
		this.ino = ino;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDeviceCategory() {
		return deviceCategory;
	}

	public void setDeviceCategory(String deviceCategory) {
		this.deviceCategory = deviceCategory;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "DeviceDtls [deviceId=" + deviceId + ", deviceName=" + deviceName + ", ino=" + ino + ", price=" + price
				+ ", deviceCategory=" + deviceCategory + ", status=" + status + ", photoName=" + photoName + ", email="
				+ email + "]";
	}

}
