package com.duucking.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.duucking.dao.UserSongSheetMusicDao;
import com.duucking.model.Album;
import com.duucking.model.Music;
import com.duucking.util.DatabaseBean;

public class UserSongSheetMusicDaoImpl implements UserSongSheetMusicDao {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	// 获取歌曲列
	public List<Music> getSheetMusicList(String USSID) {
		List<Music> musiclist = new ArrayList<>();
		String sql = "SELECT c.MID,c.Name,c.Band,c.Artist,c.FileSource,d.Name AS Album,"
				+ "CASE WHEN c.AID IS NULL THEN c.CoverFile ELSE d.CoverFile END AS CoverFile "
				+ "FROM `CM.UserSongSheet` AS a INNER JOIN `CM.UserSongSheetMusic` AS b "
				+ "ON a.USSID=b.USSID INNER JOIN `CM.Music` AS c ON b.MID=c.MID LEFT JOIN "
				+ "`CM.Album` AS d ON c.AID=d.AID WHERE a.USSID=?";

		try {
			conn = DatabaseBean.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, USSID);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Music music = new Music();
				music.setMID(rs.getInt("MID"));
				music.setName(rs.getString("Name"));
				music.setArtist(rs.getString("Artist"));
				music.setCoverFile(rs.getString("CoverFile"));
				music.setFileSource(rs.getString("FileSource"));
				music.setBand(rs.getString("Band"));

				Album album = new Album();
				album.setname(rs.getString("Album"));
				music.setAlbum(album);

				musiclist.add(music);

			}
		} catch (SQLException ex) {
			Logger.getLogger(UserSongSheetMusicDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		return musiclist;
	}

	public boolean selectMusicInSheet(String MID, String Name, String UID, String Type) {
		boolean Return = false;
		String sql = "";
		switch (Type) {
		case "addLike":
			sql = "SELECT COUNT(USSMID) FROM `CM.UserSongSheetMusic` AS a INNER JOIN `CM.UserSongSheet` AS b ON a.USSID=b.USSID "
					+ "WHERE a.UID='" + UID + "' AND b.Tag='1' AND a.MID='" + MID + "'";
			break;
		case "addOther":
			sql = "SELECT COUNT(USSMID) FROM `CM.UserSongSheetMusic` AS a INNER JOIN `CM.UserSongSheet` AS b ON a.USSID=b.USSID "
					+ "WHERE a.UID='" + UID + "' AND b.Name='" + Name + "' AND a.MID='" + MID + "')";
			break;
		default:
			return false;
		}

		try {
			conn = DatabaseBean.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				Return = true;
			}
		} catch (SQLException ex) {
			Logger.getLogger(UserSongSheetMusicDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		return Return;
	}

	public boolean addMusicToSheet(String MID, String Name, String UID, String Type) {
		boolean Return = false;
		String sql = "";
		switch (Type) {
		case "addLike":
			if (selectMusicInSheet(MID, Name, UID, Type)) {
				return false;
			} else {
				sql = "INSERT INTO `CM.UserSongSheetMusic`(`USSID`, `UID`, `MID`, `AddDate`) (SELECT USSID,'" + UID
						+ "'," + "'" + MID + "',SYSDATE() FROM `CM.UserSongSheet` WHERE UID='" + UID + "' AND Tag='1')";
			}
			break;
		case "addOther":
			if (selectMusicInSheet(MID, Name, UID, Type)) {
				return false;
			} else {
				sql = "INSERT INTO `CM.UserSongSheetMusic`(`USSID`, `UID`, `MID`, `AddDate`) (SELECT USSID,'1','1',SYSDATE() FROM `CM.UserSongSheet` WHERE UID='1' AND Name='"
						+ Name + "')";
			}
			break;
		default:
			return false;
		}

		try {
			conn = DatabaseBean.getConnection();
			psmt = conn.prepareStatement(sql);
			if (psmt.executeUpdate() > 0) {
				Return = true;
			}

		} catch (SQLException ex) {
			Logger.getLogger(UserSongSheetMusicDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		return Return;
	}

}
