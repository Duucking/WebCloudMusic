package com.duucking.model;

import java.sql.Date;

public class UserSongSheet {
	private int USSID;
	private int UID;
	private int Count;
	private String Name;
	private Date CreateDate;
	
	public int getUSSID() {
		return USSID;
	}

	public void setUSSID(int uSSID) {
		USSID = uSSID;
	}

	public int getUID() {
		return UID;
	}

	public void setUID(int uID) {
		UID = uID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public Date getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}

	public int getCount() {
		return Count;
	}

	public void setCount(int count) {
		Count = count;
	}

}
