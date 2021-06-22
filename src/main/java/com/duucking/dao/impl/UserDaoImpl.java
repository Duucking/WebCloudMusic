package com.duucking.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.duucking.dao.UserDao;
import com.duucking.model.User;
import com.duucking.util.DatabaseBean;
import com.duucking.method.EncodeAndVerify;

public class UserDaoImpl implements UserDao {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	String keyString = "";
	String encodePassword = "";

	@Override
	// 查找用户是否存在
	public User selectUser(String Name, String Password) {
		User user = null;
		keyString = Name;
		encodePassword = EncodeAndVerify.encode(Password, keyString);
		try {
			conn = DatabaseBean.getConnection();
			String sql = "SELECT * FROM `CM.User` WHERE Name=? and Password=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, Name);
			psmt.setString(2, encodePassword);
			rs = psmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUID(rs.getInt("UID"));
				user.setName(rs.getString("Name"));
				user.setPassword(rs.getString("Password"));
				user.setImage(rs.getString("Image"));
			}
		} catch (SQLException ex) {
			Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		return user;
	}

	public User selectUserByUID(String UID) {
		User user = null;
		try {
			conn = DatabaseBean.getConnection();
			String sql = "SELECT Name,Password FROM `CM.User` WHERE UID=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, UID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setName(rs.getString("Name"));
				user.setPassword(rs.getString("Password"));
			}
		} catch (SQLException ex) {
			Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		return user;
	}

	// 添加用户
	public Boolean insertUser(String Name, String Password, String Phone) {
		boolean Return = false;
		keyString = Name;
		encodePassword = EncodeAndVerify.encode(Password, keyString);
		try {
			conn = DatabaseBean.getConnection();
			String sql = "INSERT INTO `CM.User`(`Name`, `Password` , `Phone` , `Date`) " + "VALUES (?,?,?,SYSDATE())";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, Name);
			psmt.setString(2, encodePassword);
			psmt.setString(3, Phone);
			if (psmt.executeUpdate() > 0) {
				Return = true;
			}
		} catch (SQLException ex) {
			Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		return Return;
	}

	// 查找用户名是否存在
	public User selectUsername(String Name) {
		User user = null;
		try {
			conn = DatabaseBean.getConnection();
			String sql = "SELECT `Name` FROM `CM.User` WHERE Name=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, Name);
			rs = psmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setName(rs.getString("Name"));
			}
		} catch (SQLException ex) {
			Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		return user;
	}

	// 更改用户密码
	public Boolean updateUserPass(String UID, String OPassword, String NPassword) {
		boolean Return = false;
		encodePassword = EncodeAndVerify.encode(OPassword, keyString);
		User user = selectUserByUID(UID);
		if (user == null) {
			return false;
		} else {
			keyString = user.getName();
			encodePassword = EncodeAndVerify.encode(OPassword, keyString);
			if (encodePassword.equals(user.getPassword())) {
				encodePassword = EncodeAndVerify.encode(NPassword, keyString);
				try {
					conn = DatabaseBean.getConnection();
					String sql = "UPDATE `CM.User` SET `Password`=? WHERE UID=?";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, encodePassword);
					psmt.setString(2, UID);
					if (psmt.executeUpdate() > 0) {
						Return = true;
					}
				} catch (SQLException ex) {
					Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
				} finally {
					DatabaseBean.close(rs, psmt, conn);
				}
			} else {
				return false;
			}
		}
		return Return;
	}

}
