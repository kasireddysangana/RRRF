package com.kasi.rrrf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kasi.rrrf.dao.DBConnect;
import com.kasi.rrrf.entity.User;

public class UserDAO {

	public boolean createUser(User user)
	{
		Connection con =null;
		PreparedStatement pst = null;
		int count = 0;
		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement("insert into user values(?,?,?)");
			pst.setString(1, user.getUserId());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getUserType());
			count = pst.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		
		return (count==1);
	}
}
