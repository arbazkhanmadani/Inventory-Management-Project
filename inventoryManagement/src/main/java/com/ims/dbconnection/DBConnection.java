package com.ims.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection con;
	
	
	public static Connection getConnectivity(){
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
			
		}catch(Exception e
				){}
	
		return con;
	}
}
