package com.duucking.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.duucking.dao.UserInterestDao;
import com.duucking.model.User;
import com.duucking.model.UserInterest;
import com.duucking.util.DatabaseBean;

public class UserInterestDaoImpl implements UserInterestDao {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public ArrayList selectUserInterest(String UID) {
		ArrayList interest=new ArrayList();
		UserInterest userInterest=null;
		try {
			conn = DatabaseBean.getConnection();
			String sql = "SELECT LikeTag FROM `CM.UserInterest` WHERE UID=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, UID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				userInterest=new UserInterest();
				userInterest.setLikeTag(rs.getString("LikeTag"));
			}
		} catch (SQLException ex) {
			Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			DatabaseBean.close(rs, psmt, conn);
		}
		if(userInterest!=null) {
			String userInterestString=userInterest.getLikeTag();
			int i=0;
			while (true) {
				i++;
				int index=userInterestString.indexOf(",");
				if(index!=-1) {
					interest.add(userInterestString.substring(0, index));
					userInterestString=userInterestString.substring(index+1, userInterestString.length());
					
				}
				else {
					interest.add(userInterestString);
					break;
				}
				if (i>10) {
					break;
				}
			}
		}
		return interest;
	}

}
