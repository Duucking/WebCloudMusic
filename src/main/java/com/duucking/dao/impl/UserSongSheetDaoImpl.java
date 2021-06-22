package com.duucking.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.duucking.dao.UserSongSheetDao;
import com.duucking.model.UserSongSheet;
import com.duucking.util.DatabaseBean;

public class UserSongSheetDaoImpl implements UserSongSheetDao {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public List<UserSongSheet> getUserSongSheets(String UID) {
		List<UserSongSheet> userSongSheets = new ArrayList<>();
		UserSongSheet userSongSheet = null;
		try {
			conn = DatabaseBean.getConnection();
			String sql = "SELECT a.USSID,a.UID,a.CreateDate,COUNT(b.USSMID) as Count,"
					+ "CASE WHEN Tag='1' THEN CONCAT('我',a.Name) ELSE a.Name END AS Name "
					+ "FROM `CM.UserSongSheet` AS a LEFT JOIN `CM.UserSongSheetMusic` AS b "
					+ "ON a.USSID=b.USSID WHERE a.UID=? GROUP BY a.USSID";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, UID);
			rs = psmt.executeQuery();
			while (rs.next()) {
				userSongSheet = new UserSongSheet();
				userSongSheet.setUSSID(rs.getInt("USSID"));
				userSongSheet.setUID(rs.getInt("UID"));
				userSongSheet.setCreateDate(rs.getDate("CreateDate"));
				userSongSheet.setName(rs.getString("Name"));
				userSongSheet.setCount(rs.getInt("Count"));

				userSongSheets.add(userSongSheet);

			}
		} catch (SQLException ex) {
			Logger.getLogger(UserSongSheetDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}

		return userSongSheets;
	}

	public boolean addUserSongSheet(String UID, String SheetName) {
		boolean Return = false;
		try {
			conn = DatabaseBean.getConnection();
			String sql = "INSERT INTO `CM.UserSongSheet`(`UID`, `Name`, `Tag`, `CreateDate`) "
					+ "VALUES (?,?,'0',SYSDATE())";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, UID);
			psmt.setString(2, SheetName);
			if (psmt.executeUpdate() > 0) {
				Return = true;
			}
		} catch (SQLException ex) {
			Logger.getLogger(UserSongSheetDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}

		return Return;
	}
}
