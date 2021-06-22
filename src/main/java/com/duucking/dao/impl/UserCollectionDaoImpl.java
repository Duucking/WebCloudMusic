package com.duucking.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.duucking.dao.UserCollectionDao;
import com.duucking.model.User;
import com.duucking.model.UserCollection;
import com.duucking.model.UserSongSheet;
import com.duucking.util.DatabaseBean;

public class UserCollectionDaoImpl implements UserCollectionDao {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public List<UserCollection> getUserCollections(String UID) {
		List<UserCollection> userCollections = new ArrayList<>();
		UserCollection userCollection = null;
		UserSongSheet userSongSheet = null;
		User user = null;
		try {
			conn = DatabaseBean.getConnection();
			String sql = "SELECT a.USSID,COUNT(c.USSMID) AS Count,d.Name AS UserName,"
					+ "CASE WHEN b.Tag='1' THEN CONCAT(d.Name,b.Name) ELSE b.Name END AS Name," + "b.CreateDate "
					+ " FROM `CM.UserCollection` AS a INNER JOIN `CM.UserSongSheet` AS b "
					+ "ON a.USSID=b.USSID LEFT JOIN `CM.UserSongSheetMusic` AS c "
					+ "ON a.USSID=c.USSID INNER JOIN `CM.User` AS d ON b.UID=d.UID " + "WHERE a.UID=? GROUP BY a.USSID";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, UID);
			rs = psmt.executeQuery();
			while (rs.next()) {
				userCollection = new UserCollection();
				userSongSheet = new UserSongSheet();
				user = new User();
				userCollection.setUSSID(rs.getInt("USSID"));
				userCollection.setCount(rs.getInt("Count"));
				userCollection.setName(rs.getString("Name"));

				user.setName(rs.getString("UserName"));

				userSongSheet.setCreateDate(rs.getDate("CreateDate"));

				userCollection.setUser(user);
				userCollection.setUserSongSheet(userSongSheet);

				userCollections.add(userCollection);
			}
		} catch (SQLException ex) {
			Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}

		return userCollections;
	}
}
