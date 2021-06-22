package com.duucking.dao;

import java.util.List;

import com.duucking.model.UserCollection;

public interface UserCollectionDao {

	List<UserCollection> getUserCollections(String UID);
}
