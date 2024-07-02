<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.ims.dbconnection.*, java.sql.*" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IMS-delete customer</title>
</head>
<body>




	<%
	
		String id1 = request.getParameter("cust_id");
		int i1 = Integer.parseInt(id1);
		Connection con =  DBConnection.getConnectivity();
	  	PreparedStatement ps =  con.prepareStatement("delete from customer where customerId=? ;");
	  	ps.setInt(1, i1);
	  	int flag = ps.executeUpdate();
	  	System.out.println(flag);
	  	
  		
	  	if(flag>0){
	  		response.sendRedirect("displayCustomer.jsp?msg=success ");
	  	}else if(flag<0){
	  		response.sendRedirect("displayCustomer.jsp?msg=failure ");
		}
	  	else{
	  		response.sendRedirect("displayCustomer.jsp?msg=failure ");
		}
	%>
	
	
	<!-- 	 
      <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/mysql" user="root" password="root"  />	
      <sql:update dataSource = "${con}" var = "updt" >DELETE FROM customer WHERE customerId = ?;
         <sql:param value="${i}"/>
      </sql:update>
  	  -->
  
   
  
  
  	
</body>
</html>