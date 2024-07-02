package com.ims.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ims.dbconnection.Registration1;
import com.ims.modal.*;
@WebServlet("/loginServlet")
public class LoginController extends HttpServlet {
//
//	public Registration1 processRequest(HttpServletRequest request, HttpServletResponse response){
////		response.setContentType("text/html");
////		
////			
////		return user;
////		}
////		catch(Exception e){e.printStackTrace();
////		return new Registration1();
////		}
//	
//	
//	}
//	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
//		response.setContentType("text/html");
		
		LoginController lc = new LoginController();
//		Registration1 user = lc.processRequest(request,response);

		String iptPassword = request.getParameter("pwd");
		String iptUname = request.getParameter("uname");
		
		System.out.println(iptPassword+"ip");
		
//		try(PrintWriter out = response.getWriter()){
			
			QueryClass qc =new QueryClass();
			Registration1 user = qc.fetchUser(iptPassword,iptUname);
			System.out.println(user+" servlet");
			
			System.out.println(user.getPassword()+"up");
			
		if(request.getParameter("pwd").equals(user.getPassword())){
			System.out.println(user+" servlet if");
			
		    HttpSession hs = request.getSession();
		    hs.setAttribute("ul", user);
		    System.out.println("last user"+user);
		    request.getRequestDispatcher("displayCustomer.jsp").forward(request, response);
//			response.sendRedirect("displayCustomer.jsp");
		}
		else{
			System.out.println(user+" servlet else");			
			HttpSession hs2 = request.getSession();
			hs2.setAttribute("uli", "invalid");
			
			//response.sendRedirect("login.jsp");
				
					
		}
	}
}