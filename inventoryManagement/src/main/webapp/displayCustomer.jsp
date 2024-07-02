<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, com.ims.dbconnection.*,java.time.LocalDate"  %>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


<%
	Registration1 user = (Registration1)session.getAttribute("ul");
	System.out.println(user+"jsp");
	
	if(user!=null){
%>
	<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
  	<div class="toast-header">
    	<img src="..." class="rounded me-2" alt="">
    	<strong class="me-auto">IMS-Profile</strong>
    	<small><% LocalDate.now(); %></small>
    	<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
  	</div>
  	<div class="toast-body">
		<h6>Hello <%= user.getFirstName()+" "+user.getLastName() %> welcome to IMS</h6>  
	</div>
	</div>		   
<%	
	} if(user==null){
		session.setAttribute("msg", "err");
		response.sendRedirect("login.jsp");
		}
	
%>




<!doctype html>
<html lang="en">
 <head>
    
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <title>IMS-dashboard</title>
    <style>
     .container{
    	position:absolute;
    	top:5%;
    	left:20%;
    	width:90%;
    	
    }
    .btn-anc{
    	transform:translate(50px,50px);
    }
    
    .toast{
    	position:fixed;
    	top:50%;
    	left:50%;
    	background-color:orange;
    	width:30%;
    	z-index:3;
    }
   
    </style>
    </head>
  <body>
<!-- Login Validation................ -->

  
  

     
  <%@include file="dashboard.jsp"  %>
  
   
  <sql:setDataSource var="con1" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/mysql" password="root" user="root"  />
  <sql:query var="rs" dataSource="${con1}">SELECT * FROM customer;</sql:query>
   
   <div class="container ">
     <a href="customerF.jsp" class="btn-anc"><button  class = "btnForm">Add customer</button></a> 
       
  <table class="table" class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Customer Id</th>
      <th scope="col">Customer Name</th>
      <th scope="col">Contact Number</th>
      <th scope="col">Date of Purchase</th>
      <th scope="col">Customer Address</th>
      <th scope="col">Delete &nbsp;&nbsp; Update</th>
    </tr>
  </thead>
  
  <tbody>
  
  	<c:forEach var="col" items="${rs.rows}">
    <tr>
     <th scope="row"><c:out value="${col.customerId}"></c:out></th>
     <th scope="row"><c:out value="${col.customerName}"></c:out></th>
     <th scope="row"><c:out value="${col.contactNumber}"></c:out></th>
     <th scope="row"><c:out value="${col.dateOfAddress}"></c:out></th>
     <th scope="row"><c:out value="${col.customerAddress}"></c:out></th>
     <th><a href='deleteCustomer.jsp?cust_id=${col.customerId}'><button>Delete</button></a>&nbsp;&nbsp;&nbsp;
     <a href='updateCustomer.jsp?cust_id=${col.customerId}'><button>Update</button></a>
     </th>
    </tr>
    </c:forEach>
     </tbody>
     <tfoot>
     	
     	
     	
     </tfoot>
     </table>
      
  </div>
  
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>