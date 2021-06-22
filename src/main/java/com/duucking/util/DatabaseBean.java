package com.duucking.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseBean {

	public static Connection getConnection() {
		Connection conn = null;
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://121.43.52.57:3306/cloudmusicdb";
		String username = "CloudMusicDB";
		String password = "ZQP1z2x3c";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(DatabaseBean.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException ex) {
			Logger.getLogger(DatabaseBean.class.getName()).log(Level.SEVERE, null, ex);
		}

		return conn;
	}

	public static void close(ResultSet rs, Statement st, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (st != null) {
				st.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException ex) {
			Logger.getLogger(DatabaseBean.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
}
