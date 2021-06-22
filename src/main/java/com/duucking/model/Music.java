package com.duucking.model;

public class Music {
	private int MID;
	private String Name;
	private String LyricFile;
	private String Artist;
	private String Band;
	private String AID;
	private String CoverFile;
	private String FileSource;
	private String Tag;
	private int ListenTime;
	private Album album;

	public Music() {
	}

	public int getMID() {
		return MID;
	}

	public void setMID(int MID) {
		this.MID = MID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String Name) {
		this.Name = Name;
	}

	public String getLyricFile() {
		return LyricFile;
	}

	public void setLyricFile(String LyricFile) {
		this.LyricFile = LyricFile;
	}

	public String getArtist() {
		return Artist;
	}

	public void setArtist(String Artist) {
		this.Artist = Artist;
	}

	public String getBand() {
		return Band;
	}

	public void setBand(String Band) {
		this.Band = Band;
	}

	public String getAID() {
		return AID;
	}

	public void setAID(String AID) {
		this.AID = AID;
	}

	public String getCoverFile() {
		return CoverFile;
	}

	public void setCoverFile(String CoverFile) {
		this.CoverFile = CoverFile;
	}

	public String getFileSource() {
		return FileSource;
	}

	public void setFileSource(String FileSource) {
		this.FileSource = FileSource;
	}

	public String getTag() {
		return Tag;
	}

	public void setTag(String Tag) {
		this.Tag = Tag;
	}
	
	public int getListenTime() {
		return ListenTime;
	}

	public void setListenTime(int ListenTime) {
		this.ListenTime = ListenTime;
	}
	
	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

}
