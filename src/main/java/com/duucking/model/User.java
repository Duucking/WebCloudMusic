package com.duucking.model;

public class User {
	private int UID;
	private String Name;
	private String Password;
	private String Phone;
	private String Image;

	public User() {
	}

	public int getUID() {
		return UID;
	}

	public void setUID(int UID) {
		this.UID = UID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String Name) {
		this.Name = Name;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String Password) {
		this.Password = Password;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String Phone) {
		this.Phone = Phone;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String Image) {
		this.Image = Image;
	}

}
