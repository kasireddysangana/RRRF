package com.kasi.rrrf.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

public class DBConnect {

	public static Connection getConnection() throws Exception
	{
		Connection con = null;
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:mysql://localhost:3306/rrr";
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection(url, "root", "kasi");
	}
	public static void closeConnection(Connection con)
	{
		try {
			if(con!=null) {
				con.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void closeStatement(Statement st)
	{
		try {
			if(st!=null) {
				st.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void closeResultSet(ResultSet rs)
	{
		try {
			if(rs!=null) {
				rs.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
