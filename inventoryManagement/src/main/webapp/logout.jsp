<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IMS-logout</title>
</head>
<body>

<%
	
	request.getRequestDispatcher("logoutServlet").forward(request, response);
System.out.println("Log out jsp");
%>
</body>
</html>