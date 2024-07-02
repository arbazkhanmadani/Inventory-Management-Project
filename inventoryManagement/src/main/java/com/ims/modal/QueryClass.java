package com.ims.modal;

import java.sql.Connection;
import java.sql.*;
import java.util.*;
import com.ims.dbconnection.*;
import java.sql.PreparedStatement;
public class QueryClass {

	static Connection con =  DBConnection.getConnectivity();
	
	static Registration1 user;
  	
	public static boolean registerUser(Registration1 reg){
		
		boolean b = false;
		try {
			
			PreparedStatement ps = con.prepareStatement("insert into registration values(?,?,?,?,?)");
			ps.setString(1, reg.getUserName());
			ps.setString(2, reg.getFirstName());
			ps.setString(3, reg.getLastName());
			ps.setString(4, reg.getEmailId());
			ps.setString(5, reg.getPassword());
			
			b = ps.execute();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(!b)
			return true;
		else
			return false;
	}
	
	
	
public static boolean Addcustomer(Customer cus){
		
		boolean b = false;
		try {
			
			PreparedStatement ps = con.prepareStatement("insert into customer values(?,?,?,?,?)");
			ps.setInt(1, cus.getCustomerId());
			ps.setString(2, cus.getCustomerName());
			ps.setLong(3, cus.getContactNumber());
			ps.setString(4, cus.getCustomerAddress());
			ps.setString(5, cus.getDateOfPurchase().toString());
			
			b = ps.execute();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		if(!b)
			return true;
		else
			return false;
	}
	


	public static boolean UpdateCustomer(Customer cus){
	
		boolean b = false;
		try {
		
			PreparedStatement ps = con.prepareStatement("update customer set customerName=?, contactNumber=?,customerAddress=?, dateOfAddress=? where customerId=?");
			ps.setString(1, cus.getCustomerName());
			ps.setLong(2, cus.getContactNumber());
			ps.setString(3, cus.getCustomerAddress());
			ps.setString(4, cus.getDateOfPurchase().toString());
			ps.setInt(5, cus.getCustomerId());
			
			b = ps.execute();
		
		} catch (Exception e) {
		
		System.out.println(e);
		}
	
	
		if(!b)
			return true;
		else
			return false;
	}

	
	
	
public static Registration1 fetchUser(String pass, String uname){
		
	
	
		try {
			
			Connection con =  DBConnection.getConnectivity();
			PreparedStatement ps =  con.prepareStatement("select * from registration where password=? or userName=?");
		  	ps.setString(1, pass);
		  	ps.setString(2, uname);
			
		  	ResultSet rs = ps.executeQuery();
		  	
		 	while(rs.next()){
		 		
		 		user = new Registration1(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));

		 	}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(user!=null)
			return user;
		else
			return null;
	}
	
}
