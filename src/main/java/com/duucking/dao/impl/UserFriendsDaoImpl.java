package com.duucking.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.duucking.dao.UserFriendsDao;
import com.duucking.model.User;
import com.duucking.model.UserFriends;
import com.duucking.util.DatabaseBean;

public class UserFriendsDaoImpl implements UserFriendsDao {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	//
	public List<User> getFriendsList(String str1, String str2, String Type) {
		List<User> FriendsList = new ArrayList<>();
		User user = null;
		String sql = "";
		switch (Type) {
		case "search":
			sql = "SELECT UID,Name,Image FROM `CM.User` WHERE UID!=" + str1 + " AND Name LIKE '%" + str2
					+ "%' LIMIT 20";
			break;
		case "my":

			break;
		case "recommend":
			sql = "SELECT UID,Name,Image FROM `CM.User` WHERE UID!=" + str1
					+ " AND UID NOT IN(SELECT FriendID FROM `CM.UserFriends` WHERE UID=" + str1
					+ ") ORDER BY RAND() LIMIT 20";
			break;

		default:
			break;
		}
		try {
			conn = DatabaseBean.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setUID(rs.getInt("UID"));
				user.setName(rs.getString("Name"));
				user.setImage(rs.getString("Image"));

				FriendsList.add(user);
			}

		} catch (SQLException ex) {
			Logger.getLogger(UserFriendsDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		return FriendsList;
	}

	public boolean selectFriend(String FriendUID, String UID) {
		boolean Return = false;
		try {
			String sql = "SELECT UID FROM `CM.UserFriends` WHERE FriendID=? AND UID=?";
			conn = DatabaseBean.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, FriendUID);
			psmt.setString(2, UID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				Return = true;
			}
		} catch (SQLException ex) {
			Logger.getLogger(UserFriendsDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		return Return;
	}

	public boolean addFriend(String FriendUID, String UID) {
		boolean Return = false;
		if (selectFriend(FriendUID, UID)) {
			return false;
		} else {
			try {
				String sql = "INSERT INTO `CM.UserFriends`(`UID`, `FriendID`, `AddDate`) VALUES (?,?,SYSDATE())";
				conn = DatabaseBean.getConnection();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, UID);
				psmt.setString(2, FriendUID);
				if (psmt.executeUpdate() > 0) {
					Return = true;
				}
			} catch (SQLException ex) {
				Logger.getLogger(UserFriendsDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
			} finally {
				DatabaseBean.close(rs, psmt, conn);
			}
		}
		return Return;
	}

}
