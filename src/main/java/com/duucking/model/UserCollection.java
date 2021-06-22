package com.duucking.model;

import java.sql.Date;

public class UserCollection {

	private int UCID;
	private int UID;
	private String Name;
	private String UserName;
	private int Count;
	private int USSID;
	private Date AddDate;
	private User user;
	private UserSongSheet userSongSheet;

	public int getUCID() {
		return UCID;
	}

	public void setUCID(int uCID) {
		UCID = uCID;
	}

	public int getUID() {
		return UID;
	}

	public void setUID(int uID) {
		UID = uID;
	}

	public int getUSSID() {
		return USSID;
	}

	public void setUSSID(int uSSID) {
		USSID = uSSID;
	}

	public Date getAddDate() {
		return AddDate;
	}

	public void setAddDate(Date addDate) {
		AddDate = addDate;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public int getCount() {
		return Count;
	}

	public void setCount(int count) {
		Count = count;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserSongSheet getUserSongSheet() {
		return userSongSheet;
	}

	public void setUserSongSheet(UserSongSheet userSongSheet) {
		this.userSongSheet = userSongSheet;
	}
}