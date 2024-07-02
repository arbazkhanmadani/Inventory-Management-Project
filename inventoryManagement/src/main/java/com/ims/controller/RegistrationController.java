package com.ims.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ims.dbconnection.DBConnection;
import com.ims.dbconnection.Registration1;
import com.ims.modal.*;

@WebServlet("/register1")
public class RegistrationController extends HttpServlet {

	
	public void doPost(HttpServletRequest request, HttpServletResponse response){
//		response.setContentType("text/html");
		
		String uname = request.getParameter("uname");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		
		
		
		
		try {
			PrintWriter out = response.getWriter();
			
			if(uname=="" && fname=="" && lname=="" && email=="" && pwd=="" ) {
				
				out.println("<h2 style='color:red;'>Error is Coming..........<h1/>");
				RequestDispatcher rd = request.getRequestDispatcher("registration.jsp");
				rd.include(request, response);
				
			}
			else{
				Registration1 reg = new Registration1();
				reg.setUserName(uname);
				reg.setFirstName(fname);
				reg.setLastName(lname);
				reg.setEmailId(email);
				reg.setPassword(pwd);
				
				QueryClass qc = new QueryClass();
				boolean flag = qc.registerUser(reg);
				
				RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
				rd1.forward(request, response);
				
				if(flag){
					out.println("Data added");
				}
				else{
					out.println("Datail not added");	
				}
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
