package com.duucking.model;

import java.sql.Date;

public class UserInterest {
	private int UIID;
	private int UID;
	private String likeTag;
	private Date AddDate;

	public int getUIID() {
		return UIID;
	}

	public void setUIID(int uIID) {
		UIID = uIID;
	}

	public int getUID() {
		return UID;
	}

	public void setUID(int uID) {
		UID = uID;
	}

	public String getLikeTag() {
		return likeTag;
	}

	public void setLikeTag(String likeTag) {
		this.likeTag = likeTag;
	}

	public Date getAddDate() {
		return AddDate;
	}

	public void setAddDate(Date addDate) {
		AddDate = addDate;
	}

}
