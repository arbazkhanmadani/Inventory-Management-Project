package com.ims.controller;

import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ims.dbconnection.Registration1;
import com.ims.modal.QueryClass;
import com.ims.dbconnection.*;


@WebServlet("/updateCustomer")
public class UpdateCustomerController extends HttpServlet {


	public void doPost(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html");
		
		int id = Integer.parseInt(request.getParameter("customerId"));
		String fname = request.getParameter("fname");
		fname.trim();
		String lname = request.getParameter("lname");
		lname.trim();
		long number =Long.parseLong(request.getParameter("number"));
		String address = request.getParameter("address");
		String date = request.getParameter("date");
		
		int year = Integer.parseInt(date.substring(0, 4));
		int month = Integer.parseInt(date.substring(5, 7));
		int day = Integer.parseInt(date.substring(8, 10));
        LocalDate ld = LocalDate.of(year, month, day);
		
		
		try{
			
			PrintWriter out = response.getWriter();
			
			if(fname=="" && lname=="" && number<0 && address=="" && date=="" ) {
			
				
				RequestDispatcher rd = request.getRequestDispatcher("updateCustomer.jsp?error=\"Error in updating data\"");
				rd.include(request, response);
			
			}
			else{
				Customer cus = new Customer();
				cus.setCustomerId(id);
				cus.setCustomerName(fname.concat(" "+lname).trim());
				cus.setContactNumber(number);
				cus.setCustomerAddress(address);
				cus.setDateOfPurchase(ld);
			
				QueryClass qc = new QueryClass();
				boolean flag = qc.UpdateCustomer(cus);
			
				RequestDispatcher rd1 = request.getRequestDispatcher("displayCustomer.jsp?success=\"Updated\"");
				rd1.forward(request, response);
			
				if(flag){
					//HttpSession hs = request.getSession();
					//hs.setAttribute("update", "sucess");
				}
				else{
					//HttpSession hs = request.getSession();
					//hs.setAttribute("notUpdate", "failure");
				}
			}
		
		
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
}
