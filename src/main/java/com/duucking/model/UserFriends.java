package com.duucking.model;

import java.sql.Date;

public class UserFriends {
	private int UID;
	private int FriendID;
	private Date AddDate;

	public int getUID() {
		return UID;
	}

	public void setUID(int uID) {
		UID = uID;
	}

	public int getFriendID() {
		return FriendID;
	}

	public void setFriendID(int friendID) {
		FriendID = friendID;
	}

	public Date getAddDate() {
		return AddDate;
	}

	public void setAddDate(Date addDate) {
		AddDate = addDate;
	}
}
