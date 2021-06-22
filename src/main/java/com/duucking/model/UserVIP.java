package com.duucking.model;

import java.sql.Date;

public class UserVIP {
	private int UID;
	private int VIPLevel;
	private Date PurchaseDate;
	private Date ExpirationDate;
	private String PurchaseWay;

	public int getUID() {
		return UID;
	}

	public void setUID(int uID) {
		UID = uID;
	}

	public int getVIPLevel() {
		return VIPLevel;
	}

	public void setVIPLevel(int vIPLevel) {
		VIPLevel = vIPLevel;
	}

	public Date getPurchaseDate() {
		return PurchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		PurchaseDate = purchaseDate;
	}

	public Date getExpirationDate() {
		return ExpirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		ExpirationDate = expirationDate;
	}

	public String getPurchaseWay() {
		return PurchaseWay;
	}

	public void setPurchaseWay(String purchaseWay) {
		PurchaseWay = purchaseWay;
	}

}
