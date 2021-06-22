package com.duucking.model;

import java.sql.Date;

public class Album {
	private int AID;
	private String Name;
	private String CoverFile;
	private Date ReleaseTime;
	private String Band;
	private String Artist;

	public Album() {
	}

	public int getAID() {
		return AID;
	}

	public void setAID(int AID) {
		this.AID = AID;
	}

	public String getName() {
		return Name;
	}

	public void setname(String Name) {
		this.Name = Name;
	}

	public String getCoverFile() {
		return CoverFile;
	}

	public void setCoverFile(String CoverFile) {
		this.CoverFile = CoverFile;
	}

	public Date getReleaseTime() {
		return ReleaseTime;
	}

	public void setReleaseTime(Date ReleaseTime) {
		this.ReleaseTime = ReleaseTime;
	}

	public String getBand() {
		return Band;
	}

	public void setBand(String Band) {
		this.Band = Band;
	}

	public String getArtist() {
		return Artist;
	}

	public void setArtist(String Artist) {
		this.Artist = Artist;
	}

}
