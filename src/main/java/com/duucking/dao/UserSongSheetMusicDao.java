package com.duucking.dao;

import java.util.List;

import com.duucking.model.Music;

public interface UserSongSheetMusicDao {

	List<Music> getSheetMusicList(String USSID);

	boolean addMusicToSheet(String MID, String Name, String UID, String Type);
}
