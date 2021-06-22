package com.duucking.model;

import java.sql.Date;

public class UserSongSheetMusic {
	private int USSMID;
	private int USSID;
	private int UID;
	private int MID;
	private Date AddDate;

	public int getUSSMID() {
		return USSMID;
	}

	public void setUSSMID(int uSSMID) {
		USSMID = uSSMID;
	}

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

	public int getMID() {
		return MID;
	}

	public void setMID(int mID) {
		MID = mID;
	}

	public Date getAddDate() {
		return AddDate;
	}

	public void setAddDate(Date addDate) {
		AddDate = addDate;
	}
}
