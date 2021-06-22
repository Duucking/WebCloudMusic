package com.duucking.dao;

import com.duucking.model.User;

public interface UserDao {

	User selectUser(String Name, String Password);
	Boolean insertUser(String Name, String Password,String Phone);
	User selectUsername(String Name);
	Boolean updateUserPass(String UID, String OPassword, String NPassword);
	
}
