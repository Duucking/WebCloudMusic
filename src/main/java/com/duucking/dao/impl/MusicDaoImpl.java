package com.duucking.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.duucking.dao.MusicDao;
import com.duucking.model.Music;
import com.duucking.model.Album;
import com.duucking.util.DatabaseBean;

public class MusicDaoImpl implements MusicDao {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	// 获取歌曲列
	public List<Music> getMusicList(String str1, String str2, String Type) {
		List<Music> musiclist = new ArrayList<>();
		String sql = "";
		switch (Type) {
		case "top8":
			sql = "SELECT a.MID, a.Name, a.Artist, a.Band,a.FileSource,'' AS Album, "
					+ "CASE WHEN a.AID IS NULL THEN a.CoverFile ELSE b.CoverFile END AS CoverFile "
					+ "FROM `CM.Music` as a LEFT OUTER JOIN `CM.Album` as b ON a.AID = b.AID "
					+ "ORDER BY a.ListenTime DESC LIMIT 8";
			break;
		case "new10":
			sql = "SELECT a.MID, a.Name, a.Artist, a.Band, a.AID, a.FileSource,'' AS Album, "
					+ "CASE WHEN a.AID IS NULL THEN a.CoverFile ELSE b.CoverFile END AS CoverFile "
					+ "FROM `CM.Music` as a LEFT OUTER JOIN `CM.Album` as b ON a.AID = b.AID "
					+ "ORDER BY a.AddDate DESC LIMIT 10";
			break;
		case "search":
			if (str1 != "") {
				sql = "SELECT a.MID,a.Name,a.Band,a.Artist,b.Name as Album,a.FileSource,"
						+ "CASE WHEN a.AID IS NULL THEN a.CoverFile ELSE b.CoverFile END AS CoverFile "
						+ "FROM `CM.Music`   AS a LEFT OUTER JOIN `CM.Album` as b ON a.AID = b.AID "
						+ "WHERE a.Name LIKE '%" + str1 + "%' OR a.Artist LIKE '%" + str1 + "%' OR a.Band LIKE '%"
						+ str1 + "%' OR b.Name LIKE '%" + str1 + "%'";
			} else {
				sql = "SELECT NULL";
			}
			break;
		default:
			sql = "SELECT NULL";
			break;
		}

		try {
			conn = DatabaseBean.getConnection();
			psmt = conn.prepareStatement(sql);
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
			Logger.getLogger(MusicDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		return musiclist;
	}

	// 获取歌曲列
	public List<Music> getRecommendMusicList(ArrayList interest) {
		List<Music> musiclist = new ArrayList<>();
		String sql = "SELECT a.MID, a.Name, a.Artist, a.Band,a.FileSource,b.Name AS Album, "
				+ "CASE WHEN a.AID IS NULL THEN a.CoverFile ELSE b.CoverFile END AS CoverFile "
				+ "FROM `CM.Music` as a LEFT OUTER JOIN `CM.Album` as b ON a.AID = b.AID " + "WHERE ";
		if (interest.size() > 0) {
			for (int i = 0; i < interest.size(); i++) {
				if (i == interest.size() - 1) {
					sql += " a.Tag LIKE '%" + interest.get(i) + "%' ORDER BY RAND() LIMIT 20";
				} else {
					sql += " a.Tag LIKE '%" + interest.get(i) + "%' OR";
				}
			}
		} else {
			sql += "1 ORDER BY RAND() LIMIT 20";
		}
		try {
			conn = DatabaseBean.getConnection();
			psmt = conn.prepareStatement(sql);
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
			Logger.getLogger(MusicDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		return musiclist;
	}

}
