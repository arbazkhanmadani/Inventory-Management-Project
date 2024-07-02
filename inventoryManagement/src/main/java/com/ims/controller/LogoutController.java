package com.ims.controller;

import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ims.dbconnection.Registration1;
import com.ims.modal.QueryClass;

@WebServlet("/logoutServlet")
public class LogoutController extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html");
		
		
		try(PrintWriter out = response.getWriter()){
			
			HttpSession hs = request.getSession();
			hs.removeAttribute("ul");
			
			HttpSession hs1 = request.getSession();
			hs1.setAttribute("logedout", "logout");
			//response.sendRedirect("login.jsp");	

			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		catch(Exception e){e.printStackTrace();}
	
	
	}
}
