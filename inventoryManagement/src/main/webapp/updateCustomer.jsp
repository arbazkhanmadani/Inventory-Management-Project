<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*, com.ims.dbconnection.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <!-- custome css  -->
    <link rel="stylesheet" href="./loginForm.css">
    <title>Registration</title>
 </head>   
<body>


<%
	
		/*String id1 = request.getParameter("cust_id");
		String trimmedId1 = id1.substring(1, 2);
		int i1 = Integer.parseInt(trimmedId1);
		Connection con1 =  DBConnection.getConnectivity();
	  	PreparedStatement ps1 =  con1.prepareStatement("update from customer SET customerName=?, contactNumber=?, customerAddress=?, dateOfAddress=? where customerId=? ;");
	  	ps1.setInt(1, i1);
	  	int flag1 = ps1.executeUpdate();
	  	System.out.println(flag1);
	  	
  		
	  	if(flag1>0){
	  		response.sendRedirect("displayCustomer.jsp?msg=success ");
	  	}else if(flag1<0){
	  		response.sendRedirect("displayCustomer.jsp?msg=failure ");
		}
	  	else{
	  		response.sendRedirect("displayCustomer.jsp?msg=failure ");
		}*/
	%>
	

<%
	
		String id = request.getParameter("cust_id");
		//String trimmedId = id.substring(1, 2);
		int i = Integer.parseInt(id);
		Connection con =  DBConnection.getConnectivity();
	  	PreparedStatement ps =  con.prepareStatement("select * from Customer where customerId=?");
	  	ps.setInt(1, i);
	  	ResultSet rs = ps.executeQuery();
	  	System.out.println(rs);
	  	
	 	int id1=0;
	 	long num=0;
	 	String address ="";
	 	String date ="";
	  	String name ="";
	  	String fname = "";
	  	String lname ="";
  		while(rs.next()){
  			id1 = rs.getInt(1);
  			name = rs.getString(2);
  	  		num = rs.getLong(3);
	  		address = rs.getString(4);
	  		date = rs.getString(5);
  		
  		}
  		
  		String[] namear = name.split(" ");
  			fname = namear[0].trim();
  			lname = namear[1].trim();
  			System.out.println(fname);
  			System.out.println(lname);
  	  		
  			if(rs!=null){
	  		//response.sendRedirect("displayCustomer.jsp?msg=success ");
	  	}else if(rs==null){
	  		//response.sendRedirect("displayCustomer.jsp?msg=failure ");
		}
	  	else{
	  		//response.sendRedirect("displayCustomer.jsp?msg=failure ");
		}
	%>
 <div class="main-parent">
        <div class="form-wrap">
            <form action="updateCustomer" method="post">
                <h1><span>Customer</span></h1>
                
                <div class="single-input">
                    <input id="fname" type="number" value="<%=id1 %>" placeholder="enter the id" name="customerId">
                </div>
                <div class="single-input">
                    <input id="fname" type="text"  value="<%= lname %>" placeholder="First name" name="fname">
                </div>
                <div class="single-input">
                    <input id="lname" type="text"  value="<%= fname %>" placeholder="Last name" name="lname">
                </div>
                <div class="single-input">
                    <input id="fname" type="text" value="<%= num %>" placeholder="Enter your contact number" name="number">
                </div>
                <div class="single-input">
                    <input id="fname" type="date" value="<%= date %>" placeholder="Enter your date" name="date">
                </div>
         	    <div class="single-input">
                    <textarea rows="5" cols=41" placeholder="Enter your full address" name="address"><%= address %></textarea>
                </div>
                <div class="submit-button">
                    <button class="button" type="submit">Submit</button>
                </div>
                <div class="account-have">
                    <a href="login.jsp">Have an account please Login</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>