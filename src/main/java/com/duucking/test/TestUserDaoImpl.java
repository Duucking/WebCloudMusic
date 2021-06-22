package com.duucking.test;

import com.duucking.util.DaoFactory;
import com.duucking.model.User;

public class TestUserDaoImpl {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		User user = DaoFactory.UserDao().selectUser("当金", "1z2x3c");
		if (user != null) {
			System.out.println(user.getPassword());
		}
//		System.out.println(user.getPassword());
	}

}
