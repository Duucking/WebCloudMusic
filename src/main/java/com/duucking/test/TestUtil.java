package com.duucking.test;

import java.sql.Connection;
import java.sql.SQLException;

import com.duucking.util.DatabaseBean;

public class TestUtil {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DatabaseBean.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (connection != null) {
			System.out.println("数据库连接成功！");
			System.out.println(connection);
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			System.out.println("数据库连接失败！");
		}
	}

}
