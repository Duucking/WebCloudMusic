package com.duucking.model;

import java.sql.Date;

public class UserListenRecord {
	private int ULRID;
	private int UID;
	private int MID;
	private int Times;
	private Date AddDate;

	public int getULRID() {
		return ULRID;
	}

	public void setULRID(int uLRID) {
		ULRID = uLRID;
	}

	public int getUID() {
		return UID;
	}

	public void setUID(int uID) {
		UID = uID;
	}

	public int getMID() {
		return MID;
	}

	public void setMID(int mID) {
		MID = mID;
	}

	public int getTimes() {
		return Times;
	}

	public void setTimes(int times) {
		Times = times;
	}

	public Date getAddDate() {
		return AddDate;
	}

	public void setAddDate(Date addDate) {
		AddDate = addDate;
	}
}
