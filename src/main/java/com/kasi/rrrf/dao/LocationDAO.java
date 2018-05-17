package com.kasi.rrrf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kasi.rrrf.entity.Location;

public class LocationDAO {

	public List<Location> fetchLocations()
	{
		ArrayList<Location> locationsList = new ArrayList<Location>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select LOCATION_ID, LOCATION_NAME from location");
			
			rs = pst.executeQuery();
			while(rs.next())
			{
				locationsList.add(new Location(rs.getString(1),rs.getString(2)));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeResultSet(rs);
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		
		return locationsList;
	}
}
