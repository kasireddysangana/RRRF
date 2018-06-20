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
			pst = con.prepareStatement("select LOCATION_ID, LOCATION_NAME from location ORDER BY LOCATION_ID DESC");
			
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
	
	public boolean createLocation(Location location)
	{
		Connection con = null;
		PreparedStatement pst = null;
		int count = 0;
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("insert into location (LOCATION_ID, LOCATION_NAME) values (?,?)");
			pst.setString(1, location.getLocationId());
			pst.setString(2, location.getLocation());
			
			count = pst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		
		return (count==1);
	}
	
	public Boolean fetchLocationByName(String locationName)
	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean flag = false;
		try{
			con = DBConnect.getConnection();
			pst = con.prepareStatement("select LOCATION_ID, LOCATION_NAME from location where LOCATION_NAME = ?");
			pst.setString(1, locationName);
			rs = pst.executeQuery();
			if(rs.next())
			{
				flag = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.closeResultSet(rs);
			DBConnect.closeStatement(pst);
			DBConnect.closeConnection(con);
		}
		
		return flag;
	}
}
