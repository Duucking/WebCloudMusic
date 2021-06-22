package com.duucking.util;

import com.duucking.dao.*;
import com.duucking.dao.impl.*;

public class DaoFactory {

	public static UserDao UserDao() {
		return new UserDaoImpl();
	}

	public static AlbumDao AlbumDao() {
		return new AlbumDaoImpl();
	}

	public static MusicDao MusicDao() {
		return new MusicDaoImpl();
	}

	public static UserInterestDao UserInterestDao() {
		return new UserInterestDaoImpl();
	}

	public static UserSongSheetDao UserSongSheetDao() {
		return new UserSongSheetDaoImpl();
	}

	public static UserSongSheetMusicDao UserSongSheetMusicDao() {
		return new UserSongSheetMusicDaoImpl();
	}

	public static UserCollectionDao UserCollectionDao() {
		return new UserCollectionDaoImpl();
	}

	public static UserFriendsDao UserFriendsDao() {
		return new UserFriendsDaoImpl();
	}

}
