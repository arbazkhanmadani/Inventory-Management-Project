package com.ims.controller;

import java.io.PrintWriter;
import java.time.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ims.dbconnection.*;
import com.ims.modal.QueryClass;

@WebServlet("/customer")
public class AddCustomerController extends HttpServlet {

	
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
		
		try {
			PrintWriter out = response.getWriter();
			
			if(fname=="" && lname=="" && address=="" && date==""  ) {
				
				out.println("<h2 style='color:red;'>Error is Coming..........<h1/>");
				RequestDispatcher rd = request.getRequestDispatcher("registration.jsp");
				rd.include(request, response);
				
			}
			else{
				Customer cus = new Customer();
			
				cus.setCustomerId(id);
				cus.setCustomerName(lname.trim().concat(" "+fname.trim()).trim());
				cus.setContactNumber(number);
				cus.setCustomerAddress(address);
				cus.setDateOfPurchase(ld);
				
				
				QueryClass qc = new QueryClass();
				boolean flag = qc.Addcustomer(cus);
				
				//HttpSession session = request.getSession();
				//session.setAttribute("customer_id", ld);
				RequestDispatcher rd1 = request.getRequestDispatcher("displayCustomer.jsp");
				rd1.forward(request, response);
				
				if(flag){
					//out.println("Data added");
				}
				else{
					//out.println("Datais not added");	
				}
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
