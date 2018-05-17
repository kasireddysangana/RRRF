package com.kasi.rrrf.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kasi.rrrf.entity.Client;

public class ClientDAO {

	public boolean registerClient(Client client)
	{
		Connection con = null;
		PreparedStatement pst = null;
		int count = 0;
		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement("INSERT INTO CLIENT (CLIENT_ID,CLIENT_NAME,"
					+ "CLIENT_MOBILE,CLIENT_LOCATION, USER_ID) VALUES (?,?,?,?,?)");
			pst.setString(1, client.getClientId());
			pst.setString(2, client.getClientName());
			pst.setString(3, client.getClientMobile());
			pst.setString(4, client.getClientLocation());
			pst.setString(5, client.getUserId());
			count = pst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		return (count==1);
	}
}
