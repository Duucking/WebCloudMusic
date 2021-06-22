package com.duucking.dao;

import java.util.List;

import com.duucking.model.UserSongSheet;

public interface UserSongSheetDao {

	List<UserSongSheet> getUserSongSheets(String UID);

	boolean addUserSongSheet(String UID, String SheetName);
}
