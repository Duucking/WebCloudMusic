package com.duucking.dao;

import java.util.List;

import com.duucking.model.User;
import com.duucking.model.UserFriends;

public interface UserFriendsDao {
	List<User> getFriendsList(String str1, String str2, String Type);

	boolean addFriend(String FriendUID, String UID);

}
